#!/usr/bin/env bash

#-------------------------------------------------------#
# This should be run on Debian (Debian Based) Distros with apt, coreutils, curl, dos2unix & passwordless sudo
# sudo apt-get update -y && sudo apt-get install coreutils curl dos2unix moreutils -y
# OR (without sudo): apt-get update -y && apt-get install coreutils curl dos2unix moreutils sudo -y
#
# Hardware : At least 2vCPU + 8GB RAM + 50GB SSD
# Once requirement is satisfied, simply:
# export GITHUB_TOKEN="NON_PRIVS_READ_ONLY_TOKEN"
# bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/build_debian.sh")
#-------------------------------------------------------#

#-------------------------------------------------------#
##ENV:$PATH
 export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.cargo/env:$HOME/.go/bin:$HOME/go/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$HOME/.local/bin:$HOME/miniconda3/bin:$HOME/miniconda3/condabin:/usr/local/zig:/usr/local/zig/lib:/usr/local/zig/lib/include:/usr/local/musl/bin:/usr/local/musl/lib:/usr/local/musl/include:$PATH"
 SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
#TMPDIRS
 #For build-cache
 TMPDIRS="mktemp -d --tmpdir=$SYSTMP/toolpacks XXXXXXX_linux_aarch64" && export TMPDIRS="$TMPDIRS"
 rm -rf "$SYSTMP/toolpacks" 2>/dev/null ; mkdir -p "$SYSTMP/toolpacks"
 #For Bins
 BINDIR="$SYSTMP/toolpack_aarch64" && export BINDIR="$BINDIR"
 rm -rf "$BINDIR" 2>/dev/null ; rm -rf "$BINDIR.7z" 2>/dev/null ; mkdir -p "$BINDIR"
 #For Baseutils
 BASEUTILSDIR="$SYSTMP/baseutils_aarch64" && export BASEUTILSDIR="$BASEUTILSDIR"
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
##rClone
#https://rclone.org/faq/#rclone-is-using-too-much-memory-or-appears-to-have-a-memory-leak
 export GOGC="20"
#-------------------------------------------------------#

#-------------------------------------------------------#
##Init
 #Get
 INITSCRIPT="$(mktemp --tmpdir=$SYSTMP XXXXX_init.sh)" && export INITSCRIPT="$INITSCRIPT"
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/init_debian.sh" -o "$INITSCRIPT"
 chmod +xwr "$INITSCRIPT" && source "$INITSCRIPT"
 #Check
 if [ "$CONTINUE" != "YES" ]; then
      echo -e "\n[+] Failed To Initialize\n"
      exit 1
 fi
##Ulimits
#(-n) Open File Descriptors
 echo -e "[+] ulimit -n (open file descriptors) :: [Soft --> $(ulimit -n -S)] [Hard --> $(ulimit -n -H)] [Total --> $(cat '/proc/sys/fs/file-max')]"
 ulimit -n "$(ulimit -n -H)"
#Stack Size
 ulimit -s unlimited 
#-------------------------------------------------------#
 
#-------------------------------------------------------#
##Sanity Checks
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
 TMPDIRS="mktemp -d --tmpdir=$SYSTMP/toolpacks XXXXXXX_linux_aarch64" && export TMPDIRS="$TMPDIRS"
 rm -rf "$SYSTMP/toolpacks" 2>/dev/null ; mkdir -p "$SYSTMP/toolpacks"
 #For Bins
 BINDIR="$SYSTMP/toolpack_aarch64" && export BINDIR="$BINDIR"
 rm -rf "$BINDIR" 2>/dev/null ; rm -rf "$BINDIR.7z" 2>/dev/null ; mkdir -p "$BINDIR"
