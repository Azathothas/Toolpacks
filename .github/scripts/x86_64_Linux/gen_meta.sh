#!/usr/bin/env bash

#-------------------------------------------------------#
##ENV
SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
rm -rf "$SYSTMP/RCLONE" 2>/dev/null ; mkdir -p "$SYSTMP/RCLONE"
BUILDYAML="$(mktemp --tmpdir=$SYSTMP XXXXX.yaml)" && export BUILDYAML="$BUILDYAML"
#Get URlS
curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x86_64_Linux/bins/metadata.json" | jq -r '.[].source_url' | sed 's/\.sh$/\.yaml/' | sort -u -o "$SYSTMP/BUILDURLS"
#Get METADATA.json (bin.ajam.dev/x86_64_Linux)
curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/METADATA.json.tmp" -o "$SYSTMP/RCLONE/METADATA.json" || curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/METADATA.json" -o "$SYSTMP/RCLONE/METADATA.json"
#Get BLAKE3SUM.txt
curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/BLAKE3SUM.txt" -o "$SYSTMP/RCLONE/BLAKE3SUM.txt"
#Get SHA256SUM.txt
curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/SHA256SUM.txt" -o "$SYSTMP/RCLONE/SHA256SUM.txt"
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
if [ ! -s "$SYSTMP/BUILDURLS" ] || [ ! -s "$SYSTMP/RCLONE/METADATA.json" ] || [ ! -s "$SYSTMP/RCLONE/BLAKE3SUM.txt" ] || [ ! -s "$SYSTMP/RCLONE/SHA256SUM.txt" ]; then
     echo -e "\n[-] Required Files Aren't Available\n"
   exit 1  
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Run
echo -e "\n\n [+] Started Metadata Update at :: $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
 for BUILD_URL in $(cat "$SYSTMP/BUILDURLS" | sed 's/"//g'); do
   echo -e "\n[+] Fetching : $BUILD_URL"
     curl -qfsSL "$BUILD_URL" -o "$BUILDYAML"
     dos2unix --quiet "$BUILDYAML"
    #export BIN= 
     yq -r '.bins[]' "$BUILDYAML" | sort -u -o "$SYSTMP/RCLONE/BINS.txt"
     EXTRA_BINS="$(cat $SYSTMP/RCLONE/BINS.txt | paste -sd ',' -)" && export EXTRA_BINS="${EXTRA_BINS}"                 
    #export Description (Descr)
     DESCRIPTION="$(yq -r '.description' $BUILDYAML)" && export DESCRIPTION="$DESCRIPTION"
    #export WEB_URL (WebURL)
     WEB_URL="$(yq -r '.web_url' $BUILDYAML)" && export WEB_URL="$WEB_URL"
    #Git Ops
     if [[ "$WEB_URL" == https://github.com* ]]; then
       export REPO_URL="${WEB_URL}"
      #Fetch 
       REPO_NAME="$(echo ${REPO_URL} | sed 's|^https://github.com/||' | sed 's/\s//g' | tr -d '[:space:]')" && export REPO_NAME="${REPO_NAME}"
       REPO_METADATA="$(curl -qfsSL "https://api.github.com/repos/$REPO_NAME" -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null)" && export REPO_METADATA="$REPO_METADATA"
       RELEASE_METADATA="$(curl -qfsSL "https://api.github.com/repos/$REPO_NAME/releases/latest" -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null | jq '.assets=""')" && export RELEASE_METADATA="$RELEASE_METADATA"
      #Parse
       REPO_NAME="$(echo $REPO_METADATA | jq -r '.name' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export REPO_NAME="$REPO_NAME"
       REPO_AUTHOR="$(echo $REPO_METADATA | jq -r '.owner.login' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export REPO_AUTHOR="$REPO_AUTHOR"
       REPO_DESCRIPTION="$(echo $REPO_METADATA | jq -r '.description' | sed 's/`//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed ':a;N;$!ba;s/\r\n//g; s/\n//g')" && export REPO_DESCRIPTION="$REPO_DESCRIPTION"
       REPO_LANGUAGE="$(echo $REPO_METADATA | jq -r '.language' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export REPO_LANGUAGE="$REPO_LANGUAGE"
       REPO_LICENSE="$(echo $REPO_METADATA | jq -r '.license.name' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export REPO_LICENSE="$REPO_LICENSE"
       LAST_UPDATED="$(echo $REPO_METADATA | jq -r '.pushed_at' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export LAST_UPDATED="$LAST_UPDATED"
      #If Releases don't exist, use tags
       if [ -z "$RELEASE_METADATA" ]; then
          PKG_VERSION="$(curl -qfsSL "https://api.github.com/repos/$REPO_NAME/tags" -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null | jq -r '.[0].name' )" && export PKG_VERSION="$PKG_VERSION"
          PKG_RELEASED="$(curl -qfsSL "https://api.github.com/repos/$REPO_NAME/git/refs/tags/$PKG_VERSION" -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null | jq '.object.url' | xargs curl -qfsSL -H "Authorization: Bearer $GITHUB_TOKEN" 2>/dev/null | jq -r '.committer.date' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export PKG_RELEASED="$PKG_RELEASED"
       else
          PKG_VERSION="$(echo $RELEASE_METADATA | jq -r '.tag_name' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export PKG_VERSION="$PKG_VERSION"
          PKG_RELEASED="$(echo $RELEASE_METADATA | jq -r '.published_at' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export PKG_RELEASED="$PKG_RELEASED"
       fi
       #REPO_URL="$(echo $REPO_METADATA | jq -r '.html_url' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export REPO_URL="$REPO_URL"
       REPO_STARS="$(echo $REPO_METADATA | jq -r '.stargazers_count' | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export REPO_STARS="$REPO_STARS"
       REPO_TOPICS="$(echo "$REPO_METADATA" | jq -c -r '.topics' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export REPO_TOPICS="$REPO_TOPICS"
     else
       unset REPO_URL
     fi
    #Merge with json
     for BIN in $(cat "$SYSTMP/RCLONE/BINS.txt" | sed 's/"//g'); do
      #Description
       jq --arg BIN "$BIN" --arg DESCRIPTION "$DESCRIPTION" '.[] |= if .name == $BIN then . + {description: $DESCRIPTION} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
      #Extras (All Bins)
       jq --arg BIN "$BIN" --arg EXTRA_BINS "$EXTRA_BINS" '.[] |= if .name == $BIN then . + {extra_bins: $EXTRA_BINS} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
      #BSUM
       B3SUM="$(cat "$SYSTMP/RCLONE/BLAKE3SUM.txt" | grep -i "\.\/$BIN$" | awk '{print $1}' | sort  -u | head -n 1 | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export B3SUM="$B3SUM"
       jq --arg BIN "$BIN" --arg B3SUM "$B3SUM" '.[] |= if .name == $BIN then . + {b3sum: $B3SUM} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
      #SHA256SUM
       SHA256="$(cat "$SYSTMP/RCLONE/SHA256SUM.txt" | grep -i "\.\/$BIN$" | awk '{print $1}' | sort  -u | head -n 1 | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//')" && export SHA256="$SHA256"
       jq --arg BIN "$BIN" --arg SHA256 "$SHA256" '.[] |= if .name == $BIN then . + {sha256: $SHA256} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
      #Web URLs
       jq --arg BIN "$BIN" --arg WEB_URL "$WEB_URL" '.[] |= if .name == $BIN then . + {web_url: $WEB_URL} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
      #Git Meta
       if [ -z "$REPO_URL" ]; then
       #$REPO_AUTHOR repo_author
         jq --arg BIN "$BIN" --arg REPO_AUTHOR "$REPO_AUTHOR" '.[] |= if .name == $BIN then . + {repo_author: $REPO_AUTHOR} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       #$REPO_DESCRIPTION repo_info
         jq --arg BIN "$BIN" --arg REPO_DESCRIPTION "$REPO_DESCRIPTION" '.[] |= if .name == $BIN then . + {repo_info: $REPO_DESCRIPTION} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       #$REPO_LANGUAGE repo_language
         jq --arg BIN "$BIN" --arg REPO_LANGUAGE "$REPO_LANGUAGE" '.[] |= if .name == $BIN then . + {repo_language: $REPO_LANGUAGE} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       #$REPO_LICENSE repo_license
         jq --arg BIN "$BIN" --arg REPO_LICENSE "$REPO_LICENSE" '.[] |= if .name == $BIN then . + {repo_license: $REPO_LICENSE} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       #$LAST_UPDATED repo_updated
         jq --arg BIN "$BIN" --arg LAST_UPDATED "$LAST_UPDATED" '.[] |= if .name == $BIN then . + {repo_updated: $LAST_UPDATED} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       #$PKG_RELEASED repo_released
         jq --arg BIN "$BIN" --arg PKG_RELEASED "$PKG_RELEASED" '.[] |= if .name == $BIN then . + {repo_released: $PKG_RELEASED} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       #$PKG_VERSION repo_version
         jq --arg BIN "$BIN" --arg PKG_VERSION "$PKG_VERSION" '.[] |= if .name == $BIN then . + {repo_version: $PKG_VERSION} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       #$REPO_URL repo_url
         jq --arg BIN "$BIN" --arg REPO_URL "$REPO_URL" '.[] |= if .name == $BIN then . + {repo_url: $REPO_URL} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       #$REPO_STARS repo_url
         jq --arg BIN "$BIN" --arg REPO_STARS "$REPO_STARS" '.[] |= if .name == $BIN then . + {repo_stars: $REPO_STARS} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"                     
       #$REPO_TOPICS repo_topics
         jq --arg BIN "$BIN" --arg REPO_TOPICS "$REPO_TOPICS" '.[] |= if .name == $BIN then . + {repo_topics: $REPO_TOPICS} else . end' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       #Sort & Map
         jq 'map({name, description, download_url, size, b3sum, sha256, build_date, repo_url, repo_author, repo_info, repo_updated, repo_released, repo_version, repo_stars, repo_language, repo_license, repo_topics, web_url, extra_bins})' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       else
       #Sort & Map
         jq 'map({name, description, download_url, size, b3sum, sha256, build_date, repo_url, web_url, extra_bins})' "$SYSTMP/RCLONE/METADATA.json" > "$SYSTMP/RCLONE/METADATA.tmp" && mv "$SYSTMP/RCLONE/METADATA.tmp" "$SYSTMP/RCLONE/METADATA.json"
       fi
      #Print json
      echo -e "\n\n" && jq --arg BIN "$BIN" '.[] | select(.name == $BIN)' "$SYSTMP/RCLONE/METADATA.json" && echo -e "\n\n"
     done
done
#-------------------------------------------------------#

#-------------------------------------------------------#
#Update R2
echo -e "\n Updating Metadata.json\n"
rclone copyto --checksum "$SYSTMP/RCLONE/METADATA.json" "r2:/bin/x86_64_Linux/METADATA.json" --check-first --checkers 2000 --transfers 1000 --user-agent="$USER_AGENT"
rclone delete "r2:/bin/x86_64_Linux/METADATA.json.tmp" --check-first --checkers 2000 --transfers 1000 --user-agent="$USER_AGENT"
#Clean & Purge
sudo rm -rf "$SYSTMP/RCLONE" 2>/dev/null ; mkdir -p "$SYSTMP/RCLONE"
#-------------------------------------------------------#