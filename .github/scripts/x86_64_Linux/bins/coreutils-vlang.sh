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
    #coreutils-vlang : Programs equivalent to GNU coreutils, written in the V language
     export BIN="coreutils-vlang"
     export SOURCE_URL="https://github.com/vlang/coreutils"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
     #-------------------------------------------------------#    
      ##Build (MUSL) 
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder-vlang" 2>/dev/null ; docker rm "alpine-builder-vlang" 2>/dev/null
       docker run --privileged --net="host" --user "root" --name "alpine-builder-vlang" "vlang_alpine:latest" \
        bash -c '
        #Setup ENV
         mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
         apk update && apk upgrade --no-interactive 2>/dev/null
        #CoreUtils 
         apk add autoconf binutils build-base clang clang-static cmake coreutils croc curl elfutils file gawk gcc gettext git iputils jq linux-tools make mold moreutils musl musl-dev musl-utils nano ncdu perl pkgconfig procps python3 rsync sudo tar util-linux xz zig zstd 7zip --no-interactive 2>/dev/null 
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/vlang/coreutils" && cd "./coreutils"
         #ENV
         export CFLAGS="-O2 -flto=auto -static -w -pipe"
         export CXXFLAGS="${CFLAGS}"
         export LDFLAGS="-static -s -Wl,-S -Wl,--build-id=none"
         export VFLAGS="-cc clang -gc none -w -prod -compress -showcc -cflags \"-O2\" -cflags \"-flto=auto\" -cflags \"-static\" -cflags \"-w\" -cflags \"-pipe\" -ldflags \"-static\" -ldflags \"-s\" -ldflags \"-Wl,--build-id=none\""
         #Compile
         mkdir -p "./build-bin/"
         eval v "${VFLAGS}" "./src/[/" -o "./build-bin/["
         eval v "${VFLAGS}" "./src/arch/" -o "./build-bin/arch"
         eval v "${VFLAGS}" "./src/b2sum/" -o "./build-bin/b2sum"
         eval v "${VFLAGS}" "./src/base32/" -o "./build-bin/base32"
         eval v "${VFLAGS}" "./src/base64/" -o "./build-bin/base64"
         eval v "${VFLAGS}" "./src/basename/" -o "./build-bin/basename"
         eval v "${VFLAGS}" "./src/basenc/" -o "./build-bin/basenc"
         eval v "${VFLAGS}" "./src/cat/" -o "./build-bin/cat"
         eval v "${VFLAGS}" "./src/chcon/" -o "./build-bin/chcon"
         eval v "${VFLAGS}" "./src/chgrp/" -o "./build-bin/chgrp"
         eval v "${VFLAGS}" "./src/chmod/" -o "./build-bin/chmod"
         eval v "${VFLAGS}" "./src/chown/" -o "./build-bin/chown"
         eval v "${VFLAGS}" "./src/chroot/" -o "./build-bin/chroot"
         eval v "${VFLAGS}" "./src/cksum/" -o "./build-bin/cksum"
         eval v "${VFLAGS}" "./src/comm/" -o "./build-bin/comm"
         eval v "${VFLAGS}" "./src/coreutils/" -o "./build-bin/coreutils"
         eval v "${VFLAGS}" "./src/cp/" -o "./build-bin/cp"
         eval v "${VFLAGS}" "./src/csplit/" -o "./build-bin/csplit"
         eval v "${VFLAGS}" "./src/cut/" -o "./build-bin/cut"
         eval v "${VFLAGS}" "./src/date/" -o "./build-bin/date"
         eval v "${VFLAGS}" "./src/dd/" -o "./build-bin/dd"
         eval v "${VFLAGS}" "./src/df/" -o "./build-bin/df"
         eval v "${VFLAGS}" "./src/dir/" -o "./build-bin/dir"
         eval v "${VFLAGS}" "./src/dircolors/" -o "./build-bin/dircolors"
         eval v "${VFLAGS}" "./src/dirname/" -o "./build-bin/dirname"
         eval v "${VFLAGS}" "./src/du/" -o "./build-bin/du"
         eval v "${VFLAGS}" "./src/echo/" -o "./build-bin/echo"
         eval v "${VFLAGS}" "./src/env/" -o "./build-bin/env"
         eval v "${VFLAGS}" "./src/expand/" -o "./build-bin/expand"
         eval v "${VFLAGS}" "./src/expr/" -o "./build-bin/expr"
         eval v "${VFLAGS}" "./src/factor/" -o "./build-bin/factor"
         eval v "${VFLAGS}" "./src/false/" -o "./build-bin/false"
         eval v "${VFLAGS}" "./src/fmt/" -o "./build-bin/fmt"
         eval v "${VFLAGS}" "./src/fold/" -o "./build-bin/fold"
         eval v "${VFLAGS}" "./src/groups/" -o "./build-bin/groups"
         eval v "${VFLAGS}" "./src/head/" -o "./build-bin/head"
         eval v "${VFLAGS}" "./src/hostid/" -o "./build-bin/hostid"
         eval v "${VFLAGS}" "./src/hostname/" -o "./build-bin/hostname"
         eval v "${VFLAGS}" "./src/id/" -o "./build-bin/id"
         eval v "${VFLAGS}" "./src/install/" -o "./build-bin/install"
         eval v "${VFLAGS}" "./src/join/" -o "./build-bin/join"
         eval v "${VFLAGS}" "./src/kill/" -o "./build-bin/kill"
         eval v "${VFLAGS}" "./src/link/" -o "./build-bin/link"
         eval v "${VFLAGS}" "./src/ln/" -o "./build-bin/ln"
         eval v "${VFLAGS}" "./src/ls/" -o "./build-bin/ls"
         eval v "${VFLAGS}" "./src/md5sum/" -o "./build-bin/md5sum"
         eval v "${VFLAGS}" "./src/mkdir/" -o "./build-bin/mkdir"
         eval v "${VFLAGS}" "./src/mkfifo/" -o "./build-bin/mkfifo"
         eval v "${VFLAGS}" "./src/mknod/" -o "./build-bin/mknod"
         eval v "${VFLAGS}" "./src/mktemp/" -o "./build-bin/mktemp"
         eval v "${VFLAGS}" "./src/mv/" -o "./build-bin/mv"
         eval v "${VFLAGS}" "./src/nice/" -o "./build-bin/nice"
         eval v "${VFLAGS}" "./src/nohup/" -o "./build-bin/nohup"
         eval v "${VFLAGS}" "./src/nproc/" -o "./build-bin/nproc"
         eval v "${VFLAGS}" "./src/numfmt/" -o "./build-bin/numfmt"
         eval v "${VFLAGS}" "./src/od/" -o "./build-bin/od"
         eval v "${VFLAGS}" "./src/pathchk/" -o "./build-bin/pathchk"
         eval v "${VFLAGS}" "./src/pinky/" -o "./build-bin/pinky"
         eval v "${VFLAGS}" "./src/pr/" -o "./build-bin/pr"
         eval v "${VFLAGS}" "./src/printenv/" -o "./build-bin/printenv"
         eval v "${VFLAGS}" "./src/printf/" -o "./build-bin/printf"
         eval v "${VFLAGS}" "./src/ptx/" -o "./build-bin/ptx"
         eval v "${VFLAGS}" "./src/pwd/" -o "./build-bin/pwd"
         eval v "${VFLAGS}" "./src/readlink/" -o "./build-bin/readlink"
         eval v "${VFLAGS}" "./src/realpath/" -o "./build-bin/realpath"
         eval v "${VFLAGS}" "./src/reboot/" -o "./build-bin/reboot"
         eval v "${VFLAGS}" "./src/rm/" -o "./build-bin/rm"
         eval v "${VFLAGS}" "./src/rmdir/" -o "./build-bin/rmdir"
         eval v "${VFLAGS}" "./src/runcon/" -o "./build-bin/runcon"
         eval v "${VFLAGS}" "./src/seq/" -o "./build-bin/seq"
         eval v "${VFLAGS}" "./src/sha1sum/" -o "./build-bin/sha1sum"
         eval v "${VFLAGS}" "./src/sha224sum/" -o "./build-bin/sha224sum"
         eval v "${VFLAGS}" "./src/sha256sum/" -o "./build-bin/sha256sum"
         eval v "${VFLAGS}" "./src/sha384sum/" -o "./build-bin/sha384sum"
         eval v "${VFLAGS}" "./src/sha512sum/" -o "./build-bin/sha512sum"
         eval v "${VFLAGS}" "./src/shred/" -o "./build-bin/shred"
         eval v "${VFLAGS}" "./src/shuf/" -o "./build-bin/shuf"
         eval v "${VFLAGS}" "./src/sleep/" -o "./build-bin/sleep"
         eval v "${VFLAGS}" "./src/sort/" -o "./build-bin/sort"
         eval v "${VFLAGS}" "./src/split/" -o "./build-bin/split"
         eval v "${VFLAGS}" "./src/stat/" -o "./build-bin/stat"
         eval v "${VFLAGS}" "./src/stdbuf/" -o "./build-bin/stdbuf"
         eval v "${VFLAGS}" "./src/stty/" -o "./build-bin/stty"
         eval v "${VFLAGS}" "./src/sum/" -o "./build-bin/sum"
         eval v "${VFLAGS}" "./src/sync/" -o "./build-bin/sync"
         eval v "${VFLAGS}" "./src/tac/" -o "./build-bin/tac"
         eval v "${VFLAGS}" "./src/tail/" -o "./build-bin/tail"
         eval v "${VFLAGS}" "./src/tee/" -o "./build-bin/tee"
         eval v "${VFLAGS}" "./src/test/" -o "./build-bin/test"
         eval v "${VFLAGS}" "./src/timeout/" -o "./build-bin/timeout"
         eval v "${VFLAGS}" "./src/touch/" -o "./build-bin/touch"
         eval v "${VFLAGS}" "./src/tr/" -o "./build-bin/tr"
         eval v "${VFLAGS}" "./src/true/" -o "./build-bin/true"
         eval v "${VFLAGS}" "./src/truncate/" -o "./build-bin/truncate"
         eval v "${VFLAGS}" "./src/tsort/" -o "./build-bin/tsort"
         eval v "${VFLAGS}" "./src/tty/" -o "./build-bin/tty"
         eval v "${VFLAGS}" "./src/uname/" -o "./build-bin/uname"
         eval v "${VFLAGS}" "./src/unexpand/" -o "./build-bin/unexpand"
         eval v "${VFLAGS}" "./src/uniq/" -o "./build-bin/uniq"
         eval v "${VFLAGS}" "./src/unlink/" -o "./build-bin/unlink"
         eval v "${VFLAGS}" "./src/uptime/" -o "./build-bin/uptime"
         eval v "${VFLAGS}" "./src/users/" -o "./build-bin/users"
         eval v "${VFLAGS}" "./src/vdir/" -o "./build-bin/vdir"
         eval v "${VFLAGS}" "./src/wc/" -o "./build-bin/wc"
         eval v "${VFLAGS}" "./src/who/" -o "./build-bin/who"
         eval v "${VFLAGS}" "./src/whoami/" -o "./build-bin/whoami"
         eval v "${VFLAGS}" "./src/yes/" -o "./build-bin/yes"
         rsync -av --copy-links "./build-bin/." "/build-bins"
        '
       #Copy 
       docker cp "alpine-builder-vlang:/build-bins/." "$(pwd)/"
       mkdir -p "$BASEUTILSDIR/coreutils-vlang"
       find "./" -type d -exec rm -rf {} + 2>/dev/null
       find "./" -type f -exec sh -c 'file "{}" | grep -q "text" && rm -f "{}"' \;
       [ "$(find ./ -mindepth 1 -maxdepth 1)" ] && sudo rsync -av --copy-links "./." "$BASEUTILSDIR/coreutils-vlang"
       sudo chown -R "$(whoami):$(whoami)" "$BASEUTILSDIR/coreutils-vlang/" && chmod -R 755 "$BASEUTILSDIR/coreutils-vlang/"
       #Strip
       find "$BASEUTILSDIR/coreutils-vlang" -type f -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
      #-------------------------------------------------------#
      ##Meta
       file "$BASEUTILSDIR/coreutils-vlang/"*
       #Archive [$BASEUTILSDIR/coreutils-vlang]
       7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BASEUTILSDIR/coreutils-vlang/_coreutils-vlang.7z" "$BASEUTILSDIR/coreutils-vlang" 2>/dev/null
       7z a -ttar -mx="9" -mmt="$(($(nproc)+1))" -bt "$BASEUTILSDIR/coreutils-vlang/_coreutils-vlang.tar" "$BASEUTILSDIR/coreutils-vlang" 2>/dev/null
       #Generate METADATA
       cd "$BASEUTILSDIR/coreutils-vlang" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.txt$|\.upx$' | sort | xargs file > "$BASEUTILSDIR/coreutils-vlang/FILE.txt"
       cd "$BASEUTILSDIR/coreutils-vlang" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.txt$|\.upx$' | sort | xargs b3sum > "$BASEUTILSDIR/coreutils-vlang/BLAKE3SUM.txt"
       cd "$BASEUTILSDIR/coreutils-vlang" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.txt$|\.upx$' | sort | xargs sha256sum > "$BASEUTILSDIR/coreutils-vlang/SHA256SUM.txt"
       dust --depth 1 --only-file --no-percent-bars --no-colors --ignore_hidden --reverse --number-of-lines 99999999 --invert-filter "\.7z$|\.gz$|\.jq$|\.json$|\.md$|\.rar$|\.tar$|\.tgz$|\.tmp$|\.txt$|\.upx$|\.yaml$|\.zip$" "$BASEUTILSDIR/coreutils-vlang" | tee "$BASEUTILSDIR/coreutils-vlang/SIZE.txt"
       #rClone
       TMP_METADIR="$(mktemp -d)" && export TMP_METADIR="$TMP_METADIR"
       cd "$BASEUTILSDIR/coreutils-vlang" && rclone sync "." "r2:/bin/x86_64_Linux/Baseutils/coreutils-vlang/" --exclude="*.jq" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
       curl -qfsSL "https://pub.ajam.dev/utils/devscripts/jq/to_human_bytes.jq" -o "./to_human_bytes.jq"
       #List
       curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x86_64_Linux/bins/coreutils-vlang.yaml" -o "$TMP_METADIR/temp.yaml"
       yq -r '.bins[]' "$TMP_METADIR/temp.yaml" | sort -u -o "$TMP_METADIR/BINS.txt"
       DESCRIPTION="$(yq -r '.description' $TMP_METADIR/temp.yaml)" && export DESCRIPTION="$DESCRIPTION"
       EXTRA_BINS="$(awk -v bin="$BIN" '$0 != bin' "$TMP_METADIR/BINS.txt" | paste -sd ',' -)" && export EXTRA_BINS="${EXTRA_BINS}"
       REPO_URL="$(yq -r '.repo_url' $TMP_METADIR/temp.yaml)" && export REPO_URL="$REPO_URL"
       WEB_URL="$(yq -r '.web_url' $TMP_METADIR/temp.yaml)" && export WEB_URL="$WEB_URL"
       rclone lsjson --fast-list "r2:/bin/x86_64_Linux/Baseutils/coreutils-vlang/" --exclude="*.7z" --exclude="*.gz" --exclude="*.jq" --exclude="*.json" --exclude="*.log" --exclude="*.md" --exclude="*.tar" --exclude="*.tgz" --exclude="*.tmp" --exclude="*.txt" --exclude="*.upx" --exclude="*.zip" | \
       jq --arg DESCRIPTION "$DESCRIPTION" --arg EXTRA_BINS "$EXTRA_BINS" --arg WEB_URL "$WEB_URL" --arg REPO_URL "$REPO_URL" -r 'include "./to_human_bytes" ; .[] | select(.Size != 0 and .Size != -1 and (.Name | test("\\.(7z|bz2|gz|json|md|rar|tar|tgz|tmp|txt|zip)$") | not)) | {name: (.Name), description: $DESCRIPTION, download_url: "https://bin.ajam.dev/x86_64_Linux/Baseutils/coreutils-vlang/\(.Path)", size: (.Size | tonumber | bytes), build_date: (.ModTime | split(".")[0]), repo_url: $REPO_URL, web_url: $WEB_URL, extra_bins: $EXTRA_BINS}' | jq -s 'sort_by(.name)' > "$TMP_METADIR/INFO.json"
       for BIN in $(cat "$TMP_METADIR/BINS.txt" | sed 's/"//g'); do
         #Description
          jq --arg BIN "$BIN" --arg DESCRIPTION "$DESCRIPTION" '.[] |= if .name == $BIN then . + {description: $DESCRIPTION} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #Extras (All Bins)
          EXTRA_BINS="$(awk -v bin="$BIN" '$0 != bin' "$TMP_METADIR/BINS.txt" | paste -sd ',' -)" && export EXTRA_BINS="${EXTRA_BINS}"  
          jq --arg BIN "$BIN" --arg EXTRA_BINS "$EXTRA_BINS" '.[] |= if .name == $BIN then . + {extra_bins: $EXTRA_BINS} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #BSUM
          B3SUM="$(cat "$BASEUTILSDIR/coreutils-vlang/BLAKE3SUM.txt" | grep --fixed-strings --ignore-case --word-regexp "${BIN}" | awk '{print $1}' | sort  -u | head -n 1 | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/`//g' | sed 's/|//g' | tr -d '[:space:]')" && export B3SUM="$B3SUM"
          jq --arg BIN "$BIN" --arg B3SUM "$B3SUM" '.[] |= if .name == $BIN then . + {b3sum: $B3SUM} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #SHA256SUM
          SHA256="$(cat "$BASEUTILSDIR/coreutils-vlang/SHA256SUM.txt" | grep --fixed-strings --ignore-case --word-regexp "${BIN}" | awk '{print $1}' | sort  -u | head -n 1 | sed 's/"//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/["'\'']//g' | sed 's/`//g' | sed 's/|//g' | tr -d '[:space:]')" && export SHA256="$SHA256"
          jq --arg BIN "$BIN" --arg SHA256 "$SHA256" '.[] |= if .name == $BIN then . + {sha256: $SHA256} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
         #Web URLs
          jq --arg BIN "$BIN" --arg WEB_URL "$WEB_URL" '.[] |= if .name == $BIN then . + {web_url: $WEB_URL} else . end' "$TMP_METADIR/INFO.json" > "$TMP_METADIR/INFO.tmp" && mv "$TMP_METADIR/INFO.tmp" "$TMP_METADIR/INFO.json"
       done
       #Upload 
       if jq --exit-status . "$TMP_METADIR/INFO.json" >/dev/null 2>&1; then
          rclone copyto --checksum "$TMP_METADIR/INFO.json" "r2:/bin/x86_64_Linux/Baseutils/coreutils-vlang/INFO.json" --check-first --checkers 2000 --transfers 1000 --user-agent="$USER_AGENT"
       fi
       unset TMP_METADIR B3SUM DESCRIPTION EXTRA_BINS REPO_URL SHA256 WEB_URL
       docker stop "alpine-builder-vlang" 2>/dev/null ; docker rm "alpine-builder-vlang"
       find "$BASEUTILSDIR" -type f -size 0 -delete ; popd >/dev/null 2>&1
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