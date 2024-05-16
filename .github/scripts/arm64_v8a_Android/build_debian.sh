#!/usr/bin/env bash

#-------------------------------------------------------#
# This should be run on Debian (Debian Based) Distros with apt, coreutils, curl, dos2unix & passwordless sudo
# sudo apt-get update -y && sudo apt-get install coreutils curl dos2unix moreutils -y
# OR (without sudo): apt-get update -y && apt-get install coreutils curl dos2unix moreutils sudo -y
#
# Hardware : At least 2vCPU + 8GB RAM + 50GB SSD
# Once requirement is satisfied, simply:
# export GITHUB_TOKEN="NON_PRIVS_READ_ONLY_TOKEN"
# bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/arm64_v8a_Android/build_debian.sh")
#-------------------------------------------------------#

#-------------------------------------------------------#
##ENV:$PATH
 export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.cargo/env:$HOME/.go/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/miniconda3/bin:$HOME/miniconda3/condabin:/usr/local/zig:/usr/local/zig/lib:/usr/local/zig/lib/include:/usr/local/musl/bin:/usr/local/musl/lib:/usr/local/musl/include:$PATH"
 SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
#TMPDIRS
 #For build-cache
 TMPDIRS="mktemp -d --tmpdir=$SYSTMP/toolpacks XXXXXXX_android_arm64_v8a" && export TMPDIRS="$TMPDIRS"
 rm -rf "$SYSTMP/toolpacks" 2>/dev/null ; mkdir -p "$SYSTMP/toolpacks"
 #For Bins
 BINDIR="$SYSTMP/toolpack_arm64_v8a_Android" && export BINDIR="$BINDIR"
 rm -rf "$BINDIR" 2>/dev/null ; rm -rf "$BINDIR.7z" 2>/dev/null ; mkdir -p "$BINDIR"
 #For Baseutils
 BASEUTILSDIR="$SYSTMP/baseutils_arm64_v8a" && export BASEUTILSDIR="$BASEUTILSDIR"
 rm -rf "$BASEUTILSDIR" 2>/dev/null ; rm -rf "$BASEUTILSDIR.7z" 2>/dev/null ; mkdir -p "$BASEUTILSDIR"
##Sane Configs
#In case of removed/privated GH repos
 # https://git-scm.com/docs/git#Documentation/git.txt-codeGITTERMINALPROMPTcode
 export GIT_TERMINAL_PROMPT="0"
 #https://git-scm.com/docs/git#Documentation/git.txt-codeGITASKPASScode
 export GIT_ASKPASS="/bin/echo"
 #in case of eget prompts
 EGET_TIMEOUT="timeout -k 1m 2m" && export EGET_TIMEOUT="$EGET_TIMEOUT"
 EGET_EXCLUDE="--asset \"^386\" --asset \"^amd\" --asset \"^apple\" --asset \"^AppImage\" --asset \"^asc\" --asset \"^crt\" --asset \"^darwin\" --asset \"^deb\" --asset \"^exe\" --asset \"^freebsd\" --asset \"^gnueabi\"  --asset \"^i686\" --asset \"^mac\" --asset \"^mips\" --asset \"^rpm\" --asset \"^sbom\" --asset \"^sha\" --asset \"^solaris\" --asset \"^sig\" --asset \"^symbol\" --asset \"^v7\" --asset \"^windows\" --asset \"^x86\"" && export EGET_EXCLUDE="$EGET_EXCLUDE"
#User-Agent
 USER_AGENT="$(curl -qfsSL 'https://pub.ajam.dev/repos/Azathothas/Wordlists/Misc/User-Agents/ua_chrome_macos_latest.txt')" && export USER_AGENT="$USER_AGENT" 
#-------------------------------------------------------#

