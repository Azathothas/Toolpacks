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
 export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.cargo/env:$HOME/.go/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/miniconda3/bin:$HOME/miniconda3/condabin:/usr/local/zig:/usr/local/zig/lib:/usr/local/zig/lib/include:/usr/local/musl/bin:/usr/local/musl/lib:/usr/local/musl/include:$PATH"
 SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
#TMPDIRS
 #For build-cache
 TMPDIRS="mktemp -d --tmpdir=$SYSTMP/toolpacks XXXXXXX_linux_aarch64" && export TMPDIRS="$TMPDIRS"
 rm -rf "$SYSTMP/toolpacks" 2>/dev/null ; mkdir -p "$SYSTMP/toolpacks"
 #For Bins
 BINDIR="$SYSTMP/toolpack_aarch64" && export BINDIR="$BINDIR"
 rm -rf "$BINDIR" 2>/dev/null ; rm -rf "$BINDIR.7z" 2>/dev/null ; mkdir -p "$BINDIR"
##Sane Configs
#In case of removed/privated GH repos
 # https://git-scm.com/docs/git#Documentation/git.txt-codeGITTERMINALPROMPTcode
 export GIT_TERMINAL_PROMPT="0"
 #https://git-scm.com/docs/git#Documentation/git.txt-codeGITASKPASScode
 export GIT_ASKPASS="/bin/echo"
 #in case of eget prompts
 EGET_TIMEOUT="timeout -k 1m 2m" && export EGET_TIMEOUT="$EGET_TIMEOUT"
 EGET_EXCLUDE="--asset \"^386\" --asset \"^amd\" --asset \"^apple\" --asset \"^AppImage\" --asset \"^asc\" --asset \"^crt\" --asset \"^darwin\" --asset \"^deb\" --asset \"^exe\" --asset \"^freebsd\" --asset \"^gnueabi\"  --asset \"^i686\" --asset \"^mac\" --asset \"^mips\" --asset \"^rpm\" --asset \"^sbom\" --asset \"^sha\" --asset \"^solaris\" --asset \"^sig\" --asset \"^symbol\" --asset \"^v7\" --asset \"^windows\" --asset \"^x86\"" && export EGET_EXCLUDE="$EGET_EXCLUDE"
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
#-------------------------------------------------------#
#Sanity Checks
if [[ -n "$GITHUB_TOKEN" ]]; then
   # 5000 req/minute (80 req/minute)
   echo "GITHUB_TOKEN is Exported"
   eget --rate
else
   # 60 req/hr
   echo -e "\n[+] GITHUB_TOKEN is NOT Exported"
   echo -e "Export it to avoid ratelimits\n"
   eget --rate
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
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/bins/metadata.json" | jq -r '.[].Source' | grep -i "\.sh$" | sort -u -o "$SYSTMP/BUILDURLS"
 #Run
  echo -e "\n\n [+] Started Building at :: $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
  for BUILD_URL in $(cat "$SYSTMP/BUILDURLS"); do
      echo -e "\n[+] Fetching : $BUILD_URL"
      curl -qfsSL "$BUILD_URL" -o "$BUILDSCRIPT"
      chmod +xwr "$BUILDSCRIPT"
      # (source "$BUILDSCRIPT") || true
      bash "$BUILDSCRIPT"
      # Clean & Purge
      sudo rm -rf "$SYSTMP/toolpacks" 2>/dev/null
      mkdir -p "$SYSTMP/toolpacks"
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
#Strip || Cleanup
 #Chmod +xwr
 find "$BINDIR" -maxdepth 1 -type f -exec chmod +xwr {} \; 2>/dev/null
 #Strip
 find "$BINDIR" -maxdepth 1 -type f -exec strip {} \; 2>/dev/null
 #Rename anything with *_amd*
 find "$BINDIR" -type f -name '*_Linux' -exec sh -c 'newname=$(echo "$1" | sed "s/_aarch64_arm64_Linux//"); mv "$1" "$newname"' sh {} \;
