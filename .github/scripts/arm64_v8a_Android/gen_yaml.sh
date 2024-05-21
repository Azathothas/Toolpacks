#!/usr/bin/env bash

# bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/arm64_v8a_Android/gen_yaml.sh")
# To cleanup: find . -type f -regex '.*\.yaml$' -print -delete

#-------------------------------------------------------#
##ENV
 SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
 BUILDSCRIPT="$(mktemp --tmpdir=$SYSTMP XXXXX_build.sh)" && export BUILDSCRIPT="$BUILDSCRIPT"
 YAML_DIR="$(mktemp -d)" && export YAML_DIR="${YAML_DIR}"
 CWD="$(realpath .)" && export CWD="${CWD}"
 #Get URlS
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/arm64_v8a_Android/bins/metadata.json" | jq -r '.[].Source' | grep -i "\.sh$" | sort -u -o "$SYSTMP/BUILDURLS"
 #Metadata
 curl -qfsSL "https://bin.ajam.dev/arm64_v8a_Android/METADATA.json" -o "$SYSTMP/METADATA.json"
 curl -qfsSL "https://bin.ajam.dev/arm64_v8a_Android/Baseutils/METADATA.json" -o "$SYSTMP/METADATA_BASEUTILS.json"
#-------------------------------------------------------#

#-------------------------------------------------------#
##Run
cd "${YAML_DIR}"
generate_yaml() 
{
    local name="$1"
    local description="$2"
    local url="$3"
    local n_bins=("${@:4}")
    echo "name: \"$name\""
    echo "description: \"$description\""
    echo "url: \"$url\""
    echo "bins:"
    for n_bin in "${n_bins[@]}"; do
        echo "  - \"$n_bin\""
    done
}
export -f generate_yaml
for BUILD_URL in $(cat "$SYSTMP/BUILDURLS"); do
   #Init
    echo -e "\n[+] Fetching : $BUILD_URL"
    NAME_S="$(echo $BUILD_URL | sed 's|.*/||; s|\.sh$||' | sed 's/`//g' | tr -d '[:space:]')" && export NAME_S="${NAME_S}"
   #Fetch 
    curl -qfsSL "$BUILD_URL" -o "$BUILDSCRIPT"
   #Name
    NAME="$(cat "$BUILDSCRIPT" | awk '/if \[ "\$SKIP_BUILD" == "NO" \]; then/,/export BIN=/ {if ($0 !~ /(if \[ "\$SKIP_BUILD" == "NO" \]; then|export BIN=)/ && NR!=1 && NR!=2) print}' | sed 's/^[ \t]*//;s/[ \t]*$//' | awk -F '#|:' 'NR==1{gsub(/^[ \t]*|[ \t]*$/, "", $2); gsub(/^[ \t]*|[ \t]*$/, "", $3); print $2}' | sed 's/["'\'']//g' | sed 's/`//g' | tr -d '[:space:]')" && export NAME="${NAME}"
    echo "Name: ${NAME}"
   #Description 
    DESCRIPTION="$(cat "$BUILDSCRIPT" | awk '/if \[ "\$SKIP_BUILD" == "NO" \]; then/,/export BIN=/ {if ($0 !~ /(if \[ "\$SKIP_BUILD" == "NO" \]; then|export BIN=)/ && NR!=1 && NR!=2) print}' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/:/PLACEHOLDER/; s/:/ /g; s/PLACEHOLDER/:/' | awk -F '#|:' 'NR==1{gsub(/^[ \t]*|[ \t]*$/, "", $2); gsub(/^[ \t]*|[ \t]*$/, "", $3); print $3}' | sed 's/["'\'']//g' | sed 's/`//g')" && export DESCRIPTION="${DESCRIPTION}"
    echo "Description: ${DESCRIPTION}"
   #URL
    URL="$(cat "$BUILDSCRIPT" | grep -o 'export SOURCE_URL="\([^"]*\)"' | sed 's/export SOURCE_URL="\(.*\)"/\1/' | sed 's/ //g' | sed 's/["'\'']//g' | sed 's/`//g' | tr -d '[:space:]')" && export URL="${URL}"
    echo "URL: ${URL}"
   #Bin
    BIN_ARRAY="$(cat $SYSTMP/METADATA.json | jq -r --arg URL "$URL" '.[] | select(.Repo == $URL) | .Name' | sed 's/`//g' | sort -u)" && export BIN_ARRAY="${BIN_ARRAY[@]}"
    echo "BIN : ${BIN_ARRAY//[$'\n']/ }"
   #Generate YAML 
    readarray -t BIN_ARRAY <<< "${BIN_ARRAY}"
    generate_yaml "$NAME" "$DESCRIPTION" "$URL" "${BIN_ARRAY[@]}" | yq . --no-colors > "${YAML_DIR}/${NAME_S}.yaml"
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