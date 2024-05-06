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
 TMPDIRS="mktemp -d --tmpdir=$SYSTMP/toolpacks XXXXXXX_android_arm64-v8a" && export TMPDIRS="$TMPDIRS"
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
#-------------------------------------------------------#


#-------------------------------------------------------#
##Debloat
 bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Github/Runners/Ubuntu/debloat.sh")
 bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Github/Runners/Ubuntu/debloat.sh") 2>/dev/null
 #echo -e "\n[+] Debloating GH Runner...\n"
 #  #This is needed, this is the ndk
 #  #12.0 GB
 #  #sudo rm "/usr/local/lib/android" -rf 2>/dev/null &
 #  #8.2 GB
 #  sudo rm "/opt/hostedtoolcache/CodeQL" -rf 2>/dev/null &
 #  #5.0 GB
 #  sudo rm "/usr/local/.ghcup" -rf 2>/dev/null &
 #  #2.0 GB
 #  sudo rm "/usr/share/dotnet" -rf 2>/dev/null &
 #  #1.7 GB
 #  sudo rm "/usr/share/swift" -rf 2>/dev/null &
 #  #1.1 GB
 #  #sudo rm "/usr/local/lib/node_modules" -rf 2>/dev/null &
 #  #1.0 GB
 #  sudo rm "/usr/local/share/powershell" -rf 2>/dev/null &
 #  #500 MB
 #  sudo rm "/usr/local/lib/heroku" -rf 2>/dev/null &
 ##wait
 #wait ; echo
#-------------------------------------------------------#


#-------------------------------------------------------#
##Init
 #Install CoreUtils & Deps
  sudo apt-get update -y 2>/dev/null
  sudo apt-get install apt-transport-https apt-utils ca-certificates coreutils gnupg2 moreutils software-properties-common util-linux -y 2>/dev/null ; sudo apt-get update -y 2>/dev/null
 #Install Build Des
  sudo apt-get install aria2 automake bc binutils b3sum build-essential ca-certificates ccache diffutils dos2unix gawk lzip jq libtool libtool-bin make musl musl-dev musl-tools p7zip-full rsync texinfo wget -y 2>/dev/null
  sudo apt-get install -y --no-install-recommends autoconf automake autopoint binutils bison build-essential byacc ca-certificates clang flex file jq libtool libtool-bin patch patchelf pkg-config qemu-user-static scons wget 2>/dev/null
  sudo apt-get install devscripts -y --no-install-recommends 2>/dev/null
  sudo apt-get install cmake -y
 #Re
  sudo apt-get install aria2 automake bc binutils b3sum build-essential ca-certificates ccache diffutils dos2unix gawk lzip jq libtool libtool-bin make musl musl-dev musl-tools p7zip-full rsync texinfo wget -y 2>/dev/null
  sudo apt-get install -y --no-install-recommends autoconf automake autopoint binutils bison build-essential byacc ca-certificates clang flex file jq libtool libtool-bin patch patchelf pkg-config qemu-user-static scons wget 2>/dev/null
  sudo apt-get install devscripts -y --no-install-recommends 2>/dev/null
  sudo apt-get install cmake -y
 #Install Build Dependencies (arm64)
  sudo apt install binutils-aarch64-linux-gnu -y 2>/dev/null
  sudo apt-get install "g++-arm-linux-gnueabi" "g++-arm-linux-gnueabihf" "g++-aarch64-linux-gnu" qemu-user-static -y 2>/dev/null
 #python
  sudo apt install python3-pip python3-venv -y 2>/dev/null
  #Upgrade pip
   pip --version
   pip install --break-system-packages --upgrade pip || pip install --upgrade pip
   pip --version
  #Deps 
   sudo apt install lm-sensors pciutils procps python3-distro python3-netifaces sysfsutils virt-what -y 2>/dev/null
   sudo apt-get install libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev scons xcb -y 2>/dev/null
   pip install build cffi scons scuba pytest --upgrade 2>/dev/null ; pip install ansi2txt pipx scons staticx pyinstaller py2static typer --upgrade 2>/dev/null
   pip install build cffi scons scuba pytest --break-system-packages --upgrade 2>/dev/null ; pip install ansi2txt pipx scons staticx pyinstaller py2static typer --break-system-packages --upgrade 2>/dev/null