#-------------------------------------------------------#
##Init
 #Get
 INITSCRIPT="$(mktemp --tmpdir=$SYSTMP XXXXX_init.sh)" && export INITSCRIPT="$INITSCRIPT"
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/arm64_v8a_Android/init_debian.sh" -o "$INITSCRIPT"
 chmod +xwr "$INITSCRIPT" && source "$INITSCRIPT"
 #Check
 if [ "$CONTINUE" != "YES" ]; then
      echo -e "\n[+] Failed To Initialize\n"
      exit 1
 fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Sanity Checks
#eget
if [[ -n "$GITHUB_TOKEN" ]]; then
   echo -e "\n[+] GITHUB_TOKEN is Exported"
  ##gh-cli (uses $GITHUB_TOKEN env var)
   #echo "$GITHUB_TOKEN" | gh auth login --with-token
   gh auth status
  ##eget
   # 5000 req/minute (80 req/minute)
   eget --rate
else
   # 60 req/hr
   echo -e "\n[-] GITHUB_TOKEN is NOT Exported"
   echo -e "Export it to avoid ratelimits\n"
   eget --rate
   exit 1
fi
#rclone
if command -v rclone &> /dev/null; then
     if [ -s "$HOME/.rclone.conf" ] && [ ! -s "$HOME/.config/rclone/rclone.conf" ]; then
        echo -e "\n[+] Setting Default rClone Config --> "$HOME/.config/rclone/rclone.conf"\n"
         mkdir -p "$HOME/.config/rclone" && touch "$HOME/.config/rclone/rclone.conf"
         cat "$HOME/.rclone.conf" > "$HOME/.config/rclone/rclone.conf"
         dos2unix --quiet "$HOME/.config/rclone/rclone.conf"
     elif [ -s "$HOME/.config/rclone/rclone.conf" ]; then
        echo -e "\n[+] Using Default rClone Config --> "$HOME/.config/rclone/rclone.conf"\n"
        dos2unix --quiet "$HOME/.config/rclone/rclone.conf"
     else
       echo -e "\n[-] rClone Config Not Found\n"
     fi
   ##ENV VARS
     export RCLONE_STATS="120s"
else
    echo -e "\n[-] rclone is NOT Installed"
     if [ -s "$HOME/.rclone.conf" ]; then
       echo -e "rClone Config --> "$HOME/.rclone.conf"\n"
     elif [ -s "$HOME/.config/rclone/rclone.conf" ]; then
       echo -e "rClone Config --> "$HOME/.config/rclone/rclone.conf"\n"
     else
       echo -e "[-] rClone Config Not Found\n"
     fi
  exit 1
fi
#-------------------------------------------------------#


#-------------------------------------------------------#
##ENV (In Case of ENV Resets)
#TMPDIRS
 #For build-cache
 TMPDIRS="mktemp -d --tmpdir=$SYSTMP/toolpacks XXXXXXX_android_arm64_v8a" && export TMPDIRS="$TMPDIRS"
 rm -rf "$SYSTMP/toolpacks" 2>/dev/null ; mkdir -p "$SYSTMP/toolpacks"
 #For Bins
 BINDIR="$SYSTMP/toolpack_arm64_v8a_Android" && export BINDIR="$BINDIR"
 rm -rf "$BINDIR" 2>/dev/null ; rm -rf "$BINDIR.7z" 2>/dev/null ; mkdir -p "$BINDIR"
