#!/usr/bin/env bash

# export GITHUB_TOKEN="NON_PRIVS_READ_ONLY_TOKEN"
# bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/gen_meta.sh")
# bash <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/refs/heads/main/.github/scripts/aarch64_Linux/gen_meta.sh")

#-------------------------------------------------------#
##ENV
SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
TMPDIR="$(mktemp -d)" && export TMPDIR="$TMPDIR" ; echo -e "\n[+] Using TEMP: $TMPDIR\n"
BUILDYAML="$(mktemp --tmpdir=$TMPDIR XXXXX.yaml)" && export BUILDYAML="$BUILDYAML"
#Get URlS
curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/metadata.json" | jq -r '.[].source_url' | sed 's/\.sh$/\.yaml/' | grep -i '\.yaml$' | sort -u -o "$TMPDIR/BUILDURLS"
#Get METADATA.json (bin.ajam.dev/aarch64_arm64_Linux)
curl -qfsSL "https://bin.ajam.dev/aarch64_arm64_Linux/METADATA.json.tmp" -o "$TMPDIR/METADATA.json" || curl -qfsSL "https://bin.ajam.dev/aarch64_arm64_Linux/METADATA.json" -o "$TMPDIR/METADATA.json"
#Get BLAKE3SUM.txt
curl -qfsSL "https://bin.ajam.dev/aarch64_arm64_Linux/BLAKE3SUM.txt" -o "$TMPDIR/BLAKE3SUM.txt"
#Get SHA256SUM.txt
curl -qfsSL "https://bin.ajam.dev/aarch64_arm64_Linux/SHA256SUM.txt" -o "$TMPDIR/SHA256SUM.txt"
#Get BUILD.BIN.log.txt
curl -qfsSL "https://bin.ajam.dev/aarch64_arm64_Linux/BUILD.BIN.log.txt" -o "$SYSTMP/BUILD.log"
sed -e '/.*github_pat.*/Id' \
        -e '/.*ghp_.*/Id' \
        -e '/.*glpat.*/Id' \
        -e '/.*hf_.*/Id' \
        -e '/.*token.*/Id' \
        -e '/.*access_key_id.*/Id' \
        -e '/.*secret_access_key.*/Id' \
        -e '/.*cloudflarestorage.*/Id' -i "$SYSTMP/BUILD.log"
sed 's/\r/\n/g' -i "$SYSTMP/BUILD.log"
rm -rf "${SYSTMP}/BIN_LOGS" 2>/dev/null ; mkdir -p "${SYSTMP}/BIN_LOGS"
##gh previews
rm -rf "${SYSTMP}/GH_TMP" 2>/dev/null ; mkdir -p "${SYSTMP}/GH_TMP"
##tldr
rm -rf "${SYSTMP}/TLDR" 2>/dev/null ; mkdir -p "${SYSTMP}/TLDR"
tealdeer --seed-config 2>/dev/null ; tealdeer --update
##Sanity
if [[ -n "$GITHUB_TOKEN" ]]; then
   echo -e "\n[+] GITHUB_TOKEN is Exported"
else
   # 60 req/hr
   echo -e "\n[-] GITHUB_TOKEN is NOT Exported"
   echo -e "Export it to avoid ratelimits\n"
   exit 1
fi
if command -v rclone &> /dev/null; then
  if [ -s "$HOME/.rclone.conf" ] || [ -s "$HOME/.config/rclone/rclone.conf" ]; then
     rclone lsd "r2:/bin" --fast-list
  else
     echo -e "\n[-] rClone Not Configured\n"
   exit 1  
  fi
else
  echo -e "\n[-] rClone Not Installed\n"
 exit 1 