##Build
set +x
 BUILD="YES" && export BUILD="$BUILD"
 #ENV
 BUILDSCRIPT="$(mktemp --tmpdir=$SYSTMP XXXXX_build.sh)" && export BUILDSCRIPT="$BUILDSCRIPT"
 #Get URlS
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/metadata.json" | jq -r '.[].source_url' | grep -i "\.sh$" | sort -u -o "$SYSTMP/BUILDURLS"
 #Run
  echo -e "\n\n [+] Started Building at :: $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
  #for BUILD_URL in $(cat "$SYSTMP/BUILDURLS"); do
  #   #Init
  #    START_TIME="$(date +%s)" && export START_TIME="$START_TIME"
  #    echo -e "\n[+] Fetching : $BUILD_URL"
  #   #Fetch 
  #    curl -qfsSL "$BUILD_URL" -o "$BUILDSCRIPT"
  #    chmod +xwr "$BUILDSCRIPT"
  #   #Run 
  #    source "$BUILDSCRIPT" || true
  #    #bash "$BUILDSCRIPT"
  #   #Clean & Purge
  #    sudo rm -rf "$SYSTMP/toolpacks" 2>/dev/null
  #    mkdir -p "$SYSTMP/toolpacks"
  #   #Finish
  #    END_TIME="$(date +%s)" && export END_TIME="$END_TIME"
  #    #ELAPSED_TIME="$(date -u -d@"$((END_TIME - START_TIME))" +%T)" && export ELAPSED_TIME="$ELAPSED_TIME"
  #    ELAPSED_TIME="$(date -u -d@"$((END_TIME - START_TIME))" "+%H(Hr):%M(Min):%S(Sec)")"
  #    echo -e "\n[+] Completed (Building|Fetching) $BIN [$SOURCE_URL] :: $ELAPSED_TIME\n"
  #done
  readarray -t RECIPES < "$SYSTMP/BUILDURLS"
  unset TOTAL_RECIPES
  TOTAL_RECIPES="${#RECIPES[@]}" && export TOTAL_RECIPES="${TOTAL_RECIPES}" ; echo -e "\n[+] Total RECIPES :: ${TOTAL_RECIPES}\n"
    for ((i=0; i<${#RECIPES[@]}; i++)); do
      #Init
        START_TIME="$(date +%s)" && export START_TIME="$START_TIME"
        RECIPE="${RECIPES[i]}"
        CURRENT_RECIPE=$((i+1))
        echo -e "\n[+] Fetching : ${RECIPE} (${CURRENT_RECIPE}/${TOTAL_RECIPES})\n"
      #Fetch
        curl -qfsSL "${RECIPE}" -o "$BUILDSCRIPT"
        chmod +xwr "$BUILDSCRIPT"
      #Run 
        source "$BUILDSCRIPT" || true
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
 find "$BINDIR" -maxdepth 1 -type f ! -name "*.no_strip" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
 #Rename anything with *_amd*
 find "$BINDIR" -type f -name '*_Linux' -exec sh -c 'newname=$(echo "$1" | sed "s/_aarch64_arm64_Linux//"); mv "$1" "$newname"' sh {} \;
#-------------------------------------------------------#
#Strip || Cleanup [$BASEUTILSDIR]
 #Chmod +xwr
 find "$BASEUTILSDIR" -maxdepth 1 -type f -exec chmod +xwr {} \; 2>/dev/null
 #Strip
 find "$BASEUTILSDIR" -maxdepth 1 -type f ! -name "*.no_strip" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
 #Rename anything with *_amd*
 find "$BASEUTILSDIR" -type f -name '*_Linux' -exec sh -c 'newname=$(echo "$1" | sed "s/_aarch64_arm64_Linux//"); mv "$1" "$newname"' sh {} \;
#-------------------------------------------------------#
#rClone Upload to R2 (bin.ajam.dev/aarch64_Linux) (aarch64_Linux) [Binaries]
 if command -v rclone &> /dev/null && [ -s "$HOME/.config/rclone/rclone.conf" ] && [ -d "$BINDIR" ] && [ "$(find "$BINDIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
    #Upload [$BINDIR]
      rclone_main_up()
      {
        echo -e "\n[+] Uploading Results to R2 (Main)\n" 
         rclone copy "." "r2:/bin/aarch64_arm64_Linux/" --user-agent="$USER_AGENT" --buffer-size="10M" --s3-upload-concurrency="50" --s3-chunk-size="10M" --multi-thread-streams="50" --checkers="2000" --transfers="100" --retries="10" --check-first --checksum --copy-links --fast-list --progress
      }
      export -f rclone_main_up
      cd "$BINDIR"
      sleep 60 && rclone_main_up ; sleep 60 && rclone_main_up ; sleep 60 && rclone_main_up
    #Upload [$BASEUTILSDIR]
      rclone_base_up()
      {
        echo -e "\n[+] Uploading Results to R2 (Baseutils)\n"
         cd "$BASEUTILSDIR" && rclone copy "." "r2:/bin/aarch64_arm64_Linux/Baseutils/" --user-agent="$USER_AGENT" --buffer-size="10M" --s3-upload-concurrency="50" --s3-chunk-size="10M" --multi-thread-streams="50" --checkers="2000" --transfers="100" --retries="10" --check-first --checksum --copy-links --fast-list --progress
      }
      export -f rclone_base_up
      sleep 60 && rclone_base_up ; sleep 60 && rclone_base_up ; sleep 60 && rclone_base_up
    ##Archive Binaries (.7z) (aarch64_Linux) Bins [Downstreamed RCLONE]
       if command -v 7z &> /dev/null && [ -d "$BINDIR" ] && [ "$(find "$BINDIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
            echo -e "\n\n[+] Purging Build Cache $SYSTMP/toolpacks --> Size :: $(du -sh $SYSTMP/toolpacks | awk '{print $1}')\n\n"
             du -h --max-depth="1" "$SYSTMP" 2>/dev/null | sort -hr
             rm -rf "$SYSTMP/toolpacks" 2>/dev/null
          ##Fetch&Sync [$BINDIR]
             cd "$BINDIR"
             rclone delete "r2:/bin/aarch64_arm64_Linux/" --include "*.jq" --disable ListR --checkers="2000" --transfers="100" --progress
             rclone lsf "r2:/bin/aarch64_arm64_Linux/" --dirs-only --fast-list --exclude "Baseutils/**" | xargs -I "{}" rclone delete "r2:/bin/aarch64_arm64_Linux/{}" --disable ListR --checkers="2000" --transfers="100" --progress
             rclone delete "r2:/bin/" --include ".*" --disable ListR --checkers="2000" --transfers="100" --progress
             rclone_main_dw()
             {
               rclone copy "r2:/bin/aarch64_arm64_Linux/" "." --exclude="Baseutils/**" --exclude="*.7z" --exclude="*.gz" --exclude="*.jq" --exclude="*.json" --exclude="*.log" --exclude="*.md" --exclude="*.tar" --exclude="*.tgz" --exclude="*.tmp" --exclude="*.txt" --exclude="*.upx" --exclude="*.zip" --user-agent="$USER_AGENT" --buffer-size="10M" --s3-upload-concurrency="50" --s3-chunk-size="10M" --multi-thread-streams="50" --checkers="2000" --transfers="100" --retries="10" --check-first --checksum --copy-links --fast-list --progress
             }
             export -f rclone_main_dw
             sleep 60 && rclone_main_dw ; sleep 60 && rclone_main_dw ; sleep 60 && rclone_main_dw
            #Strip || Cleanup
             #Chmod +xwr
             find "$BINDIR" -maxdepth 1 -type f -exec chmod +xwr {} \; 2>/dev/null
             #Strip
             find "$BINDIR" -maxdepth 1 -type f ! -name "*.no_strip" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
             #Rename anything with *_amd*
             find "$BINDIR" -type f -name '*_Linux' -exec sh -c 'newname=$(echo "$1" | sed "s/_aarch64_arm64_Linux//"); mv "$1" "$newname"' sh {} \;
            #File
              cd "$BINDIR" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.log$|\.md$|\.png$|\.txt$|\.upx$' | sort | xargs file > "$SYSTMP/aarch64_Linux_FILE"
              rclone copyto "$SYSTMP/aarch64_Linux_FILE" "r2:/bin/aarch64_arm64_Linux/FILE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #Size (Dust)
              dust --depth 1 --only-file --no-percent-bars --no-colors --ignore_hidden --reverse --number-of-lines 99999999 "$BINDIR" | tee "$SYSTMP/aarch64_Linux_SIZE.txt"
              rclone copyto "$SYSTMP/aarch64_Linux_SIZE.md" "r2:/bin/aarch64_arm64_Linux/SIZE.md" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
              rclone copyto "$SYSTMP/aarch64_Linux_SIZE.txt" "r2:/bin/aarch64_arm64_Linux/SIZE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #BLAKE3SUM
              cd "$BINDIR" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.log$|\.md$|\.png$|\.txt$|\.upx$' | sort | xargs b3sum > "$SYSTMP/aarch64_Linux_BLAKE3SUM"
              rclone copyto "$SYSTMP/aarch64_Linux_BLAKE3SUM" "r2:/bin/aarch64_arm64_Linux/BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #SHA256SUM
              cd "$BINDIR" && find "./" -maxdepth 1 -type f | grep -v -E '\.jq$|\.log$|\.md$|\.png$|\.txt$|\.upx$' | sort | xargs sha256sum > "$SYSTMP/aarch64_Linux_SHA256SUM"
              rclone copyto "$SYSTMP/aarch64_Linux_SHA256SUM" "r2:/bin/aarch64_arm64_Linux/SHA256SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
           #Archive
             7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BINDIR.7z" "$BINDIR" 2>/dev/null
           #Meta
             du -sh "$BINDIR.7z" && file "$BINDIR.7z"
          ##Fetch&Sync [$BASEUTILSDIR]
             cd "$BASEUTILSDIR"
             rclone_base_dw()
             {
               rclone copy "r2:/bin/aarch64_arm64_Linux/Baseutils/" "." --exclude="*.7z" --exclude="*.gz" --exclude="*.jq" --exclude="*.json" --exclude="*.log" --exclude="*.md" --exclude="*.png" --exclude="*.svg" --exclude="*.tar" --exclude="*.tgz" --exclude="*.txt" --exclude="*.tmp" --exclude="*.upx" --exclude="*.yaml" --exclude="*.zip" --user-agent="$USER_AGENT" --buffer-size="10M" --s3-upload-concurrency="50" --s3-chunk-size="10M" --multi-thread-streams="50" --checkers="2000" --transfers="100" --retries="10" --check-first --checksum --copy-links --fast-list --progress
             }
             export -f rclone_base_dw
             sleep 60 && rclone_base_dw ; sleep 60 && rclone_base_dw ; sleep 60 && rclone_base_dw
            #Strip || Cleanup
             #Chmod +xwr
             find "$BASEUTILSDIR" -type f -exec chmod +xwr {} \; 2>/dev/null
             #Strip
             find "$BASEUTILSDIR" -type f ! -name "*.no_strip" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
             #Rename anything with *_amd*
             find "$BASEUTILSDIR" -type f -name '*_Linux' -exec sh -c 'newname=$(echo "$1" | sed "s/_aarch64_arm64_Linux//"); mv "$1" "$newname"' sh {} \;
            #File
              cd "$BASEUTILSDIR" && find "./" -type f | grep -v '.txt' | sort | xargs file > "$SYSTMP/aarch64_Linux_Baseutils_FILE"
              rclone copyto "$SYSTMP/aarch64_Linux_Baseutils_FILE" "r2:/bin/aarch64_arm64_Linux/Baseutils/FILE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #Size (Dust)
              dust --only-file --no-percent-bars --no-colors --ignore_hidden --reverse --number-of-lines 99999999 "$BASEUTILSDIR" | tee "$SYSTMP/aarch64_Linux_Baseutils_SIZE.txt"
              rclone copyto "$SYSTMP/aarch64_Linux_Baseutils_SIZE.md" "r2:/bin/aarch64_arm64_Linux/Baseutils/SIZE.md" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
              rclone copyto "$SYSTMP/aarch64_Linux_Baseutils_SIZE.txt" "r2:/bin/aarch64_arm64_Linux/Baseutils/SIZE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #BLAKE3SUM
              cd "$BASEUTILSDIR" && find "./" -type f | grep -v '.txt' | sort | xargs b3sum > "$SYSTMP/aarch64_Linux_Baseutils_BLAKE3SUM"
              rclone copyto "$SYSTMP/aarch64_Linux_Baseutils_BLAKE3SUM" "r2:/bin/aarch64_arm64_Linux/Baseutils/BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #SHA256SUM
              cd "$BASEUTILSDIR" && find "./" -type f | grep -v '.txt' | sort | xargs sha256sum > "$SYSTMP/aarch64_Linux_Baseutils_SHA256SUM"
              rclone copyto "$SYSTMP/aarch64_Linux_Baseutils_SHA256SUM" "r2:/bin/aarch64_arm64_Linux/Baseutils/SHA256SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
           #Archive
             7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BASEUTILSDIR.7z" "$BASEUTILSDIR" 2>/dev/null
           #Meta
             du -sh "$BASEUTILSDIR.7z" && file "$BASEUTILSDIR.7z"
       fi
  else
   ##Archive Binaries (.7z) (aarch64_Linux) Bins
     if command -v 7z &> /dev/null && [ -d "$BINDIR" ] && [ "$(find "$BINDIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
          echo -e "\n\n[+] Purging Build Cache $SYSTMP/toolpacks --> Size :: $(du -sh $SYSTMP/toolpacks | awk '{print $1}')\n\n"
           du -h --max-depth="1" "$SYSTMP" 2>/dev/null | sort -hr
           rm -rf "$SYSTMP/toolpacks" 2>/dev/null ; mkdir -p "$SYSTMP/toolpacks"
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
 #rClone Upload Toolpacks to R2 (bin.ajam.dev/aarch64_Linux/_toolpack_aarch64_arm64.7z) [Archive]
     #Upload
      echo -e "\n[+] Uploading Results to R2 (rclone)\n"
      rclone copyto "$BINDIR.7z" "r2:/bin/aarch64_arm64_Linux/_toolpack_aarch64_arm64.7z" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #BLAKE3SUM
      cd "$SYSTMP/" && /bin/bash -l -c 'PS4="$ ";b3sum ./toolpack_aarch64.7z | grep -v '.txt' ' &> "$SYSTMP/_toolpack_aarch64_arm64_BLAKE3SUM"
      rclone copyto "$SYSTMP/_toolpack_aarch64_arm64_BLAKE3SUM" "r2:/bin/aarch64_arm64_Linux/_toolpack_aarch64_arm64_BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #SHA256SUM
      cd "$SYSTMP/" && /bin/bash -l -c 'PS4="$ ";sha256sum ./toolpack_aarch64.7z | grep -v '.txt' ' &> "$SYSTMP/_toolpack_aarch64_arm64_SHA256SUM"
      rclone copyto "$SYSTMP/_toolpack_aarch64_arm64_SHA256SUM" "r2:/bin/aarch64_arm64_Linux/_toolpack_aarch64_arm64_SHA256SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
 #rClone Upload Toolpacks to R2 (bin.ajam.dev/aarch64_Linux/_baseutils_aarch64_arm64.7z) [Archive]
     #Upload
      echo -e "\n[+] Uploading Results to R2 (rclone)\n"
      rclone copyto "$BASEUTILSDIR.7z" "r2:/bin/aarch64_arm64_Linux/Baseutils/_baseutils_aarch64_arm64.7z" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #BLAKE3SUM
      cd "$SYSTMP/" && /bin/bash -l -c 'PS4="$ ";b3sum ./baseutils_aarch64.7z | grep -v '.txt' ' &> "$SYSTMP/_baseutils_aarch64_arm64_BLAKE3SUM"
      rclone copyto "$SYSTMP/_baseutils_aarch64_arm64_BLAKE3SUM" "r2:/bin/aarch64_arm64_Linux/Baseutils/_baseutils_aarch64_arm64_BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #SHA256SUM
      cd "$SYSTMP/" && /bin/bash -l -c 'PS4="$ ";sha256sum ./baseutils_aarch64.7z | grep -v '.txt' ' &> "$SYSTMP/_baseutils_aarch64_arm64_SHA256SUM"
      rclone copyto "$SYSTMP/_baseutils_aarch64_arm64_SHA256SUM" "r2:/bin/aarch64_arm64_Linux/Baseutils/_baseutils_aarch64_arm64_SHA256SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress      
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
   #Cleanup (aarch64_Linux) Bins
     rm -rf "$BINDIR" 2>/dev/null
     rm -rf "$BINDIR.7z" 2>/dev/null
     rm -rf "$BASEUTILSDIR" 2>/dev/null
     rm -rf "$BASEUTILSDIR.7z" 2>/dev/null
 fi 
#-------------------------------------------------------# 
#UPX
if [ "${UPX_PACK}" = "YES" ]; then
   #Fetch
     mkdir -p "$SYSTMP/toolpacks" 
     pushd "$($TMPDIRS)" >/dev/null 2>&1
     UPX_PACK_DIR="$(realpath .)" && export UPX_PACK_DIR="${UPX_PACK_DIR}"
     echo -e "\n[+] UPX Packing Enabled (DIR: ${UPX_PACK_DIR})\n"
     rclone sync "r2:/bin/aarch64_arm64_Linux/" "." --user-agent="$USER_AGENT" --buffer-size="10M" --s3-upload-concurrency="50" --s3-chunk-size="10M" --multi-thread-streams="50" --checkers="2000" --transfers="100" --retries="10" --check-first --checksum --copy-links --fast-list --progress
   #Pack:: https://github.com/upx/upx/blob/devel/doc/upx-doc.txt
     if command -v upx &> /dev/null && [ -d "${UPX_PACK_DIR}" ] && [ "$(find "${UPX_PACK_DIR}" -mindepth 1 -print -quit 2>/dev/null)" ]; then
       find . -type f -exec chmod +xwr {} \; 2>/dev/null
       find . -type f ! -name '*.upx' ! -name '*.no_strip' -exec file -i '{}' \; | grep "application/.*executable" | cut -d':' -f1 | xargs realpath | sort -u -o "$SYSTMP/upx_input.txt"
       readarray -t files < "$SYSTMP/upx_input.txt"
       unset CURRENT_BIN TOTAL_BINS UPX
       START_TIME="$(date +%s)" && export START_TIME="$START_TIME"
       TOTAL_BINS="${#files[@]}" && export TOTAL_BINS="${TOTAL_BINS}" ; echo -e "\n[+] Total BINS :: ${TOTAL_BINS}\n"
         for ((i=0; i<${#files[@]}; i++)); do
             file="${files[i]}"
             CURRENT_BIN=$((i+1))
             echo -e "\n[+] UPX Packing $file --> $file.upx (${CURRENT_BIN}/${TOTAL_BINS})\n"
             upx --best "$file" -f --force-overwrite -o"$file.upx" -qq
         done
       END_TIME="$(date +%s)" && export END_TIME="$END_TIME"
       ELAPSED_TIME="$(date -u -d@"$((END_TIME - START_TIME))" "+%H(Hr):%M(Min):%S(Sec)")"
       echo -e "\n[+] UPX Packing (Elapsed Time) $ELAPSED_TIME\n"  
       #Sync
        rclone_upx_sync()
        {
           rclone copy "r2:/bin/aarch64_arm64_Linux/" "." --user-agent="$USER_AGENT" --buffer-size="10M" --s3-upload-concurrency="50" --s3-chunk-size="10M" --multi-thread-streams="50" --checkers="2000" --transfers="100" --retries="10" --check-first --checksum --copy-links --fast-list --progress
           sleep 30
           rclone sync "." "r2:/bin/aarch64_arm64_Linux/" --user-agent="$USER_AGENT" --buffer-size="10M" --s3-upload-concurrency="50" --s3-chunk-size="10M" --multi-thread-streams="50" --checkers="2000" --transfers="100" --retries="10" --check-first --checksum --copy-links --fast-list --progress
        }
        export -f rclone_upx_sync
        sleep 60 && rclone_upx_sync ; sleep 60 && rclone_upx_sync ; sleep 60 && rclone_upx_sync
     fi
   #Cleanup
     popd >/dev/null 2>&1
     sudo rm -rf "${UPX_PACK_DIR}"
     unset CURRENT_BIN TOTAL_BINS UPX_PACK_DIR
fi
#-------------------------------------------------------#
##END
unset GIT_ASKPASS GIT_TERMINAL_PROMPT
#In case of zig polluted env 
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#EOF
#-------------------------------------------------------#