##Addons
 bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/Debian/install_bb_tools_x86_64.sh") 
 reset ; echo ; reset
#-------------------------------------------------------#


#-------------------------------------------------------#
##Langs
if [ "$CONTINUE" == "YES" ]; then
     #----------------------#
     #Docker
      curl -qfsSL "https://get.docker.com" | sudo bash
      sudo groupadd docker 2>/dev/null ; sudo usermod -aG docker "$USER" 2>/dev/null
      #newgrp docker 2>/dev/null
      #Test
      if ! command -v docker &> /dev/null; then
         echo -e "\n[-] docker NOT Found\n"
         export CONTINUE="NO" && exit 1
      else
         docker --version ; sudo docker run hello-world
         sudo ldconfig && sudo ldconfig -p
         #newgrp 2>/dev/null
      fi
     #----------------------# 
     #Crystal
      curl -qfsSL "https://crystal-lang.org/install.sh" | sudo bash
      #Test
      if ! command -v crystal &> /dev/null; then
         echo -e "\n[-] crystal NOT Found\n"
         export CONTINUE="NO" && exit 1
      else
         crystal --version ; shards --version
         sudo ldconfig && sudo ldconfig -p
      fi 
     #----------------------#          
     #golang 
      echo "yes" | bash <(curl -qfsSL "https://git.io/go-installer")
      #Test
      if ! command -v go &> /dev/null; then
         echo -e "\n[-] go NOT Found\n"
         export CONTINUE="NO" && exit 1
      else
         go version
         sudo ldconfig && sudo ldconfig -p
      fi
     #----------------------# 
     ##Nix
      ##Official Installers break
      #curl -qfsSL "https://nixos.org/nix/install" | bash -s -- --no-daemon
      #source "$HOME/.bash_profile" ; source "$HOME/.nix-profile/etc/profile.d/nix.sh" ; . "$HOME/.nix-profile/etc/profile.d/nix.sh"
      ##https://github.com/DeterminateSystems/nix-installer
      "/nix/nix-installer" uninstall --no-confirm 2>/dev/null
      curl -qfsSL "https://install.determinate.systems/nix" | bash -s -- install linux --init none --no-confirm
      #Source
      source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
      #Fix perms: could not set permissions on '/nix/var/nix/profiles/per-user' to 755: Operation not permitted
      #sudo chown --recursive "$USER" "/nix"
      sudo chown --recursive "runner" "/nix"
      echo "root    ALL=(ALL:ALL) ALL" | sudo tee -a "/etc/sudoers"
      #Test
      if ! command -v nix &> /dev/null; then
         echo -e "\n[-] nix NOT Found\n"
         export CONTINUE="NO" && exit 1
      else
         nix --version && nix-channel --list && nix-channel --update
      fi
     #----------------------# 
     ##Purge:
     #sudo rm -rf "/etc/bash.bashrc.backup-before-nix" "/etc/nix" "/nix" "/root/.nix-profile" "/root/.nix-defexpr" "/root/.nix-channels" "/root/.local/state/nix" "/root/.cache/nix" "$HOME/.nix-profile" "$HOME/.nix-defexpr" "$HOME/.nix-channels" "$HOME/.local/state/nix" "$HOME/.cache/nix" 2>/dev/null
     ##Node:
      bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/Debian/install_node_x86_64.sh")
      #Test
      if ! command -v npm &> /dev/null; then
         echo -e "\n[-] node (npm) NOT Found\n"
         export CONTINUE="NO" && exit 1
      else
         node --version && npm --version
         #Nexe:https://github.com/nexe/nexe
         npm install nexe --global
      fi
     #----------------------# 
     #rust & cargo
      bash <(curl -qfsSL "https://sh.rustup.rs") -y
      #Test: PATH="$HOME/.cargo/bin:$HOME/.cargo/env:$PATH" 
      if ! command -v cargo &> /dev/null; then
         echo -e "\n[-] cargo (rust) NOT Found\n"
         export CONTINUE="NO" && exit 1
      else
         rustc --version && cargo --version
         #Cross-rs
         cargo install cross --git "https://github.com/cross-rs/cross"
         sudo ldconfig && sudo ldconfig -p
      fi
     #----------------------#
     #zig
      curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/Debian/install_zig.sh" | bash
      #Test: ZIG_PATH="/usr/local/zig:/usr/local/zig/lib:/usr/local/zig/lib/include:$PATH"
      if ! command -v zig &> /dev/null; then
         echo -e "\n[-] zig NOT Found\n"
         export CONTINUE="NO" && exit 1
      else
         zig version
         sudo ldconfig && sudo ldconfig -p
      fi          
      find "$SYSTMP" -type d -name "*zig*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
      find "$SYSTMP" -type f -name "*zig*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
     #----------------------# 