##Build
set +x
 BUILD="YES" && export BUILD="$BUILD"
 #ENV
 BUILDSCRIPT="$(mktemp --tmpdir=$SYSTMP XXXXX_build.sh)" && export BUILDSCRIPT="$BUILDSCRIPT"
 #Get URlS
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/arm64_v8a_Android/bins/metadata.json" | jq -r '.[].Source' | grep -i "\.sh$" | sort -u -o "$SYSTMP/BUILDURLS"
 #Run
  echo -e "\n\n [+] Started Building at :: $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
  for BUILD_URL in $(cat "$SYSTMP/BUILDURLS"); do
     #Init
      START_TIME="$(date +%s)" && export START_TIME="$START_TIME"
      echo -e "\n[+] Fetching : $BUILD_URL"
     #Fetch 
      curl -qfsSL "$BUILD_URL" -o "$BUILDSCRIPT"
      chmod +xwr "$BUILDSCRIPT"
     #Run 
      source "$BUILDSCRIPT" || true
      #bash "$BUILDSCRIPT"
     #Clean & Purge
      sudo rm -rf "$SYSTMP/toolpacks" 2>/dev/null
      mkdir -p "$SYSTMP/toolpacks"
     #Finish
      END_TIME="$(date +%s)" && export END_TIME="$END_TIME"
      #ELAPSED_TIME="$(date -u -d@"$((END_TIME - START_TIME))" +%T)" && export ELAPSED_TIME="$ELAPSED_TIME"
      ELAPSED_TIME="$(date -u -d@"$((END_TIME - START_TIME))" "+%H(Hr):%M(Min):%S(Sec)")"
      echo -e "\n[+] Completed (Building|Fetching) $BIN [$SOURCE_URL] :: $ELAPSED_TIME\n"
  done
  echo -e "\n\n [+] Finished Building at :: $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
 #Check
 BINDIR_SIZE="$(du -sh "$BINDIR" 2>/dev/null | awk '{print $1}' 2>/dev/null)" && export "BINDIR_SIZE=$BINDIR_SIZE"
 if [ ! -d "$BINDIR" ] || [ -z "$(ls -A "$BINDIR")" ] || [ -z "$BINDIR_SIZE" ] || [[ "${BINDIR_SIZE}" == *K* ]]; then
      echo -e "\n[+] Broken/Empty Built "$BINDIR" Found\n"
      exit 1
 else
      echo -e "\n[+] Built "$BINDIR" :: $BINDIR_SIZE\n"
 fi
#-------------------------------------------------------#


#-------------------------------------------------------#
#Strip || Cleanup [$BINDIR]
 #Chmod +xwr
 find "$BINDIR" -maxdepth 1 -type f -exec chmod +xwr {} \; 2>/dev/null
 #Strip
 find "$BINDIR" -maxdepth 1 -type f -exec strip {} \; 2>/dev/null
 #Rename anything with *_arm64_v8a*
 find "$BINDIR" -type f -name '*_Android' -exec sh -c 'newname=$(echo "$1" | sed "s/_arm64_v8a_Android//"); mv "$1" "$newname"' sh {} \;
#-------------------------------------------------------#
#Strip || Cleanup [$BASEUTILSDIR]
 #Chmod +xwr
 find "$BASEUTILSDIR" -maxdepth 1 -type f -exec chmod +xwr {} \; 2>/dev/null
 #Strip
 find "$BASEUTILSDIR" -maxdepth 1 -type f -exec strip {} \; 2>/dev/null
 #Rename anything with *_arm64_v8a*
 find "$BASEUTILSDIR" -type f -name '*_Android' -exec sh -c 'newname=$(echo "$1" | sed "s/_arm64_v8a_Android//"); mv "$1" "$newname"' sh {} \;
