#!/usr/bin/env bash

#-------------------------------------------------------#
#Sanity Checks
if [ "$BUILD" != "YES" ] || \
   [ -z "$BINDIR" ] || \
   [ -z "$EGET_EXCLUDE" ] || \
   [ -z "$EGET_TIMEOUT" ] || \
   [ -z "$GIT_TERMINAL_PROMPT" ] || \
   [ -z "$GIT_ASKPASS" ] || \
   [ -z "$GITHUB_TOKEN" ] || \
   [ -z "$SYSTMP" ] || \
   [ -z "$TMPDIRS" ]; then
 #exit
  echo -e "\n[+]Skipping Builds...\n"
  exit 1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Main
SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "$SKIP_BUILD" == "NO" ]; then
    #bpftrace : High-level tracing language & tool for Linux 
     export BIN="bpftrace"
     export SOURCE_URL="https://github.com/bpftrace/bpftrace"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" --pull="always" "azathothas/alpine-builder:latest" \
        bash -l -c '
        #Setup ENV
         mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
        #Switch to default: https://github.com/JonathonReinhart/staticx/pull/284
         git clone --filter "blob:none" "https://github.com/JonathonReinhart/staticx" --branch "add-type-checking" && cd "./staticx"
         #https://github.com/JonathonReinhart/staticx/blob/main/build.sh
         pip install -r "./requirements.txt" --break-system-packages --upgrade --force
         apk update && apk upgrade --no-interactive
         apk add busybox scons --latest --upgrade --no-interactive
         export BOOTLOADER_CC="musl-gcc"
         rm -rf "./build" "./dist" "./scons_build" "./staticx/assets"
         python "./setup.py" sdist bdist_wheel
         find dist/ -name "*.whl" | while read -r file; do 
           newname=$(echo "$file" | sed "s/none-[^/]*\.whl$/none-any.whl/");
           mv "$file" "$newname"; 
         done
         find "dist/" -name "*.whl" | xargs pip install --break-system-packages --upgrade --force
         staticx --version ; popd >/dev/null 2>&1
        ##Staticx
         apk update && apk upgrade --no-interactive
         apk add tor torsocks --latest --upgrade --no-interactive
         staticx --loglevel DEBUG "/usr/bin/tor" --strip "/build-bins/tor"
         staticx --loglevel DEBUG "/usr/bin/tor-gencert" --strip "/build-bins/tor-gencert"
         staticx --loglevel DEBUG "/usr/bin/tor-print-ed-signing-cert" --strip "/build-bins/tor-print-ed-signing-cert"
         staticx --loglevel DEBUG "/usr/bin/tor-resolve" --strip "/build-bins/tor-resolve"
         rsync -av --copy-links "/usr/lib/torsocks/libtorsocks.so" "/build-bins/libtorsocks.so"
         rsync -av --copy-links "/usr/lib/torsocks/libtorsocks.a" "/build-bins/libtorsocks.a"
         cp "/usr/bin/torsocks" "/build-bins/torsocks"
         cp "/usr/bin/torify" "/build-bins/torify"
         cp "/usr/share/tor/geoip" "/build-bins/geoip"
         cp "/usr/share/tor/geoip6" "/build-bins/geoip6"
        #strip & info 
         find "/build-bins/" -type f -exec objcopy --remove-section=".comment" --remove-section=".note.*" "{}" \;
         find "/build-bins/" -type f ! -name "*.no_strip" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
         file "/build-bins/"* && du -sh "/build-bins/"*
         popd >/dev/null 2>&1
        '
      #Copy & Meta
       docker cp "alpine-builder:/build-bins/." "$(pwd)/"
       find "." -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath
       #Meta
       find "." -maxdepth 1 -type f -exec sh -c 'file "{}"; du -sh "{}"' \;
       sudo rsync -av --copy-links --exclude="*/" "./." "$BASEUTILSDIR/tor"
      #Delete Containers
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder"
       popd >/dev/null 2>&1
      #-------------------------------------------------------#
      ##Meta
       file "$BASEUTILSDIR/tor/"*
       #Archive [$BASEUTILSDIR/tor]
       7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BASEUTILSDIR/tor/_tor.7z" "$BASEUTILSDIR/tor" 2>/dev/null
       7z a -ttar -mx="9" -mmt="$(($(nproc)+1))" -bt "$BASEUTILSDIR/tor/_tor.tar" "$BASEUTILSDIR/tor" 2>/dev/null
       #Generate METADATA
       cd "$BASEUTILSDIR/tor" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.txt$|\.upx$' | sort | xargs file > "$BASEUTILSDIR/tor/FILE.txt"
       cd "$BASEUTILSDIR/tor" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.txt$|\.upx$' | sort | xargs b3sum > "$BASEUTILSDIR/tor/BLAKE3SUM.txt"
       cd "$BASEUTILSDIR/tor" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.txt$|\.upx$' | sort | xargs sha256sum > "$BASEUTILSDIR/tor/SHA256SUM.txt"
       dust --depth 1 --only-file --no-percent-bars --no-colors --ignore_hidden --reverse --number-of-lines 99999999 --invert-filter "\.7z$|\.gz$|\.jq$|\.json$|\.md$|\.rar$|\.tar$|\.tgz$|\.tmp$|\.txt$|\.upx$|\.yaml$|\.zip$" "$BASEUTILSDIR/tor" | tee "$BASEUTILSDIR/tor/SIZE.txt"
       #rClone
       TMP_METADIR="$(mktemp -d)" && export TMP_METADIR="$TMP_METADIR"
       cd "$BASEUTILSDIR/tor" && rclone sync "." "r2:/bin/aarch64_arm64_Linux/Baseutils/tor/" --exclude="*.jq" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
       curl -qfsSL "https://pub.ajam.dev/utils/devscripts/jq/to_human_bytes.jq" -o "./to_human_bytes.jq"
       #List
       BUILD_URL="https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/tor.yaml" && export BUILD_URL="$BUILD_URL"
       curl -qfsSL "$BUILD_URL" -o "$TMP_METADIR/temp.yaml"
       yq -r '.bins[]' "$TMP_METADIR/temp.yaml" | sort -u -o "$TMP_METADIR/BINS.txt"
       BUILD_SCRIPT="$(echo "$BUILD_URL" | sed 's|https://pub.ajam.dev/repos|https://github.com|; s|/Toolpacks|/Toolpacks/tree/main|; s|\.yaml$|.sh|')" && export BUILD_SCRIPT="$BUILD_SCRIPT"
       DESCRIPTION="$(yq -r '.description' $TMP_METADIR/temp.yaml)" && export DESCRIPTION="$DESCRIPTION"
       NOTE="$(yq -r '.note' $TMP_METADIR/temp.yaml)" && export NOTE="$NOTE"
       EXTRA_BINS="$(awk -v bin="$BIN" '$0 != bin' "$TMP_METADIR/BINS.txt" | paste -sd ',' -)" && export EXTRA_BINS="${EXTRA_BINS}"
       REPO_URL="$(yq -r '.repo_url' $TMP_METADIR/temp.yaml)" && export REPO_URL="$REPO_URL"
       WEB_URL="$(yq -r '.web_url' $TMP_METADIR/temp.yaml)" && export WEB_URL="$WEB_URL"
       rclone lsjson --fast-list "r2:/bin/aarch64_arm64_Linux/Baseutils/tor/" --exclude="*.7z" --exclude="*.no_strip" --exclude="*.gz" --exclude="*.jq" --exclude="*.json" --exclude="*.log" --exclude="*.md" --exclude="*.tar" --exclude="*.tgz" --exclude="*.tmp" --exclude="*.txt" --exclude="*.upx" --exclude="*.zip" | \
       jq --arg BUILD_SCRIPT "$BUILD_SCRIPT" --arg DESCRIPTION "$DESCRIPTION" --arg EXTRA_BINS "$EXTRA_BINS" --arg NOTE "$NOTE" --arg WEB_URL "$WEB_URL" --arg REPO_URL "$REPO_URL" -r 'include "./to_human_bytes" ; .[] | select(.Size != 0 and .Size != -1 and (.Name | test("\\.(7z|bz2|gz|json|md|rar|tar|tgz|tmp|txt|zip)$") | not)) | {name: (.Name), description: $DESCRIPTION, note: $NOTE, download_url: "https://bin.ajam.dev/aarch64_arm64_Linux/Baseutils/tor/\(.Path)", size: (.Size | tonumber | bytes), build_date: (.ModTime | split(".")[0]), repo_url: $REPO_URL, web_url: $WEB_URL, build_script: $BUILD_SCRIPT, extra_bins: $EXTRA_BINS}' | jq -s 'sort_by(.name)' > "$TMP_METADIR/INFO.json"
       for BIN in $(cat "$TMP_METADIR/BINS.txt" | sed 's/"//g'); do
         #Description
          jq --arg BIN "$BIN" --arg DESCRIPTION "$DESCRIPTION" '.[] |= if .name == $BIN then . + {description: $DESCRIPTION} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #Extras (All Bins)
          EXTRA_BINS="$(awk -v bin="$BIN" '$0 != bin' "$TMP_METADIR/BINS.txt" | paste -sd ',' -)" && export EXTRA_BINS="${EXTRA_BINS}"  
          jq --arg BIN "$BIN" --arg EXTRA_BINS "$EXTRA_BINS" '.[] |= if .name == $BIN then . + {extra_bins: $EXTRA_BINS} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #BSUM
          B3SUM="$(cat "$BASEUTILSDIR/tor/BLAKE3SUM.txt" | grep --fixed-strings --ignore-case --word-regexp "${BIN}" | awk '{print $1}' | sort  -u | head -n 1 | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/`//g' | sed 's/|//g' | tr -d '[:space:]')" && export B3SUM="$B3SUM"
          jq --arg BIN "$BIN" --arg B3SUM "$B3SUM" '.[] |= if .name == $BIN then . + {b3sum: $B3SUM} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #SHA256SUM
          SHA256="$(cat "$BASEUTILSDIR/tor/SHA256SUM.txt" | grep --fixed-strings --ignore-case --word-regexp "${BIN}" | awk '{print $1}' | sort  -u | head -n 1 | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/`//g' | sed 's/|//g' | tr -d '[:space:]')" && export SHA256="$SHA256"
          jq --arg BIN "$BIN" --arg SHA256 "$SHA256" '.[] |= if .name == $BIN then . + {sha256: $SHA256} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #Web URLs
          jq --arg BIN "$BIN" --arg WEB_URL "$WEB_URL" '.[] |= if .name == $BIN then . + {web_url: $WEB_URL} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
       done
       #Upload 
       if jq --exit-status . "$TMP_METADIR/INFO.json" >/dev/null 2>&1; then
          rclone copyto --checksum "$TMP_METADIR/INFO.json" "r2:/bin/aarch64_arm64_Linux/Baseutils/tor/INFO.json" --check-first --checkers 2000 --transfers 1000 --user-agent="$USER_AGENT"
       fi
       unset TMP_METADIR BUILD_SCRIPT B3SUM DESCRIPTION NOTE EXTRA_BINS REPO_URL SHA256 WEB_URL
       find "$BASEUTILSDIR" -type f -size -3c -delete ; popd >/dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
unset SKIP_BUILD ; export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CPPFLAGS CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS LIBS OBJCOPY RANLIB
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#