#-------------------------------------------------------#
#rClone Upload to R2 (bin.ajam.dev/aarch64_Linux) (aarch64_Linux) [Binaries]
 if command -v rclone &> /dev/null && [ -s "$HOME/.rclone.conf" ] && [ -d "$BINDIR" ] && [ "$(find "$BINDIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
    #Upload
      echo -e "\n[+] Uploading Results to R2 (rclone)\n"
      cd "$BINDIR" && rclone copy "." "r2:/bin/aarch64_arm64_Linux/" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
    ##Archive Binaries (.7z) (aarch64_Linux) Bins [Downstreamed RCLONE]
       if command -v 7z &> /dev/null && [ -d "$BINDIR" ] && [ "$(find "$BINDIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
            echo -e "\n\n[+] Purging Build Cache $SYSTMP/toolpacks --> Size :: $(du -sh $SYSTMP/toolpacks | awk '{print $1}')\n\n"
             du -h --max-depth="1" "$SYSTMP" 2>/dev/null | sort -hr
             rm -rf "$SYSTMP/toolpacks" 2>/dev/null
           #Fetch&Sync
             cd "$BINDIR"
             rclone copy "r2:/bin/aarch64_arm64_Linux/" "." --exclude="Baseutils/**" --exclude="BLAKE3SUM" --exclude="*.7z" --exclude="*.json" --exclude="*.log" --exclude="*.md" --exclude="SHA256SUM" --exclude="*.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
            #Strip || Cleanup
             #Chmod +xwr
             find "$BINDIR" -maxdepth 1 -type f -exec chmod +xwr {} \; 2>/dev/null
             #Strip
             find "$BINDIR" -maxdepth 1 -type f -exec strip {} \; 2>/dev/null
             #Rename anything with *_amd*
             find "$BINDIR" -type f -name '*_Linux' -exec sh -c 'newname=$(echo "$1" | sed "s/_aarch64_arm64_Linux//"); mv "$1" "$newname"' sh {} \;
            #File
              cd "$BINDIR" && "/bin/bash" -c 'PS4="$ ";file ./* | grep -v '.txt' ' &> "$SYSTMP/aarch64_Linux_FILE"
              rclone copyto "$SYSTMP/aarch64_Linux_FILE" "r2:/bin/aarch64_arm64_Linux/FILE.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
            #Size (Dust)
              dust -b -c -i -r -n 99999999 "$BINDIR" | tee "$SYSTMP/aarch64_Linux_SIZE.txt"
              rclone copyto "$SYSTMP/aarch64_Linux_SIZE.md" "r2:/bin/aarch64_arm64_Linux/SIZE.md" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
              rclone copyto "$SYSTMP/aarch64_Linux_SIZE.txt" "r2:/bin/aarch64_arm64_Linux/SIZE.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
            #BLAKE3SUM
              cd "$BINDIR" && "/bin/bash" -c 'PS4="$ ";b3sum ./* | grep -v '.txt' ' &> "$SYSTMP/aarch64_Linux_BLAKE3SUM"
              rclone copyto "$SYSTMP/aarch64_Linux_BLAKE3SUM" "r2:/bin/aarch64_arm64_Linux/BLAKE3SUM.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
            #SHA256SUM
              cd "$BINDIR" && "/bin/bash" -c 'PS4="$ ";sha256sum ./* | grep -v '.txt' ' &> "$SYSTMP/aarch64_Linux_SHA256SUM"
              rclone copyto "$SYSTMP/aarch64_Linux_SHA256SUM" "r2:/bin/aarch64_arm64_Linux/SHA256SUM.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
           #Archive
             7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BINDIR.7z" "$BINDIR" 2>/dev/null
           #Meta
             du -sh "$BINDIR.7z" && file "$BINDIR.7z"
       fi
  else
   ##Archive Binaries (.7z) (aarch64_Linux) Bins
     if command -v 7z &> /dev/null && [ -d "$BINDIR" ] && [ "$(find "$BINDIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
          echo -e "\n\n[+] Purging Build Cache $SYSTMP/toolpacks --> Size :: $(du -sh $SYSTMP/toolpacks | awk '{print $1}')\n\n"
           du -h --max-depth="1" "$SYSTMP" 2>/dev/null | sort -hr
           rm -rf "$SYSTMP/toolpacks" 2>/dev/null
         #Archive
           7z a -t7z -mx="9" -mmt="$(($(nproc)+1))" -bt "$BINDIR.7z" "$BINDIR" 2>/dev/null
         #Meta
           du -sh "$BINDIR.7z" && file "$BINDIR.7z"
     fi
 fi
#-------------------------------------------------------# 
 if command -v rclone &> /dev/null && [ -s "$HOME/.rclone.conf" ] && [ -s "$BINDIR.7z" ]; then
 # rClone Upload Toolpacks to R2 (bin.ajam.dev/aarch64_Linux/_toolpack_aarch64_arm64.7z) [Archive]
     #Upload
      echo -e "\n[+] Uploading Results to R2 (rclone)\n"
      rclone copyto "$BINDIR.7z" "r2:/bin/aarch64_arm64_Linux/_toolpack_aarch64_arm64.7z" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
     #BLAKE3SUM
      cd "$SYSTMP/" && /bin/bash -c 'PS4="$ ";b3sum ./toolpack_aarch64.7z | grep -v '.txt' ' &> "$SYSTMP/_toolpack_aarch64_arm64_BLAKE3SUM"
      rclone copyto "$SYSTMP/_toolpack_aarch64_arm64_BLAKE3SUM" "r2:/bin/aarch64_arm64_Linux/_toolpack_aarch64_arm64_BLAKE3SUM.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
     #SHA256SUM
      cd "$SYSTMP/" && /bin/bash -c 'PS4="$ ";sha256sum ./toolpack_aarch64.7z | grep -v '.txt' ' &> "$SYSTMP/_toolpack_aarch64_arm64_SHA256SUM"
      rclone copyto "$SYSTMP/_toolpack_aarch64_arm64_SHA256SUM" "r2:/bin/aarch64_arm64_Linux/_toolpack_aarch64_arm64_SHA256SUM.txt" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) obsidian/1.5.3 Chrome/114.0.5735.289 Electron/25.8.1 Safari/537.36" --buffer-size="100M" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --check-first --checksum --copy-links --fast-list --progress
 fi
#-------------------------------------------------------#
#META
 echo -e "\n\n[+] Size $BINDIR --> $(du -sh $BINDIR | awk '{print $1}')"
 echo -e "[+] Size $BINDIR.7z --> $(du -sh $BINDIR.7z | awk '{print $1}')\n\n"
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
 fi 
#-------------------------------------------------------#
##END
unset GIT_ASKPASS GIT_TERMINAL_PROMPT
#In case of zig polluted env 
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#EOF
#-------------------------------------------------------#