#-------------------------------------------------------#
#rClone Upload to R2 (bin.ajam.dev/arm64_v8a_Android) (arm64_v8a_Android) [Binaries]
 if command -v rclone &> /dev/null && [ -s "$HOME/.config/rclone/rclone.conf" ] && [ -d "$BINDIR" ] && [ "$(find "$BINDIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
    #Upload [$BINDIR]
      echo -e "\n[+] Uploading Results to R2 (rclone)\n"
      cd "$BINDIR" && rclone copy "." "r2:/bin/arm64_v8a_Android/" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
    #Upload [$BASEUTILSDIR]
      echo -e "\n[+] Uploading Results to R2 (rclone)\n"
      cd "$BASEUTILSDIR" && rclone copy "." "r2:/bin/arm64_v8a_Android/Baseutils/" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
    ##Archive Binaries (.7z) (arm64_v8a_Android) Bins [Downstreamed RCLONE]
       if command -v 7z &> /dev/null && [ -d "$BINDIR" ] && [ "$(find "$BINDIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
            echo -e "\n\n[+] Purging Build Cache $SYSTMP/toolpacks --> Size :: $(du -sh $SYSTMP/toolpacks | awk '{print $1}')\n\n"
             du -h --max-depth="1" "$SYSTMP" 2>/dev/null | sort -hr
             rm -rf "$SYSTMP/toolpacks" 2>/dev/null
          ##Fetch&Sync [$BINDIR]
             cd "$BINDIR"
             rclone copy "r2:/bin/arm64_v8a_Android/" "." --exclude="Baseutils/**" --exclude="BLAKE3SUM" --exclude="*.7z" --exclude="*.json" --exclude="*.log" --exclude="*.md" --exclude="SHA256SUM" --exclude="*.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #Strip || Cleanup
             #Chmod +xwr
             find "$BINDIR" -maxdepth 1 -type f -exec chmod +xwr {} \; 2>/dev/null
             #Strip
             find "$BINDIR" -maxdepth 1 -type f -exec strip {} \; 2>/dev/null
             #Rename anything with *_arm64_v8a*
             find "$BINDIR" -type f -name '*_Android' -exec sh -c 'newname=$(echo "$1" | sed "s/_arm64_v8a_Android//"); mv "$1" "$newname"' sh {} \;
            #File
              cd "$BINDIR" && find "./" -maxdepth 1 -type f | grep -v '.txt' | sort | xargs file > "$SYSTMP/arm64_v8a_Android_FILE"
              rclone copyto "$SYSTMP/arm64_v8a_Android_FILE" "r2:/bin/arm64_v8a_Android/FILE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #Size (Dust)
              dust --depth 1 --only-file --no-percent-bars --no-colors --ignore_hidden --reverse --number-of-lines 99999999 "$BINDIR" | tee "$SYSTMP/arm64_v8a_Android_SIZE.txt"
              rclone copyto "$SYSTMP/arm64_v8a_Android_SIZE.md" "r2:/bin/arm64_v8a_Android/SIZE.md" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
              rclone copyto "$SYSTMP/arm64_v8a_Android_SIZE.txt" "r2:/bin/arm64_v8a_Android/SIZE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #BLAKE3SUM
              cd "$BINDIR" && find "./" -maxdepth 1 -type f | grep -v '.txt' | sort | xargs b3sum > "$SYSTMP/arm64_v8a_Android_BLAKE3SUM"
              rclone copyto "$SYSTMP/arm64_v8a_Android_BLAKE3SUM" "r2:/bin/arm64_v8a_Android/BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #SHA256SUM
              cd "$BINDIR" && find "./" -maxdepth 1 -type f | grep -v '.txt' | sort | xargs sha256sum > "$SYSTMP/arm64_v8a_Android_SHA256SUM"
              rclone copyto "$SYSTMP/arm64_v8a_Android_SHA256SUM" "r2:/bin/arm64_v8a_Android/SHA256SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
           #Archive
             7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BINDIR.7z" "$BINDIR" 2>/dev/null
           #Meta
             du -sh "$BINDIR.7z" && file "$BINDIR.7z"
          ##Fetch&Sync [$BASEUTILSDIR]
             cd "$BASEUTILSDIR"
             rclone copy "r2:/bin/arm64_v8a_Android/Baseutils/" "." --exclude="BLAKE3SUM" --exclude="*.7z" --exclude="*.json" --exclude="*.log" --exclude="*.md" --exclude="SHA256SUM" --exclude="*.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #Strip || Cleanup
             #Chmod +xwr
             find "$BASEUTILSDIR" -maxdepth 1 -type f -exec chmod +xwr {} \; 2>/dev/null
             #Strip
             find "$BASEUTILSDIR" -maxdepth 1 -type f -exec strip {} \; 2>/dev/null
             #Rename anything with *_arm64_v8a*
             find "$BASEUTILSDIR" -type f -name '*_Android' -exec sh -c 'newname=$(echo "$1" | sed "s/_arm64_v8a_Android//"); mv "$1" "$newname"' sh {} \;
            #File
              cd "$BASEUTILSDIR" && find "./" -maxdepth 1 -type f | grep -v '.txt' | sort | xargs file > "$SYSTMP/arm64_v8a_Android_Baseutils_FILE"
              rclone copyto "$SYSTMP/arm64_v8a_Android_Baseutils_FILE" "r2:/bin/arm64_v8a_Android/Baseutils/FILE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #Size (Dust)
              dust --depth 1 --only-file --no-percent-bars --no-colors --ignore_hidden --reverse --number-of-lines 99999999 "$BASEUTILSDIR" | tee "$SYSTMP/arm64_v8a_Android_Baseutils_SIZE.txt"
              rclone copyto "$SYSTMP/arm64_v8a_Android_Baseutils_SIZE.md" "r2:/bin/arm64_v8a_Android/Baseutils/SIZE.md" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
              rclone copyto "$SYSTMP/arm64_v8a_Android_Baseutils_SIZE.txt" "r2:/bin/arm64_v8a_Android/Baseutils/SIZE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #BLAKE3SUM
              cd "$BASEUTILSDIR" && find "./" -maxdepth 1 -type f | grep -v '.txt' | sort | xargs b3sum > "$SYSTMP/arm64_v8a_Android_Baseutils_BLAKE3SUM"
              rclone copyto "$SYSTMP/arm64_v8a_Android_Baseutils_BLAKE3SUM" "r2:/bin/arm64_v8a_Android/Baseutils/BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #SHA256SUM
              cd "$BASEUTILSDIR" && find "./" -maxdepth 1 -type f | grep -v '.txt' | sort | xargs sha256sum > "$SYSTMP/arm64_v8a_Android_Baseutils_SHA256SUM"
              rclone copyto "$SYSTMP/arm64_v8a_Android_Baseutils_SHA256SUM" "r2:/bin/arm64_v8a_Android/Baseutils/SHA256SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
           #Archive
             7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BASEUTILSDIR.7z" "$BASEUTILSDIR" 2>/dev/null
           #Meta
             du -sh "$BASEUTILSDIR.7z" && file "$BASEUTILSDIR.7z"
       fi
  else
   ##Archive Binaries (.7z) (arm64_v8a_Android) Bins
     if command -v 7z &> /dev/null && [ -d "$BINDIR" ] && [ "$(find "$BINDIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
          echo -e "\n\n[+] Purging Build Cache $SYSTMP/toolpacks --> Size :: $(du -sh $SYSTMP/toolpacks | awk '{print $1}')\n\n"
           du -h --max-depth="1" "$SYSTMP" 2>/dev/null | sort -hr
           rm -rf "$SYSTMP/toolpacks" 2>/dev/null
         #Archive [$BINDIR]
           7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BINDIR.7z" "$BINDIR" 2>/dev/null
         #Meta
           du -sh "$BINDIR.7z" && file "$BINDIR.7z"
         #Archive [$BASEUTILSDIR]
           7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BASEUTILSDIR.7z" "$BASEUTILSDIR" 2>/dev/null
         #Meta
           du -sh "$BASEUTILSDIR.7z" && file "$BASEUTILSDIR.7z"
     fi
 fi
#-------------------------------------------------------# 
 if command -v rclone &> /dev/null && [ -s "$HOME/.config/rclone/rclone.conf" ] && [ -s "$BINDIR.7z" ]; then
 #rClone Upload Toolpacks to R2 (bin.ajam.dev/arm64_v8a_Android/_toolpack_arm64_v8a.7z) [Archive]
     #Upload
      echo -e "\n[+] Uploading Results to R2 (rclone)\n"
      rclone copyto "$BINDIR.7z" "r2:/bin/arm64_v8a_Android/_toolpack_arm64_v8a.7z" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #BLAKE3SUM
      cd "$SYSTMP/" && /bin/bash -c 'PS4="$ ";b3sum ./toolpack_arm64_v8a.7z | grep -v '.txt' ' &> "$SYSTMP/_toolpack_arm64_v8a_BLAKE3SUM"
      rclone copyto "$SYSTMP/_toolpack_arm64_v8a_BLAKE3SUM" "r2:/bin/arm64_v8a_Android/_toolpack_arm64_v8a_BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #SHA256SUM
      cd "$SYSTMP/" && /bin/bash -c 'PS4="$ ";sha256sum ./toolpack_arm64_v8a.7z | grep -v '.txt' ' &> "$SYSTMP/_toolpack_arm64_v8a_SHA256SUM"
      rclone copyto "$SYSTMP/_toolpack_arm64_v8a_SHA256SUM" "r2:/bin/arm64_v8a_Android/_toolpack_arm64_v8a_SHA256SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
 #rClone Upload Toolpacks to R2 (bin.ajam.dev/arm64_v8a_Android/_baseutils_arm64_v8a.7z) [Archive]
     #Upload
      echo -e "\n[+] Uploading Results to R2 (rclone)\n"
      rclone copyto "$BASEUTILSDIR.7z" "r2:/bin/arm64_v8a_Android/Baseutils/_baseutils_arm64_v8a.7z" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #BLAKE3SUM
      cd "$SYSTMP/" && /bin/bash -c 'PS4="$ ";b3sum ./baseutils_arm64_v8a.7z | grep -v '.txt' ' &> "$SYSTMP/_baseutils_arm64_v8a_BLAKE3SUM"
      rclone copyto "$SYSTMP/_baseutils_arm64_v8a_BLAKE3SUM" "r2:/bin/arm64_v8a_Android/Baseutils/_baseutils_arm64_v8a_BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #SHA256SUM
      cd "$SYSTMP/" && /bin/bash -c 'PS4="$ ";sha256sum ./baseutils_arm64_v8a.7z | grep -v '.txt' ' &> "$SYSTMP/_baseutils_arm64_v8a_SHA256SUM"
      rclone copyto "$SYSTMP/_baseutils_arm64_v8a_SHA256SUM" "r2:/bin/arm64_v8a_Android/Baseutils/_baseutils_arm64_v8a_SHA256SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress      
 fi
#-------------------------------------------------------#
#META
 echo -e "\n\n[+] Size $BINDIR --> $(du -sh $BINDIR | awk '{print $1}')"
 echo -e "[+] Size $BINDIR.7z --> $(du -sh $BINDIR.7z | awk '{print $1}')\n\n"
 echo -e "\n\n[+] Size $BASEUTILSDIR --> $(du -sh $BASEUTILSDIR | awk '{print $1}')"
 echo -e "[+] Size $BASEUTILSDIR.7z --> $(du -sh $BASEUTILSDIR.7z | awk '{print $1}')\n\n" 
#-------------------------------------------------------# 
#GH Runner
 if [ "$USER" = "runner" ] || [ "$(whoami)" = "runner" ]; then
   #Preserve Files for Artifacts
     echo -e "\n[+] Detected GH Actions... Preserving Logs & Output\n"
 else
   #Purge Files
     echo -e "\n[+] PURGING Logs & Output in 180 Seconds... (Hit Ctrl + C)\n" ; sleep 180
   #Cleanup (arm64_v8a_Android) Bins
     rm -rf "$BINDIR" 2>/dev/null
     rm -rf "$BINDIR.7z" 2>/dev/null
     rm -rf "$BASEUTILSDIR" 2>/dev/null
     rm -rf "$BASEUTILSDIR.7z" 2>/dev/null
 fi 
#-------------------------------------------------------#
##END
unset GIT_ASKPASS GIT_TERMINAL_PROMPT
unset TOOLPACKS_ANDROID_BUILDIR
#In case of build polluted env
unset AR AS CC CFLAGS CPP CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LD LDFLAGS LIBS NM OBJCOPY OBJDUMP RANLIB READELF SIZE STRINGS STRIP SYSROOT
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#EOF
#-------------------------------------------------------#