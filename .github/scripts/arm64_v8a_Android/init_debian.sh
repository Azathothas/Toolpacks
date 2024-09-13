#!/usr/bin/env bash

###-----------------------------------------------------###
### Setups Essential Tools & Preps Sys Environ for Deps ###
### This Script must be run as `root` (passwordless)    ###
### Assumptions: Arch: AMD_64 | OS: Debian 64bit        ###
###-----------------------------------------------------###

#-------------------------------------------------------#
## Init Script for toolpacks builder
# This should be run on Debian (Debian Based) Distros with apt, coreutils, curl, dos2unix & passwordless sudo
# sudo apt-get update -y && sudo apt-get install coreutils curl dos2unix moreutils -y
# OR (without sudo): apt-get update -y && apt-get install coreutils curl dos2unix moreutils sudo -y
#
# Hardware : At least 2vCPU + 8GB RAM + 50GB SSD
# Once requirement is satisfied, simply:
# export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.cargo/env:$HOME/.go/bin:$HOME/go/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$HOME/.local/bin:$HOME/miniconda3/bin:$HOME/miniconda3/condabin:/usr/local/zig:/usr/local/zig/lib:/usr/local/zig/lib/include:/usr/local/musl/bin:/usr/local/musl/lib:/usr/local/musl/include:$PATH"
# SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
# bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/arm64_v8a_Android/init_debian.sh")
#-------------------------------------------------------#

#-------------------------------------------------------#
##ENV
 SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
 USER="$(whoami)" && export USER="$USER"
 HOME="$(getent passwd $USER | cut -d: -f6)" && export HOME="$HOME"