fi
if [ ! -s "$TMPDIR/BUILDURLS" ] || [ ! -s "$TMPDIR/METADATA.json" ] || [ ! -s "$TMPDIR/BLAKE3SUM.txt" ] || [ ! -s "$TMPDIR/SHA256SUM.txt" ]; then
     echo -e "\n[-] Required Files Aren't Available\n"
   exit 1  
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Run
echo -e "\n\n [+] Started Metadata Update at :: $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
 for BUILD_URL in $(cat "$TMPDIR/BUILDURLS" | sed 's/"//g'); do
   echo -e "\n[+] Fetching : $BUILD_URL"
    if curl -qfsSL "$BUILD_URL" -o "$BUILDYAML" &> /dev/null; then
       dos2unix --quiet "$BUILDYAML"
      #Sanity Check 
      if [ "$(yq e '.path' "$BUILDYAML")" = "/" ]; then
         #C_NAME
          C_NAME="$(echo ${BUILD_URL} | sed -n 's|.*\/bins/\(.*\)\.yaml$|\1|p')" && export C_NAME="${C_NAME}"      
         #export BIN= 
          yq -r '.bins[]' "$BUILDYAML" | sort -u -o "$TMPDIR/BINS.txt"
         #export Description (Descr)
          DESCRIPTION="$(yq -r '.description' $BUILDYAML)" && export DESCRIPTION="$DESCRIPTION"
         #export Build Script
          BUILD_SCRIPT="$(echo "$BUILD_URL" | sed 's|https://pub.ajam.dev/repos|https://github.com|; s|/Toolpacks|/Toolpacks/tree/main|; s|\.yaml$|.sh|')" && export BUILD_SCRIPT="$BUILD_SCRIPT"
         #export Notes (Note)
          NOTE="$(yq -r '.note' $BUILDYAML)" && export NOTE="$NOTE"
         #export WEB_URL (WebURL)
          WEB_URL="$(yq -r '.web_url' $BUILDYAML)" && export WEB_URL="$WEB_URL"
         #export REPO_URL 
          REPO_URL="$(yq -r '.repo_url' $BUILDYAML)" && export REPO_URL="$REPO_URL"
         #Git Ops
          if [[ "$REPO_URL" == https://github.com* ]]; then
           #Fetch 
            REPO_NAME="$(echo ${REPO_URL} | sed 's|^https://github.com/||' | sed 's/|//g' | sed 's/\s//g' | tr -d '[:space:]')" && export REPO_NAME="${REPO_NAME}"
            REPO_METADATA="$(curl -qfsSL "https://api.github.com/repos/$REPO_NAME" -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null)" && export REPO_METADATA="$REPO_METADATA"
            RELEASE_METADATA="$(curl -qfsSL "https://api.github.com/repos/$REPO_NAME/releases/latest" -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null | jq '.assets=""')" && export RELEASE_METADATA="$RELEASE_METADATA"
           #Parse
            #REPO_NAME="$(echo $REPO_METADATA | jq -r '.name' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/`//g')" && export REPO_NAME="$REPO_NAME"
            REPO_AUTHOR="$(echo $REPO_METADATA | jq -r '.owner.login' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g')" && export REPO_AUTHOR="$REPO_AUTHOR"
            REPO_DESCRIPTION="$(echo $REPO_METADATA | jq -r '.description' | sed 's/`//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed ':a;N;$!ba;s/\r\n//g; s/\n//g' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g')" && export REPO_DESCRIPTION="$REPO_DESCRIPTION"
            REPO_LANGUAGE="$(echo $REPO_METADATA | jq -r '.language' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g')" && export REPO_LANGUAGE="$REPO_LANGUAGE"
            REPO_LICENSE="$(echo $REPO_METADATA | jq -r '.license.name' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g')" && export REPO_LICENSE="$REPO_LICENSE"
            #Get Preview Images
            REPO_IMG="$(curl -qfsSL "${REPO_URL}" -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null | grep -oP '(?<=property="og:image" content=")[^"]+' | tr -d '[:space:]' | grep -im1 "repository-images")" && export REPO_IMG="${REPO_IMG}"
            [ -n "${REPO_IMG+x}" ] && [ -n "${REPO_IMG}" ] && curl -qfsSL "${REPO_IMG}" -o "${SYSTMP}/GH_TMP/${C_NAME}.preview.png" 2>/dev/null
            #Last Updated          
            LAST_UPDATED="$(echo $REPO_METADATA | jq -r '.pushed_at' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g' | tr -d '[:space:]')" && export LAST_UPDATED="$LAST_UPDATED"
           #If Releases don't exist, use tags
            if [ -z "$RELEASE_METADATA" ]; then
               PKG_VERSION="$(curl -qfsSL "https://api.github.com/repos/$REPO_NAME/tags" -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null | jq -r '.[0].name' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g' | tr -d '[:space:]')" && export PKG_VERSION="$PKG_VERSION"
               PKG_RELEASED="$(curl -qfsSL "https://api.github.com/repos/$REPO_NAME/git/refs/tags/$PKG_VERSION" -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null | jq '.object.url' | xargs curl -qfsSL -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null | jq -r '.committer.date' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g' | tr -d '[:space:]')" && export PKG_RELEASED="$PKG_RELEASED"
            else
               PKG_VERSION="$(echo $RELEASE_METADATA | jq -r '.tag_name' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g' | tr -d '[:space:]')" && export PKG_VERSION="$PKG_VERSION"
               PKG_RELEASED="$(echo $RELEASE_METADATA | jq -r '.published_at' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g' | tr -d '[:space:]')" && export PKG_RELEASED="$PKG_RELEASED"
            fi
            #REPO_URL="$(echo $REPO_METADATA | jq -r '.html_url' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/`//g' | tr -d '[:space:]')" && export REPO_URL="$REPO_URL"
            REPO_STARS="$(echo $REPO_METADATA | jq -r '.stargazers_count' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g' | tr -d '[:space:]')" && export REPO_STARS="$REPO_STARS"
            REPO_TOPICS="$(echo "$REPO_METADATA" | jq -c -r '.topics' | tr -d '[]' | sed 's/, /, /g' | sed 's/,/, /g' | sed 's/|//g' | sed 's/"//g')" && export REPO_TOPICS="$REPO_TOPICS"
          else
            unset REPO_URL REPO_NAME REPO_METADATA RELEASE_METADATA REPO_AUTHOR REPO_DESCRIPTION REPO_LANGUAGE REPO_LICENSE LAST_UPDATED PKG_VERSION PKG_RELEASED REPO_STAR REPO_TOPICS
          fi
         #Merge with json
          for BIN in $(cat "$TMPDIR/BINS.txt" | sed 's/"//g'); do
            [ -n "${BIN}" ] || exit 1
            #Description
             jq --arg BIN "$BIN" --arg DESCRIPTION "$DESCRIPTION" '.[] |= if .name == $BIN then . + {description: $DESCRIPTION} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
            #Note
             jq --arg BIN "$BIN" --arg NOTE "$NOTE" '.[] |= if .name == $BIN then . + {note: $NOTE} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
            #Extras (All Bins)
             EXTRA_BINS="$(cat $TMPDIR/BINS.txt | sed "/^$BIN$/d" | paste -sd ',' -)" && export EXTRA_BINS="${EXTRA_BINS}"  
             jq --arg BIN "$BIN" --arg EXTRA_BINS "$EXTRA_BINS" '.[] |= if .name == $BIN then . + {extra_bins: $EXTRA_BINS} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
            #BSUM
             B3SUM="$(cat "$TMPDIR/BLAKE3SUM.txt" | grep -E "^[a-f0-9]+[[:space:]]+(\./)?${BIN}$" | awk '{print $1}' | sort  -u | head -n 1 | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g' | tr -d '[:space:]')" && export B3SUM="$B3SUM"
             jq --arg BIN "$BIN" --arg B3SUM "$B3SUM" '.[] |= if .name == $BIN then . + {b3sum: $B3SUM} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
            #SHA256SUM
             SHA256="$(cat "$TMPDIR/SHA256SUM.txt" | grep -E "^[a-f0-9]+[[:space:]]+(\./)?${BIN}$" | awk '{print $1}' | sort  -u | head -n 1 | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/|//g' | sed 's/`//g' | tr -d '[:space:]')" && export SHA256="$SHA256"
             jq --arg BIN "$BIN" --arg SHA256 "$SHA256" '.[] |= if .name == $BIN then . + {sha256: $SHA256} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
            #Web URLs
             jq --arg BIN "$BIN" --arg WEB_URL "$WEB_URL" '.[] |= if .name == $BIN then . + {web_url: $WEB_URL} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
            #Build Log
             if [ -f "$SYSTMP/BUILD.log" ] && [ $(stat -c%s "$SYSTMP/BUILD.log") -gt 10240 ]; then
               LOG_MATCH="$(echo "${BUILD_SCRIPT}" | sed 's|https://github.com/Azathothas/Toolpacks/tree/main|https://pub.ajam.dev/repos/Azathothas/Toolpacks|')" && export LOG_MATCH="${LOG_MATCH}"
               #LOG_BIN="$(echo "${BIN}" | sed 's/\.no_strip$//')" && export LOG_BIN="${LOG_BIN}"
               LOG_BIN="$(echo "${BIN}")" && export LOG_BIN="${LOG_BIN}"
               LOG_BEGIN="$(grep -nE "^\[\+\] (Building|Fetching) \: ${LOG_MATCH}" "$SYSTMP/BUILD.log" | head -n 1 | cut -d: -f1)" && export LOG_BEGIN="${LOG_BEGIN}"
               LOG_END="$(awk -v start="$LOG_BEGIN" 'NR > start && /.*Completed \(Building\|Fetching\).*/ {print NR; exit}' "$SYSTMP/BUILD.log")" && export LOG_END="${LOG_END}"
               if [ -n "${LOG_BEGIN}" ] && [ -n "${LOG_END}" ]; then
                 sed -n "${LOG_BEGIN},${LOG_END}p" "$SYSTMP/BUILD.log" > "${SYSTMP}/BIN_LOGS/${BIN}.log.txt"
                 cat "${SYSTMP}/BIN_LOGS/${BIN}.log.txt" >> "${SYSTMP}/BIN_LOGS/${C_NAME}.log.txt"
                 if [ -f "${SYSTMP}/BIN_LOGS/${C_NAME}.log.txt" ] && [ $(stat -c%s "${SYSTMP}/BIN_LOGS/${C_NAME}.log.txt") -gt 10 ]; then
                   BUILD_LOG="$(jq --arg BIN "$BIN" -r '.[] | select(.name == $BIN) | .download_url' "$TMPDIR/METADATA.json" | sed 's/\.no_strip$//').log.txt"
                   jq --arg BIN "$BIN" --arg BUILD_LOG "$BUILD_LOG" '.[] |= if .name == $BIN then . + {build_log: $BUILD_LOG} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
                 else
                   jq --arg BIN "$BIN" --arg BUILD_LOG "https://bin.ajam.dev/aarch64_arm64_Linux/BUILD.log.txt" '.[] |= if .name == $BIN then . + {build_log: $BUILD_LOG} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
                 fi
               fi
             else
               jq --arg BIN "$BIN" --arg BUILD_LOG "https://bin.ajam.dev/aarch64_arm64_Linux/BUILD.log.txt" '.[] |= if .name == $BIN then . + {build_log: $BUILD_LOG} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             fi
            #Build_Script
             jq --arg BIN "$BIN" --arg BUILD_SCRIPT "$BUILD_SCRIPT" '.[] |= if .name == $BIN then . + {build_script: $BUILD_SCRIPT} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
            #TLDR
             tealdeer --no-auto-update --quiet --raw "${BIN}" > "${SYSTMP}/TLDR/${C_NAME}.tldr.md"
             if [ -f "${SYSTMP}/TLDR/${C_NAME}.tldr.md" ] && [ $(stat -c%s "${SYSTMP}/TLDR/${C_NAME}.tldr.md") -lt 10 ]; then
               tealdeer --no-auto-update --quiet --raw "${C_NAME}" > "${SYSTMP}/TLDR/${C_NAME}.tldr.md"
                 if [ -f "${SYSTMP}/TLDR/${C_NAME}.tldr.md" ] && [ $(stat -c%s "${SYSTMP}/TLDR/${C_NAME}.tldr.md") -lt 10 ]; then
                   tealdeer --no-auto-update --quiet --raw "${C_NAME%%-*}" > "${SYSTMP}/TLDR/${C_NAME}.tldr.md"
                 fi
             fi
            #Git Meta
             if [ -n "${REPO_URL}" ] && [[ "${REPO_URL}" == https://github.com* ]]; then
             #$REPO_AUTHOR repo_author
               jq --arg BIN "$BIN" --arg REPO_AUTHOR "$REPO_AUTHOR" '.[] |= if .name == $BIN then . + {repo_author: $REPO_AUTHOR} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             #$REPO_DESCRIPTION repo_info
               jq --arg BIN "$BIN" --arg REPO_DESCRIPTION "$REPO_DESCRIPTION" '.[] |= if .name == $BIN then . + {repo_info: $REPO_DESCRIPTION} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             #$REPO_LANGUAGE repo_language
               jq --arg BIN "$BIN" --arg REPO_LANGUAGE "$REPO_LANGUAGE" '.[] |= if .name == $BIN then . + {repo_language: $REPO_LANGUAGE} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             #$REPO_LICENSE repo_license
               jq --arg BIN "$BIN" --arg REPO_LICENSE "$REPO_LICENSE" '.[] |= if .name == $BIN then . + {repo_license: $REPO_LICENSE} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             #$LAST_UPDATED repo_updated
               jq --arg BIN "$BIN" --arg LAST_UPDATED "$LAST_UPDATED" '.[] |= if .name == $BIN then . + {repo_updated: $LAST_UPDATED} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             #$PKG_RELEASED repo_released
               jq --arg BIN "$BIN" --arg PKG_RELEASED "$PKG_RELEASED" '.[] |= if .name == $BIN then . + {repo_released: $PKG_RELEASED} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             #$PKG_VERSION repo_version
               jq --arg BIN "$BIN" --arg PKG_VERSION "$PKG_VERSION" '.[] |= if .name == $BIN then . + {repo_version: $PKG_VERSION} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             #$REPO_URL repo_url
               jq --arg BIN "$BIN" --arg REPO_URL "$REPO_URL" '.[] |= if .name == $BIN then . + {repo_url: $REPO_URL} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             #$REPO_STARS repo_url
               jq --arg BIN "$BIN" --arg REPO_STARS "$REPO_STARS" '.[] |= if .name == $BIN then . + {repo_stars: $REPO_STARS} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             #$REPO_TOPICS repo_topics
               jq --arg BIN "$BIN" --arg REPO_TOPICS "$REPO_TOPICS" '.[] |= if .name == $BIN then . + {repo_topics: $REPO_TOPICS} else . end' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             #Sort & Map
               jq 'map({name: (.name // "" | if . == null or . == "" then "" else . end), description: (.description // "" | if . == null or . == "" then "" else . end),note: (.note // "" | if . == null or . == "" then "" else . end), download_url: (.download_url // "" | if . == null or . == "" then "" else . end), size: (.size // "" | if . == null or . == "" then "" else . end), b3sum: (.b3sum // "" | if . == null or . == "" then "" else . end), sha256: (.sha256 // "" | if . == null or . == "" then "" else . end), build_date: (.build_date // "" | if . == null or . == "" then "" else . end), repo_url: (.repo_url // "" | if . == null or . == "" then "" else . end), repo_author: (.repo_author // "" | if . == null or . == "" then "" else . end), repo_info: (.repo_info // "" | if . == null or . == "" then "" else . end), repo_updated: (.repo_updated // "" | if . == null or . == "" then "" else . end), repo_released: (.repo_released // "" | if . == null or . == "" then "" else . end), repo_version: (.repo_version // "" | if . == null or . == "" then "" else . end), repo_stars: (.repo_stars // "" | if . == null or . == "" then "" else . end), repo_language: (.repo_language // "" | if . == null or . == "" then "" else . end), repo_license: (.repo_license // "" | if . == null or . == "" then "" else . end), repo_topics: (.repo_topics // "" | if . == null or . == "" then "" else . end), web_url: (.web_url // "" | if . == null or . == "" then "" else . end),build_script: (.build_script // "" | if . == null or . == "" then "" else . end),build_log: (.build_log // "" | if . == null or . == "" then "" else . end), extra_bins: (.extra_bins // "" | if . == null or . == "" then "" else . end)})' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             else
             #Sort & Map
               jq 'map({name: (.name // "" | if . == null or . == "" then "" else . end), description: (.description // "" | if . == null or . == "" then "" else . end), note: (.note // "" | if . == null or . == "" then "" else . end), download_url: (.download_url // "" | if . == null or . == "" then "" else . end), size: (.size // "" | if . == null or . == "" then "" else . end), b3sum: (.b3sum // "" | if . == null or . == "" then "" else . end), sha256: (.sha256 // "" | if . == null or . == "" then "" else . end), build_date: (.build_date // "" | if . == null or . == "" then "" else . end), repo_url: (.repo_url // "" | if . == null or . == "" then "" else . end), web_url: (.web_url // "" | if . == null or . == "" then "" else . end), build_script: (.build_script // "" | if . == null or . == "" then "" else . end), build_log: (.build_log // "" | if . == null or . == "" then "" else . end), extra_bins: (.extra_bins // "" | if . == null or . == "" then "" else . end)})' "$TMPDIR/METADATA.json" > "$TMPDIR/METADATA.tmp" && mv "$TMPDIR/METADATA.tmp" "$TMPDIR/METADATA.json"
             fi
            #Print json
            echo -e "\n[+] BIN: $BIN"
            jq --arg BIN "$BIN" '.[] | select(.name == $BIN)' "$TMPDIR/METADATA.json" 2>/dev/null | tee "$TMPDIR/METADATA.json.bak.tmp"
            #Append
            if jq --exit-status . "$TMPDIR/METADATA.json.bak.tmp" >/dev/null 2>&1; then
               cat "$TMPDIR/METADATA.json.bak.tmp" >> "$TMPDIR/METADATA.json.bak"
            fi
          done
      fi
    fi
 done
#-------------------------------------------------------#

#-------------------------------------------------------#
#Update R2
echo -e "\n[+] Updating Metadata.json ($(realpath $TMPDIR/METADATA.json))\n"
if jq --exit-status . "$TMPDIR/METADATA.json.bak" >/dev/null 2>&1; then
   cat "$TMPDIR/METADATA.json.bak" | jq -s '.' | jq 'walk(if type == "string" and . == "null" then "" else . end)' > "$TMPDIR/METADATA.json"
   if [ "$(jq '. | length' "$TMPDIR/METADATA.json")" -gt 1000 ]; then
    #Sync Logs
     find "${SYSTMP}/BIN_LOGS" -type f -size -3c -delete 2>/dev/null   
     rclone copy --checksum "${SYSTMP}/BIN_LOGS/." "r2:/bin/aarch64_arm64_Linux/" --check-first --checkers 2000 --transfers 1000 --retries="10" --user-agent="$USER_AGENT"
    #Sync GH Meta 
     curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/refs/heads/main/.github/assets/base.png" -o "${SYSTMP}/GH_TMP/base.default.png"
     curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/refs/heads/main/.github/assets/bin.png" -o "${SYSTMP}/GH_TMP/bin.default.png"
     curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/refs/heads/main/.github/assets/pkg.png" -o "${SYSTMP}/GH_TMP/pkg.default.png"
     find "${SYSTMP}/GH_TMP" -type f -size -3c -delete 2>/dev/null
     find "${SYSTMP}/GH_TMP/" -type f -name "*.png" -exec magick "{}" -background "none" -density "1000" -resize "512x512" -gravity "center" -extent "512x512" -verbose "{}" \;
     rclone copy --checksum "${SYSTMP}/GH_TMP/." "r2:/bin/aarch64_arm64_Linux/" --check-first --checkers 2000 --transfers 1000 --retries="10" --user-agent="$USER_AGENT"
     rclone copyto --checksum "${SYSTMP}/GH_TMP/bin.default.png" "r2:/bin/aarch64_arm64_Linux/bin.default.png" --check-first --checkers 2000 --transfers 1000 --retries="10" --user-agent="$USER_AGENT"
     rclone copyto --checksum "${SYSTMP}/GH_TMP/base.default.png" "r2:/bin/aarch64_arm64_Linux/Baseutils/base.default.png" --check-first --checkers 2000 --transfers 1000 --retries="10" --user-agent="$USER_AGENT"
    #Sync TLDR
     find "${SYSTMP}/TLDR" -type f -size -3c -delete 2>/dev/null
     rclone copy --checksum "${SYSTMP}/TLDR/." "r2:/bin/aarch64_arm64_Linux/" --check-first --checkers 2000 --transfers 1000 --retries="10" --user-agent="$USER_AGENT"
    #Sync rest
     rclone copyto --checksum "$TMPDIR/METADATA.json" "r2:/bin/aarch64_arm64_Linux/METADATA.json" --check-first --checkers 2000 --transfers 1000 --retries="10" --user-agent="$USER_AGENT"
     rclone delete "r2:/bin/aarch64_arm64_Linux/METADATA.json.tmp" --check-first --checkers 2000 --transfers 1000 --user-agent="$USER_AGENT"
    #Cleanup
      rclone delete "r2:/bin/aarch64_arm64_Linux" --min-size 0 --max-size 0
   else
     echo -e "\n[-] FATAL: ($(realpath "$TMPDIR/METADATA.json")) is small (<1000)\n"
   fi
else
   echo -e "\n[-] FATAL: ($(realpath $TMPDIR/METADATA.json.bak)) is Inavlid\n"
 exit 1
fi
#END
 rm -rf "${TMPDIR}" "${SYSTMP}/BIN_LOGS" "${SYSTMP}/GH_TMP" "${SYSTMP}/TLDR" 2>/dev/null
#-------------------------------------------------------#