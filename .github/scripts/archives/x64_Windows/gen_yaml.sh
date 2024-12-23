#!/usr/bin/env bash

# bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x64_Windows/gen_yaml.sh")
# To cleanup: find . -type f -regex '.*\.yaml$' -print -delete

#-------------------------------------------------------#
##ENV
 SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
 BUILDSCRIPT="$(mktemp --tmpdir=$SYSTMP XXXXX_build.sh)" && export BUILDSCRIPT="$BUILDSCRIPT"
 YAML_DIR="$(mktemp -d)" && export YAML_DIR="${YAML_DIR}"
 CWD="$(realpath .)" && export CWD="${CWD}"
 #Get URlS
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x64_Windows/bins/metadata.json" | jq -r '.[].source_url' | grep -i "\.ps1$" | sort -u -o "$SYSTMP/BUILDURLS"
 #Metadata
 curl -qfsSL "https://bin.ajam.dev/x64_Windows/METADATA.json" -o "$SYSTMP/METADATA.json"
 curl -qfsSL "https://bin.ajam.dev/x64_Windows/Baseutils/METADATA.json" -o "$SYSTMP/METADATA_BASEUTILS.json"
#-------------------------------------------------------#

#-------------------------------------------------------#
##Run
cd "${YAML_DIR}"
generate_yaml() 
{
    local name="$1"
    local description="$2"
    local web_url="$3"
    local repo_url="$4"
    local n_bins=("${@:5}")
    echo "name: \"$name\""
    echo "description: \"$description\""
    echo "web_url: \"$web_url\""
    echo "repo_url: \"$repo_url\""
    echo "bins:"
    for n_bin in "${n_bins[@]}"; do
        echo "  - \"$n_bin\""
    done
}
export -f generate_yaml
for BUILD_URL in $(cat "$SYSTMP/BUILDURLS"); do
   #Init
    echo -e "\n[+] Fetching : $BUILD_URL"
    NAME_S="$(echo $BUILD_URL | sed 's|.*/||; s|\.ps1$||' | sed 's/`//g' | tr -d '[:space:]')" && export NAME_S="${NAME_S}"
   #Fetch 
    curl -qfsSL "$BUILD_URL" -o "$BUILDSCRIPT"
   #Name
    NAME=$(cat "$BUILDSCRIPT" | awk '/if \(\$env:SKIP_BUILD -eq "NO"\) {/,/}/ {if ($0 !~ /(if \(\$env:SKIP_BUILD -eq "NO"\) {|})/ && NR!=1 && NR!=2) print}' | sed 's/^[ \t]*//;s/[ \t]*$//' | awk -F '#|:' 'NR==1{gsub(/^[ \t]*|[ \t]*$/, "", $2); gsub(/^[ \t]*|[ \t]*$/, "", $3); print $2}' | sed 's/["'\'']//g' | sed 's/`//g' | tr -d '[:space:]') && export NAME="${NAME}"
    echo "Name: ${NAME}"
   #Description 
    DESCRIPTION="$(cat "$BUILDSCRIPT" | awk '/if \(\$env:SKIP_BUILD -eq "NO"\) {/,/}/ {if ($0 !~ /(if \(\$env:SKIP_BUILD -eq "NO"\) {|})/ && NR!=1 && NR!=2) print}' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/:/PLACEHOLDER/; s/:/ /g; s/PLACEHOLDER/:/' | awk -F '#|:' 'NR==1{gsub(/^[ \t]*|[ \t]*$/, "", $2); gsub(/^[ \t]*|[ \t]*$/, "", $3); print $3}' | sed 's/["'\'']//g' | sed 's/`//g')" && export DESCRIPTION="${DESCRIPTION}"
    echo "Description: ${DESCRIPTION}"
   #WEB_URL
    WEB_URL="$(cat "$BUILDSCRIPT" | grep -o '$env:SOURCE_URL = "\([^"]*\)"' | sed 's/$env:SOURCE_URL = "\(.*\)"/\1/' | sed 's/ //g' | sed 's/["'\'']//g' | sed 's/`//g' | tr -d '[:space:]')" && export WEB_URL="${WEB_URL}" ; echo "WEB_URL: ${WEB_URL}"
    if [[ "${WEB_URL}" =~ git ]]; then
         export REPO_URL="${WEB_URL}"
         echo "REPO_URL: ${REPO_URL}"
    else
         export REPO_URL=""
    fi    
   #Bin
    BIN_ARRAY="$(cat $SYSTMP/METADATA.json | jq -r --arg WEB_URL "$WEB_URL" '.[] | select(.web_url == $WEB_URL) | .Name' | sed 's/`//g' | sort -u)" && export BIN_ARRAY="${BIN_ARRAY[@]}"
    echo "BIN : ${BIN_ARRAY//[$'\n']/ }"
   #Generate YAML
    readarray -t BIN_ARRAY <<< "${BIN_ARRAY}"
    generate_yaml "$NAME" "$DESCRIPTION" "$WEB_URL" "$REPO_URL" "${BIN_ARRAY[@]}" | yq . --no-colors > "${YAML_DIR}/${NAME_S}.yaml"
done
##Check
cd "${YAML_DIR}"
for file in *.yaml; do
    if [ -z "$(yq eval '.bins[]' "$file")" ]; then
        echo "$file --> $file.empty" && mv "$file" "${file}.empty"
    fi
done
##Archive
tar --create --directory="$SYSTMP" --file="${YAML_DIR}.tar" "${YAML_DIR}"
echo -e "\nArchive: tar --strip-components=1 $(realpath ${YAML_DIR}.tar)"
echo "Dir: cd $(realpath ${YAML_DIR})"
cd "${CWD}"
#-------------------------------------------------------#