fi
#-------------------------------------------------------#
 #Check
 if [ "$CONTINUE" != "YES" ]; then
      echo -e "\n[+] Failed To Initialize\n"
      exit 1
 fi
#-------------------------------------------------------#


#-------------------------------------------------------#
##https://github.com/leleliu008/ndk-pkg#using-ndk-pkg-via-docker-or-podman
 #Install
  rm -rf "$HOME/.ndk-pkg" 2>/dev/null ; mkdir -p "$HOME/.ndk-pkg"
  rm -rf "$HOME/.m2" 2>/dev/null ; mkdir -p "$HOME/.m2"
 #Container: https://hub.docker.com/r/fpliu/ndk-pkg
  sudo docker stop "$(sudo docker ps -aqf name=ndk-pkg)" && sleep 5
  sudo docker rm "$(sudo docker ps -aqf name=ndk-pkg)" && sleep 5
  docker create -it --name "ndk-pkg" -v "$HOME/.ndk-pkg:/root/.ndk-pkg" -v "$HOME/.m2:/root/.m2" "fpliu/ndk-pkg:latest"
  docker start "ndk-pkg"
 #Setup & Config
  docker exec -it "ndk-pkg" ndk-pkg upgrade-self
  docker exec -it "ndk-pkg" ndk-pkg setup
  docker exec -it "ndk-pkg" ndk-pkg update
  docker exec -it "ndk-pkg" ndk-pkg sysinfo
  #https://github.com/leleliu008/ndk-pkg-formula-repository-official-core
  docker exec -it "ndk-pkg" ndk-pkg formula-repo-list
  docker exec -it "ndk-pkg" ndk-pkg formula-repo-sync "official-core"
##ENV VARS
  ##https://apilevels.com/
  #android-34 --> Android 14
  #android-33 --> Android 13
  #android-31,32 --> Android 12
  #android-30 --> Android 11
  #android-29 --> Android 10
  #android-28 --> Android 9
  #android-26,27 --> Android 8
  #android-24,25 --> Android 7
  #android-23 --> Android 6
  #android-21,22 --> Android 5
  export TOOLPACKS_ANDROID_APILEVEL_DYNAMIC="android-29"
  export TOOLPACKS_ANDROID_APILEVEL_STATIC="android-34"
  export TOOLPACKS_ANDROID_ABI="arm64-v8a"
  export TOOLPACKS_ANDROID_BUILD_DYNAMIC="${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC}-${TOOLPACKS_ANDROID_ABI}"
  export TOOLPACKS_ANDROID_BUILD_STATIC="${TOOLPACKS_ANDROID_APILEVEL_STATIC}-${TOOLPACKS_ANDROID_ABI}"
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
 TMPDIRS="mktemp -d --tmpdir=$SYSTMP/toolpacks XXXXXXX_android_arm64-v8a" && export TMPDIRS="$TMPDIRS"
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
      source "$BUILDSCRIPT"
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
 #Rename anything with *_arm64-v8a*
 find "$BINDIR" -type f -name '*_Android' -exec sh -c 'newname=$(echo "$1" | sed "s/_arm64_v8a_Android//"); mv "$1" "$newname"' sh {} \;