#-------------------------------------------------------# 
##Sanity Checks
##Check if it was recently initialized
 # +360  --> 06 Hrs
 # +720  --> 12 HRs
 # +1440 --> 24 HRs
 find "$SYSTMP/INITIALIZED" -type f -mmin +720 -exec rm {} \; 2>/dev/null
 if [ -s "$SYSTMP/INITIALIZED" ]; then
    echo -e "\n[+] Recently Initialized... (Skipping!)\n"
    export CONTINUE="YES"
 else
    ##Sane Configs
    #In case of removed/privated GH repos
     # https://git-scm.com/docs/git#Documentation/git.txt-codeGITTERMINALPROMPTcode
     export GIT_TERMINAL_PROMPT="0"
     #https://git-scm.com/docs/git#Documentation/git.txt-codeGITASKPASScode
     export GIT_ASKPASS="/bin/echo"
    #-------------------------------------------------------# 
    ##Check for apt
     if ! command -v apt &> /dev/null; then
        echo -e "\n[-] apt NOT Found"
        echo -e "\n[+] Maybe not on Debian (Debian Based Distro) ?\n"
        #Fail & exit
        export CONTINUE="NO" && exit 1
     else
       #Export as noninteractive
       export DEBIAN_FRONTEND="noninteractive"
       export CONTINUE="YES"
     fi
    ##Check for sudo
    if [ "$CONTINUE" == "YES" ]; then
       if ! command -v sudo &> /dev/null; then
          echo -e "\n[-] sudo NOT Installed"
          echo -e "\n[+] Trying to Install\n"
          #Try to install
           apt-get update -y 2>/dev/null ; apt-get dist-upgrade -y 2>/dev/null ; apt-get upgrade -y 2>/dev/null
           apt install sudo -y 2>/dev/null
          #Fail if it didn't work
             if ! command -v sudo &> /dev/null; then
               echo -e "[-] Failed to Install sudo (Maybe NOT root || NOT enough perms)\n"
               #exit
               export CONTINUE="NO" && exit 1
             fi
       fi
    fi 
    ##Check for passwordless sudo
    if [ "$CONTINUE" == "YES" ]; then
       if sudo -n true 2>/dev/null; then
           echo -e "\n[+] Passwordless sudo is Configured"
           sudo grep -E '^\s*[^#]*\s+ALL\s*=\s*\(\s*ALL\s*\)\s+NOPASSWD:' "/etc/sudoers" 2>/dev/null
       else
           echo -e "\n[-] Passwordless sudo is NOT Configured"
           echo -e "\n[-] READ: https://web.archive.org/web/20230614212916/https://linuxhint.com/setup-sudo-no-password-linux/\n"
           #exit
           export CONTINUE="NO" && exit 1
       fi
    fi
    #-------------------------------------------------------#
    
    #-------------------------------------------------------#
     echo -e "\n\n [+] Started Initializing $(uname -mnrs) :: at $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
     echo -e "[+] USER = $USER"
     echo -e "[+] HOME = $HOME"
     echo -e "[+] PATH = $PATH\n"     
    #-------------------------------------------------------#
    ## If On Github Actions, remove bloat to get space (~ 30 GB) [DANGEROUS]
    if [ "$CONTINUE" == "YES" ]; then
       if [ "$USER" = "runner" ] || [ "$(whoami)" = "runner" ] && [ -s "/opt/runner/provisioner" ]; then
          ##Debloat
           bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Github/Runners/Ubuntu/debloat.sh")
           bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Github/Runners/Ubuntu/debloat.sh") 2>/dev/null
           #echo -e "\n[+] Debloating GH Runner...\n"
           #  #This is not needed even though this is the ndk, we (re)install via ndk-pkg
           #  #12.0 GB
           #  sudo rm "/usr/local/lib/android" -rf 2>/dev/null &
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
           #wait ; reset ; echo
          #-------------------------------------------------------#
       fi
    fi
    #-------------------------------------------------------#
    
    #-------------------------------------------------------#
    ## Main
    #TMPDIRS
    #For build-cache
     TMPDIRS="mktemp -d --tmpdir=$SYSTMP/init_Debian XXXXXXX_debian_x86_64" && export TMPDIRS="$TMPDIRS"
     rm -rf "$SYSTMP/init_Debian" 2>/dev/null ; mkdir -p "$SYSTMP/init_Debian"
     pushd "$($TMPDIRS)" >/dev/null 2>&1
        if [ "$CONTINUE" == "YES" ]; then
            #Install CoreUtils & Deps
             sudo apt-get update -y 2>/dev/null
             sudo apt-get install apt-transport-https apt-utils ca-certificates coreutils gnupg2 moreutils software-properties-common util-linux -y 2>/dev/null ; sudo apt-get update -y 2>/dev/null
            #Install Build Des
             sudo apt-get install aria2 automake bc binutils b3sum build-essential ca-certificates ccache diffutils dos2unix gawk imagemagick lzip jq libtool libtool-bin make musl musl-dev musl-tools p7zip-full rsync texinfo wget -y 2>/dev/null
             sudo apt-get install -y --no-install-recommends autoconf automake autopoint binutils bison build-essential byacc ca-certificates clang flex file jq libtool libtool-bin patch patchelf pkg-config qemu-user-static scons tree wget 2>/dev/null
             sudo apt-get install devscripts -y --no-install-recommends 2>/dev/null
             sudo apt-get install cmake -y
            #Re
             sudo apt-get install aria2 automake bc binutils b3sum build-essential ca-certificates ccache diffutils dos2unix gawk imagemagick lzip jq libtool libtool-bin make musl musl-dev musl-tools p7zip-full rsync texinfo wget -y 2>/dev/null
             sudo apt-get install -y --no-install-recommends autoconf automake autopoint binutils bison build-essential byacc ca-certificates clang flex file jq libtool libtool-bin patch patchelf pkg-config qemu-user-static scons tree wget 2>/dev/null
             sudo apt-get install devscripts -y --no-install-recommends 2>/dev/null
             sudo apt-get install cmake -y
            #Install Build Dependencies (arm64)
             sudo apt install binutils-aarch64-linux-gnu -y 2>/dev/null
             sudo apt-get install "g++-arm-linux-gnueabi" "g++-arm-linux-gnueabihf" "g++-aarch64-linux-gnu" -y 2>/dev/null
             sudo apt-get install qemu qemu-system qemu-user qemu-user-static qemu-utils -y 2>/dev/null
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
            bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/install_bb_tools.sh")
            #Appimage tools
            sudo curl -qfsSL "https://bin.ajam.dev/$(uname -m)/appimagetool" -o "/usr/local/bin/appimagetool" && sudo chmod +x "/usr/local/bin/appimagetool"
            sudo curl -qfsSL "https://bin.ajam.dev/$(uname -m)/mkappimage" -o "/usr/local/bin/mkappimage" && sudo chmod +x "/usr/local/bin/mkappimage"
            sudo curl -qfsSL "https://bin.ajam.dev/$(uname -m)/Baseutils/squashfstools/mksquashfs" -o "/usr/local/bin/mksquashfs" && sudo chmod +x "/usr/local/bin/mksquashfs"
            sudo curl -qfsSL "https://bin.ajam.dev/$(uname -m)/Baseutils/squashfstools/sqfscat" -o "/usr/local/bin/sqfscat" && sudo chmod +x "/usr/local/bin/sqfscat"
            sudo curl -qfsSL "https://bin.ajam.dev/$(uname -m)/Baseutils/squashfstools/sqfstar" -o "/usr/local/bin/sqfstar" && sudo chmod +x "/usr/local/bin/sqfstar"
            sudo curl -qfsSL "https://bin.ajam.dev/$(uname -m)/Baseutils/squashfstools/unsquashfs" -o "/usr/local/bin/unsquashfs" && sudo chmod +x "/usr/local/bin/unsquashfs"
        fi
    #-------------------------------------------------------#
    
    #-------------------------------------------------------#
    ##Langs
    if [ "$CONTINUE" == "YES" ]; then
         #----------------------#
         #Docker
         install_docker ()
         {
            #Install 
             curl -qfsSL "https://get.docker.com" | sed 's/sleep 20//g' | sudo bash
             sudo groupadd docker 2>/dev/null ; sudo usermod -aG docker "$USER" 2>/dev/null
             sudo service docker restart 2>/dev/null && sleep 10
             sudo service docker status 2>/dev/null
            #Test
             if ! command -v docker &> /dev/null; then
                echo -e "\n[-] docker NOT Found\n"
                export CONTINUE="NO" && exit 1
             else
                docker --version ; sudo docker run hello-world
                sudo ldconfig && sudo ldconfig -p
                #newgrp 2>/dev/null
             fi
         }
         export -f install_docker
         if command -v docker &> /dev/null; then
          if [ "$(curl -s https://endoflife.date/api/docker-engine.json | jq -r '.[0].latest')" != "$(docker --version | grep -oP '(?<=version )(\d+\.\d+\.\d+)')" ]; then
             install_docker
          else
             echo -e "\n[+] Latest Docker seems to be already Installed"
             docker --version
          fi
         else    
             install_docker
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
         ##Install golang 
          pushd "$($TMPDIRS)" >/dev/null 2>&1
          echo "yes" | bash <(curl -qfsSL "https://git.io/go-installer")
          popd >/dev/null 2>&1
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
          #curl -qfsSL "https://install.determinate.systems/nix" | bash -s -- install linux --init none --extra-conf "filter-syscalls = false" --no-confirm
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
             rustup default stable
             rustc --version && cargo --version
             #Cross-rs
             cargo install cross --git "https://github.com/cross-rs/cross"
             sudo ldconfig && sudo ldconfig -p
          fi
         #----------------------# 
         #v-lang: https://github.com/vlang/v/blob/master/README.md#installing-v-from-source
          sudo rm -rf "/opt/vlang" ; sudo mkdir -p "/opt/vlang"
          sudo chown -R "$(whoami):$(whoami)" "/opt/vlang" && chmod -R 755 "/opt/vlang"
          pushd "/opt/vlang" >/dev/null 2>&1
          git clone --filter="blob:none" --quiet "https://github.com/vlang/v" && cd "./v"
          make --jobs="$(($(nproc)+1))"
          file "./v" && du -sh "./v"
          sudo "./v" symlink
          docker build -t "vlang_alpine" --no-cache - < "./Dockerfile.alpine"
          popd >/dev/null 2>&1
          #Test: PATH="$HOME/.cargo/bin:$HOME/.cargo/env:$PATH" 
          if ! command -v v &> /dev/null; then
             echo -e "\n[-] v (v-lang) NOT Found\n"
             export CONTINUE="NO" && exit 1
          else
             v version
          fi          
         #----------------------# 
         ##Install zig
          #Clean
          sudo rm "/usr/local/zig" -rf 2>/dev/null ; sudo rm "/usr/local/zig" -rf 2>/dev/null
          #Get latest source
          pushd "$($TMPDIRS)" >/dev/null 2>&1 && curl -qfSLJO $(curl -qfsSL "https://ziglang.org/download/index.json" | jq -r '.master | ."x86_64-linux".tarball')
          #Extract
          find . -type f -name '*.tar*' -exec tar -xf {} \;
          #Move to /usr/local/zig
          sudo mkdir -p "/usr/local/zig" && sudo mv "$(find . -maxdepth 1 -type d | grep -v '^.$')"/* "/usr/local/zig" ; popd >/dev/null 2>&1
          #Test: ZIG_PATH="/usr/local/zig:/usr/local/zig/lib:/usr/local/zig/lib/include:$PATH"
          if ! command -v zig &> /dev/null; then
             echo -e "\n[-] zig NOT Found\n"
             export CONTINUE="NO" && exit 1
          else
             zig version
             sudo ldconfig && sudo ldconfig -p
          fi
          #cleanup
          find "$SYSTMP" -type d -name "*zig*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
          find "$SYSTMP" -type f -name "*zig*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
         #----------------------# 
    fi
    #-------------------------------------------------------#
    
    #-------------------------------------------------------#
    ##Libs
     ##Mold for linking
      if [ "$CONTINUE" == "YES" ]; then
            #Get Source
            pushd "$($TMPDIRS)" >/dev/null 2>&1 && eget "rui314/mold" --asset "x86_64-linux.tar.gz" --download-only --to "./mold.tar.gz"
            #Extract Archive
            find . -type f -name "*.tar.gz*" -exec tar -xvf {} --strip-components=1 \;
            #Main Binary
            sudo rm -rf "/usr/local/bin/ld.mold" 2>/dev/null ; sudo rm -rf "/usr/local/libexec/mold" 2>/dev/null
            sudo cp "./bin/mold" "/usr/local/bin/mold" ; sudo chmod +xwr "/usr/local/bin/mold"
            #symlinks
            # /usr/local/bin/ld.mold -> mold
            sudo ln --symbolic --force "/usr/local/bin/mold" "/usr/local/bin/ld.mold"
            # /usr/local/libexec/mold/ld --> /usr/local/bin/mold
            sudo mkdir -p "/usr/local/libexec/mold" && sudo ln --symbolic --force "/usr/local/bin/mold" "/usr/local/libexec/mold/ld" ; sudo chmod +xwr "/usr/local/libexec/mold"/*
            #lib : /usr/local/lib/mold/mold-wrapper.so
            sudo cp -r "./lib/." "/usr/local/lib/" ; sudo chmod +xwr "/usr/local/lib/mold"/* ; popd >/dev/null 2>&1
            #Test
            if ! command -v mold &> /dev/null; then
               echo -e "\n[-] mold NOT Found\n"
               export CONTINUE="NO" && exit 1
            else   
               mold --version
               sudo ldconfig && sudo ldconfig -p
            fi
      fi
    #-------------------------------------------------------#
    
    #-------------------------------------------------------#
    ##ndk
      if [ "$CONTINUE" == "YES" ]; then
      #-------------------------------------------------------#
      ##ppkg : https://github.com/leleliu008/ppkg
       #Install : https://github.com/leleliu008/ppkg#install-posix-shell-based-ppkg-via-curl
        rm -rf "$HOME/.ppkg" "$HOME/.uppm" 2>/dev/null
        sudo curl -qfsSL "https://raw.githubusercontent.com/leleliu008/ppkg/master/ppkg" -o "/usr/local/bin/ppkg" && sudo chmod +x "/usr/local/bin/ppkg"
       #Setup & Config
        ppkg setup && ppkg sysinfo ; du -sh "$HOME/.ppkg"
        ppkg update && ppkg formula-repo-list && ppkg formula-repo-sync "official-core" ; du -sh "$HOME/.ppkg"
      ##uppm : https://github.com/leleliu008/uppm
        #ppkg install uppm ; ppkg cleanup ; du -sh "$HOME/.ppkg"
        ppkg cleanup ; du -sh "$HOME/.ppkg"
      ##ndk-pkg [docker]
       #Install : https://github.com/leleliu008/ndk-pkg#using-ndk-pkg-via-docker-or-podman
        rm -rf "$HOME/.ndk-pkg" 2>/dev/null ; mkdir -p "$HOME/.ndk-pkg"
        rm -rf "$HOME/.m2" 2>/dev/null ; mkdir -p "$HOME/.m2"
       #Container: https://hub.docker.com/r/fpliu/ndk-pkg
        sudo docker stop "$(sudo docker ps -aqf name=ndk-pkg)" 2>/dev/null && sleep 5
        sudo docker rm "$(sudo docker ps -aqf name=ndk-pkg)" 2>/dev/null && sleep 5
        #docker create -it --name "ndk-pkg" -v "$HOME/.ndk-pkg:/root/.ndk-pkg" -v "$HOME/.m2:/root/.m2" "fpliu/ndk-pkg:latest"
        docker create -it --name "ndk-pkg" "fpliu/ndk-pkg:latest"
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
         export TOOLPACKS_ANDROID_APILEVEL_DYNAMIC="android-21"
         TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X="$(echo ${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC} | sed 's/-//g' | tr -d '[:space:]')" && export TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X="${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X}"
         export TOOLPACKS_ANDROID_APILEVEL_STATIC="android-34"
         TOOLPACKS_ANDROID_APILEVEL_STATIC_X="$(echo ${TOOLPACKS_ANDROID_APILEVEL_STATIC} | sed 's/-//g' | tr -d '[:space:]')" && export TOOLPACKS_ANDROID_APILEVEL_STATIC_X="${TOOLPACKS_ANDROID_APILEVEL_STATIC_X}"
         export TOOLPACKS_ANDROID_ABI="arm64-v8a"
         export TOOLPACKS_ANDROID_BUILD_DYNAMIC="${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC}-${TOOLPACKS_ANDROID_ABI}"
         export TOOLPACKS_ANDROID_BUILD_STATIC="${TOOLPACKS_ANDROID_APILEVEL_STATIC}-${TOOLPACKS_ANDROID_ABI}"
        echo -e "\n[+] APILEVEL (Dynamic) = ${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC}"
        echo -e "[+] APILEVEL (Static) = ${TOOLPACKS_ANDROID_APILEVEL_STATIC}"
        echo -e "[+] Target ABI (arch) = ${TOOLPACKS_ANDROID_ABI}"
        echo -e "[+] Android Target (Dynamic) = ${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X}"
        echo -e "[+] Target Triplet (Dynamic) = ${TOOLPACKS_ANDROID_BUILD_DYNAMIC}"
        echo -e "[+] Android Target (Static) = ${TOOLPACKS_ANDROID_APILEVEL_STATIC_X}"
        echo -e "[+] Target Triplet (Static) = ${TOOLPACKS_ANDROID_BUILD_STATIC}\n"
      ##NDK
       #Host
        sudo curl -qfsSL "https://raw.githubusercontent.com/leleliu008/ndk-pkg/master/ndk-pkg" -o "/usr/local/bin/ndk-pkg" && sudo chmod +x "/usr/local/bin/ndk-pkg"
        #Setup & Config
         ndk-pkg setup ; ndk-pkg upgrade-self ; ndk-pkg update ; ndk-pkg sysinfo
        #Install a pseudo pkg to initialize ndk
         rm -rf "$SYSTMP/ndk.log" 2>/dev/null
         sudo curl -qfsSL "https://bin.ajam.dev/$(uname -m)/ansi2txt" -o "/usr/bin/ansi2txt" && sudo chmod +x "/usr/local/bin/ansi2txt"
         ndk-pkg install "${TOOLPACKS_ANDROID_BUILD_DYNAMIC}/dos2unix" --profile="release" -j "$(($(nproc)+1))" -v | tee -a "$SYSTMP/ndk.log"
         ndk-pkg uninstall "${TOOLPACKS_ANDROID_BUILD_DYNAMIC}/dos2unix" ; ndk-pkg cleanup
      ##ENV VARS
        #NDK
         TOOLPACKS_NDK_HOME="$(grep ^ANDROID_NDK_HOME= "$SYSTMP/ndk.log" | awk -F '=' '{print $2}' | tr -d "'" | tr -d '[:space:]')" && export TOOLPACKS_NDK_HOME="${TOOLPACKS_NDK_HOME}"
         TOOLPACKS_NDK_ROOT="$(grep ^ANDROID_NDK_ROOT= "$SYSTMP/ndk.log" | awk -F '=' '{print $2}' | tr -d "'" | tr -d '[:space:]')" && export TOOLPACKS_NDK_ROOT="${TOOLPACKS_NDK_ROOT}"
         TOOLPACKS_NDK_TOOLCHAIN_ROOT="$(grep ^ANDROID_NDK_TOOLCHAIN_ROOT= "$SYSTMP/ndk.log" | awk -F '=' '{print $2}' | tr -d "'" | tr -d '[:space:]')" && export TOOLPACKS_NDK_TOOLCHAIN_ROOT="${TOOLPACKS_NDK_TOOLCHAIN_ROOT}"
        #Check
         if [[ "${TOOLPACKS_NDK_HOME}" == *"android-ndk"* ]] && [[ "${TOOLPACKS_NDK_ROOT}" == *"android-ndk"* ]] && [[ "${TOOLPACKS_NDK_TOOLCHAIN_ROOT}" == *"android-ndk"* ]]; then
           echo -e "\n[+] Setting up NDK ENV Variables\n"
            ##Set ENVs
             export ANDROID_HOME="${TOOLPACKS_NDK_HOME}"
             export ANDROID_NDK_HOME="${TOOLPACKS_NDK_HOME}"
             export ANDROID_NDK_ROOT="${TOOLPACKS_NDK_ROOT}"
             export ANDROID_NDK_TOOLCHAIN_ROOT="${TOOLPACKS_NDK_TOOLCHAIN_ROOT}"
             export ANDROID_NDK_TOOLCHAIN_BIN="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin"
             export ANDROID_NDK_SYSROOT="${ANDROID_NDK_TOOLCHAIN_ROOT}/sysroot"
             export ANDROID_NDK_CC="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang"
             export ANDROID_NDK_CXX="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang++"
             export ANDROID_NDK_CPP="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang -E"
             export ANDROID_NDK_LD="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/ld.lld"
             export ANDROID_NDK_AS="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-as"
             export ANDROID_NDK_AR="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-ar"
             export ANDROID_NDK_NM="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-nm"
             export ANDROID_NDK_SIZE="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-size"
             export ANDROID_NDK_STRIP="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-strip"
             export ANDROID_NDK_RANLIB="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-ranlib"
             export ANDROID_NDK_STRINGS="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-strings"
             export ANDROID_NDK_OBJDUMP="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-objdump"
             export ANDROID_NDK_OBJCOPY="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-objcopy"
             export ANDROID_NDK_READELF="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-readelf"
            ##Build ENVs
             #export CC="$HOME/.ndk-pkg/core/wrapper-target-cc"
             #export CXX="$HOME/.ndk-pkg/core/wrapper-target-c++"
             #export CPP="$HOME/.ndk-pkg/core/wrapper-target-cc -E"
             #export LD="${ANDROID_NDK_TOOLCHAIN_BIN}/ld.lld"
             #export AS="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-as"
             #export AR="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-ar"
             #export NM="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-nm"
             #export SIZE="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-size"
             #export STRIP="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-strip"
             #export RANLIB="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-ranlib"
             #export STRINGS="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-strings"
             #export OBJDUMP="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-objdump"
             #export OBJCOPY="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-objcopy"
             #export READELF="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-readelf"
             #export SYSROOT="${ANDROID_NDK_SYSROOT}"
            ##GO/RUST ENVs
             sudo ln --symbolic --force "${ANDROID_NDK_TOOLCHAIN_BIN}/aarch64-linux-${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X}-clang" "/usr/local/bin/aarch64-linux-android-clang" 2>/dev/null
             sudo ln --symbolic --force "${ANDROID_NDK_TOOLCHAIN_BIN}/clang" "/usr/local/bin/clang" 2>/dev/null
             #llvm-ar
             sudo ln --symbolic --force "${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-ar" "/usr/local/bin/aarch64-linux-android-ar" 2>/dev/null
             sudo chmod +xwr "/usr/local/bin/aarch64-linux-android-ar" 2>/dev/null
             #llvm-ranlib
             sudo ln --symbolic --force "${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-ranlib" "/usr/local/bin/aarch64-linux-android-ranlib" 2>/dev/null
             sudo chmod +xwr "/usr/local/bin/aarch64-linux-android-ranlib" 2>/dev/null
            #print
             env | grep -i "android" --color="never" ; echo
         else
             echo -e "\n[-] FATAL: Failed to set NDK ENVs\n"
             cat "$SYSTMP/ndk.log"
           exit 1
         fi
    fi
     #-------------------------------------------------------#
     ##Clean
     echo "INITIALIZED" > "$SYSTMP/INITIALIZED"
     rm -rf "$SYSTMP/init_Debian" 2>/dev/null
     #-------------------------------------------------------#
     ##END
     echo -e "\n\n [+] Finished Initializing $(uname -mnrs) :: at $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
     #In case of zig polluted env 
     unset ANDROID_TARGET AR AS CC CFLAGS CPP CXX CPPFLAGS CXXFLAGS DLLTOOL HOST_CC HOST_CXX LD LDFLAGS LIBS NM OBJCOPY OBJDUMP RANLIB READELF SIZE STRINGS STRIP SYSROOT
     #-------------------------------------------------------#
  #EOF
fi
popd >/dev/null 2>&1
echo -e "\n[+] Continue : $CONTINUE\n"
#-------------------------------------------------------#