#-------------------------------------------------------#
#Strip || Cleanup [$BASEUTILSDIR]
 #Chmod +xwr
 find "$BASEUTILSDIR" -maxdepth 1 -type f -exec chmod +xwr {} \; 2>/dev/null
 #Strip
 find "$BASEUTILSDIR" -maxdepth 1 -type f -exec strip {} \; 2>/dev/null
 #Rename anything with *_arm64-v8a*
 find "$BASEUTILSDIR" -type f -name '*_Android' -exec sh -c 'newname=$(echo "$1" | sed "s/_arm64_v8a_Android//"); mv "$1" "$newname"' sh {} \;
#-------------------------------------------------------#
#rClone Upload to R2 (bin.ajam.dev/arm64_v8a_Android) (arm64_v8a_Android) [Binaries]
 if command -v rclone &> /dev/null && [ -s "$HOME/.rclone.conf" ] && [ -d "$BINDIR" ] && [ "$(find "$BINDIR" -mindepth 1 -print -quit 2>/dev/null)" ]; then
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
             #Rename anything with *_arm64-v8a*
             find "$BINDIR" -type f -name '*_Android' -exec sh -c 'newname=$(echo "$1" | sed "s/_arm64_v8a_Android//"); mv "$1" "$newname"' sh {} \;
            #File
              cd "$BINDIR" && "/bin/bash" -c 'PS4="$ ";file ./* | grep -v '.txt' ' &> "$SYSTMP/arm64_v8a_Android_FILE"
              rclone copyto "$SYSTMP/arm64_v8a_Android_FILE" "r2:/bin/arm64_v8a_Android/FILE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #Size (Dust)
              dust -b -c -i -r -n 99999999 "$BINDIR" | tee "$SYSTMP/arm64_v8a_Android_SIZE.txt"
              rclone copyto "$SYSTMP/arm64_v8a_Android_SIZE.md" "r2:/bin/arm64_v8a_Android/SIZE.md" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
              rclone copyto "$SYSTMP/arm64_v8a_Android_SIZE.txt" "r2:/bin/arm64_v8a_Android/SIZE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #BLAKE3SUM
              cd "$BINDIR" && "/bin/bash" -c 'PS4="$ ";b3sum ./* | grep -v '.txt' ' &> "$SYSTMP/arm64_v8a_Android_BLAKE3SUM"
              rclone copyto "$SYSTMP/arm64_v8a_Android_BLAKE3SUM" "r2:/bin/arm64_v8a_Android/BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #SHA256SUM
              cd "$BINDIR" && "/bin/bash" -c 'PS4="$ ";sha256sum ./* | grep -v '.txt' ' &> "$SYSTMP/arm64_v8a_Android_SHA256SUM"
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
             #Rename anything with *_arm64-v8a*
             find "$BASEUTILSDIR" -type f -name '*_Android' -exec sh -c 'newname=$(echo "$1" | sed "s/_arm64_v8a_Android//"); mv "$1" "$newname"' sh {} \;
            #File
              cd "$BASEUTILSDIR" && "/bin/bash" -c 'PS4="$ ";file ./* | grep -v '.txt' ' &> "$SYSTMP/arm64_v8a_Android_Baseutils_FILE"
              rclone copyto "$SYSTMP/arm64_v8a_Android_Baseutils_FILE" "r2:/bin/arm64_v8a_Android/Baseutils/FILE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #Size (Dust)
              dust -b -c -i -r -n 99999999 "$BASEUTILSDIR" | tee "$SYSTMP/arm64_v8a_Android_Baseutils_SIZE.txt"
              rclone copyto "$SYSTMP/arm64_v8a_Android_Baseutils_SIZE.md" "r2:/bin/arm64_v8a_Android/Baseutils/SIZE.md" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
              rclone copyto "$SYSTMP/arm64_v8a_Android_Baseutils_SIZE.txt" "r2:/bin/arm64_v8a_Android/Baseutils/SIZE.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #BLAKE3SUM
              cd "$BASEUTILSDIR" && "/bin/bash" -c 'PS4="$ ";b3sum ./* | grep -v '.txt' ' &> "$SYSTMP/arm64_v8a_Android_Baseutils_BLAKE3SUM"
              rclone copyto "$SYSTMP/arm64_v8a_Android_Baseutils_BLAKE3SUM" "r2:/bin/arm64_v8a_Android/Baseutils/BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
            #SHA256SUM
              cd "$BASEUTILSDIR" && "/bin/bash" -c 'PS4="$ ";sha256sum ./* | grep -v '.txt' ' &> "$SYSTMP/arm64_v8a_Android_Baseutils_SHA256SUM"
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
 if command -v rclone &> /dev/null && [ -s "$HOME/.rclone.conf" ] && [ -s "$BINDIR.7z" ]; then
 #rClone Upload Toolpacks to R2 (bin.ajam.dev/arm64_v8a_Android/_toolpack_arm64-v8a.7z) [Archive]
     #Upload
      echo -e "\n[+] Uploading Results to R2 (rclone)\n"
      rclone copyto "$BINDIR.7z" "r2:/bin/arm64_v8a_Android/_toolpack_arm64-v8a.7z" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #BLAKE3SUM
      cd "$SYSTMP/" && /bin/bash -c 'PS4="$ ";b3sum ./toolpack_aarch64.7z | grep -v '.txt' ' &> "$SYSTMP/_toolpack_arm64-v8a_BLAKE3SUM"
      rclone copyto "$SYSTMP/_toolpack_arm64-v8a_BLAKE3SUM" "r2:/bin/arm64_v8a_Android/_toolpack_arm64-v8a_BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #SHA256SUM
      cd "$SYSTMP/" && /bin/bash -c 'PS4="$ ";sha256sum ./toolpack_aarch64.7z | grep -v '.txt' ' &> "$SYSTMP/_toolpack_arm64-v8a_SHA256SUM"
      rclone copyto "$SYSTMP/_toolpack_arm64-v8a_SHA256SUM" "r2:/bin/arm64_v8a_Android/_toolpack_arm64-v8a_SHA256SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
 #rClone Upload Toolpacks to R2 (bin.ajam.dev/arm64_v8a_Android/_baseutils_aarch64_arm64.7z) [Archive]
     #Upload
      echo -e "\n[+] Uploading Results to R2 (rclone)\n"
      rclone copyto "$BASEUTILSDIR.7z" "r2:/bin/arm64_v8a_Android/Baseutils/_baseutils_aarch64_arm64.7z" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #BLAKE3SUM
      cd "$SYSTMP/" && /bin/bash -c 'PS4="$ ";b3sum ./baseutils_aarch64.7z | grep -v '.txt' ' &> "$SYSTMP/_baseutils_aarch64_arm64_BLAKE3SUM"
      rclone copyto "$SYSTMP/_baseutils_aarch64_arm64_BLAKE3SUM" "r2:/bin/arm64_v8a_Android/Baseutils/_baseutils_aarch64_arm64_BLAKE3SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress
     #SHA256SUM
      cd "$SYSTMP/" && /bin/bash -c 'PS4="$ ";sha256sum ./baseutils_aarch64.7z | grep -v '.txt' ' &> "$SYSTMP/_baseutils_aarch64_arm64_SHA256SUM"
      rclone copyto "$SYSTMP/_baseutils_aarch64_arm64_SHA256SUM" "r2:/bin/arm64_v8a_Android/Baseutils/_baseutils_aarch64_arm64_SHA256SUM.txt" --user-agent="$USER_AGENT" --s3-upload-concurrency="500" --s3-chunk-size="100M" --multi-thread-streams="500" --checkers="2000" --transfers="1000" --retries="10" --check-first --checksum --copy-links --fast-list --progress      
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
#In case of zig polluted env 
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#EOF
#-------------------------------------------------------#