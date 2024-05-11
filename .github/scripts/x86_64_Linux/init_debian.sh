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
# bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/x86_64_Linux/init_debian.sh")
#-------------------------------------------------------#

#-------------------------------------------------------#
##ENV
 SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
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
    #-------------------------------------------------------#
    ## If On Github Actions, remove bloat to get space (~ 30 GB) [DANGEROUS]
    if [ "$CONTINUE" == "YES" ]; then
       if [ "$USER" = "runner" ] || [ "$(whoami)" = "runner" ] && [ -s "/opt/runner/provisioner" ]; then
          echo -e "\n[+] Debloating GH Runner...\n"
            #12.0 GB
            sudo rm "/usr/local/lib/android" -rf 2>/dev/null
            #8.2 GB
            sudo rm "/opt/hostedtoolcache/CodeQL" -rf 2>/dev/null
            #5.0 GB
            sudo rm "/usr/local/.ghcup" -rf 2>/dev/null
            #2.0 GB
            sudo rm "/usr/share/dotnet" -rf 2>/dev/null
            #1.7 GB
            sudo rm "/usr/share/swift" -rf 2>/dev/null
            #1.1 GB
            #sudo rm "/usr/local/lib/node_modules" -rf 2>/dev/null
            #1.0 GB
            sudo rm "/usr/local/share/powershell" -rf 2>/dev/null
            #500 MB
            sudo rm "/usr/local/lib/heroku" -rf 2>/dev/null
       fi
    fi
    #-------------------------------------------------------#
    
    #-------------------------------------------------------#
    ## Main
    #TMPDIRS
     #For build-cache
     TMPDIRS="mktemp -d --tmpdir=$SYSTMP/init_Debian XXXXXXX_debian_x86_64" && export TMPDIRS="$TMPDIRS"
     rm -rf "$SYSTMP/init_Debian" 2>/dev/null ; mkdir -p "$SYSTMP/init_Debian"
    if [ "$CONTINUE" == "YES" ]; then
         #Install CoreUtils & Deps
          sudo apt-get update -y 2>/dev/null
          sudo apt-get install apt-transport-https apt-utils ca-certificates coreutils gnupg2 moreutils software-properties-common util-linux -y 2>/dev/null ; sudo apt-get update -y 2>/dev/null
          #Install Python (Deadsnakes)
          sudo add-apt-repository "ppa:deadsnakes/ppa" --yes ; sudo apt-get update -y
          PYTHON_VERSION_LATEST="$(curl -qfsSL "https://devguide.python.org/versions/" |  grep -oP 'Python \d+\.\d+' | sed 's/Python //' | sort -V | uniq | tail -n 1)" && export PYTHON_VERSION_LATEST="$PYTHON_VERSION_LATEST"
          sudo apt-get install "python${PYTHON_VERSION_LATEST}" -y
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
         #libpcap
          sudo apt install 'libpcap*' -y 2>/dev/null         
         #libsqlite3
          sudo apt-get install libsqlite3-dev sqlite3 sqlite3-pcre sqlite3-tools -y 2>/dev/null
         #lzma
          sudo apt-get install liblz-dev librust-lzma-sys-dev lzma lzma-dev -y
         #musl
          #Source
          pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://git.musl-libc.org/git/musl" && cd "./musl"
          #Flags
          unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
          #Configure
          make dest clean 2>/dev/null ; make clean 2>/dev/null
          bash "./configure" --prefix="/usr/local/musl"
          sudo make --jobs="$(($(nproc)+1))" --keep-going install ; popd > /dev/null 2>&1
          sudo ldconfig && sudo ldconfig -p
          find "$SYSTMP" -type d -name "*musl*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1 
         #Networking
          sudo apt-get install dnsutils 'inetutils*' net-tools netcat-traditional -y 2>/dev/null
          sudo apt-get install 'iputils*' -y 2>/dev/null
          sudo setcap cap_net_raw+ep "$(which ping)" 2>/dev/null
         #Install PythonUtils & Deps (StaticX)
          sudo add-apt-repository "ppa:deadsnakes/ppa" --yes ; sudo apt-get update -y
          PYTHON_VERSION_LATEST="$(curl -qfsSL "https://devguide.python.org/versions/" |  grep -oP 'Python \d+\.\d+' | sed 's/Python //' | sort -V | uniq | tail -n 1)" && export PYTHON_VERSION_LATEST="$PYTHON_VERSION_LATEST"
          sudo apt-get install "python${PYTHON_VERSION_LATEST}" -y
         #  sudo update-alternatives --install "/usr/bin/python3" "python" "/usr/bin/python${PYTHON_VERSION_LATEST}" 1
         #  sudo update-alternatives --install "/usr/bin/python3" "python" "/usr/bin/python$(python --version | awk '{print $2}' | awk -F '.' '{print $1"."$2}')" 2
          sudo apt install python3-pip python3-venv -y 2>/dev/null
         #Upgrade pip
          pip --version
          pip install --break-system-packages --upgrade pip || pip install --upgrade pip
          pip --version
         #Deps 
          sudo apt install lm-sensors pciutils procps python3-distro python3-netifaces sysfsutils virt-what -y 2>/dev/null
          sudo apt-get install libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev scons xcb -y 2>/dev/null
          pip install build cffi scons scuba pytest --upgrade --force 2>/dev/null ; pip install ansi2txt pipx scons staticx pyinstaller py2static typer --upgrade --force 2>/dev/null
          pip install build cffi scons scuba pytest --break-system-packages --upgrade --force 2>/dev/null ; pip install ansi2txt pipx scons staticx pyinstaller py2static typer --break-system-packages --upgrade --force 2>/dev/null
         #Nutika
         #pip install nuitka --break-system-packages --upgrade ; nuitka3 --version
         pip install "git+https://github.com/Nuitka/Nuitka" --break-system-packages --force-reinstall --upgrade ; nuitka3 --version
         #Pex
         pip install "git+https://github.com/pex-tool/pex" --break-system-packages --force-reinstall --upgrade ; pex --version
    fi
    #-------------------------------------------------------#
    
    #-------------------------------------------------------#
    #Install Addons
    if [ "$CONTINUE" == "YES" ]; then
         #7z
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/7z" -o "/usr/bin/7z" && sudo chmod +xwr "/usr/bin/7z"
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/7z" -o "/usr/local/bin/7z" && sudo chmod +xwr "/usr/local/bin/7z"
         #b3sum
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/b3sum" -o "/usr/bin/b3sum" && sudo chmod +xwr "/usr/bin/b3sum"
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/b3sum" -o "/usr/local/bin/b3sum" && sudo chmod +xwr "/usr/local/bin/b3sum"
         #croc
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/croc" -o "/usr/local/bin/croc" && sudo chmod +xwr "/usr/local/bin/croc"
         #delta
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/delta" -o "/usr/local/bin/delta" && sudo chmod +xwr "/usr/local/bin/delta"
         #dust
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/dust" -o "/usr/local/bin/dust" && sudo chmod +xwr "/usr/local/bin/dust"
         #eget
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/eget" -o "/usr/local/bin/eget" && sudo chmod +xwr "/usr/local/bin/eget"
         #rclone
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/rclone" -o "/usr/local/bin/rclone" && sudo chmod +xwr "/usr/local/bin/rclone"
         #upx
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/upx" -o "/usr/bin/upx" && sudo chmod +xwr "/usr/bin/upx"
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/upx" -o "/usr/local/bin/upx" && sudo chmod +xwr "/usr/local/bin/upx"
         #yq
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/yq" -o "/usr/local/bin/yq" && sudo chmod +xwr "/usr/local/bin/yq"
         #yj
         sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/yj" -o "/usr/local/bin/yj" && sudo chmod +xwr "/usr/local/bin/yj"
    fi 
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

   #-------------------------------------------------------#
    ##ToolChains
    if [ "$CONTINUE" == "YES" ]; then
    ##Clean
    sudo rm "/opt/toolchains" -rf 2>/dev/null
    ##https://pub.ajam.dev/toolchains/x86_64-glibc-stable/ --> /opt/toolchains/x86_64-buildroot-linux-gnu
    pushd "$($TMPDIRS)" > /dev/null 2>&1 && eget "https://pub.ajam.dev/toolchains/x86_64-glibc-stable.tar.bz2" --download-only
    find . -type f -name "*.tar*" -exec tar -xf {} \;
    sudo mkdir -p "/opt/toolchains" 2>/dev/null
    sudo mv "$(find . -maxdepth 1 -type d -exec basename {} \; | grep -Ev '^\.$' | xargs -I {} realpath {})" "/opt/toolchains/x86_64-buildroot-linux-gnu"
    cd "/opt/toolchains/x86_64-buildroot-linux-gnu" && sudo bash "./relocate-sdk.sh" ; popd > /dev/null 2>&1
    ##https://pub.ajam.dev/toolchains/x86_64-musl-stable/ --> /opt/toolchains/x86_64-buildroot-linux-musl
    pushd "$($TMPDIRS)" > /dev/null 2>&1 && eget "https://pub.ajam.dev/toolchains/x86_64-musl-stable.tar.bz2" --download-only
    find . -type f -name "*.tar*" -exec tar -xf {} \;
    sudo mkdir -p "/opt/toolchains" 2>/dev/null
    sudo mv "$(find . -maxdepth 1 -type d -exec basename {} \; | grep -Ev '^\.$' | xargs -I {} realpath {})" "/opt/toolchains/x86_64-buildroot-linux-musl"
    cd "/opt/toolchains/x86_64-buildroot-linux-musl" && sudo bash "./relocate-sdk.sh" ; popd > /dev/null 2>&1
    ##https://pub.ajam.dev/toolchains/x86_64-uclibc-stable/ --> /opt/toolchains/x86_64-buildroot-linux-uclibc
    pushd "$($TMPDIRS)" > /dev/null 2>&1 && eget "https://pub.ajam.dev/toolchains/x86_64-uclibc-stable.tar.bz2" --download-only
    find . -type f -name "*.tar*" -exec tar -xf {} \;
    sudo mkdir -p "/opt/toolchains" 2>/dev/null
    sudo mv "$(find . -maxdepth 1 -type d -exec basename {} \; | grep -Ev '^\.$' | xargs -I {} realpath {})" "/opt/toolchains/x86_64-buildroot-linux-uclibc"
    cd "/opt/toolchains/x86_64-buildroot-linux-uclibc" && sudo bash "./relocate-sdk.sh" ; popd > /dev/null 2>&1
    ##Test
    echo -e "\n\n[+] Toolchains\n"
    du -h --max-depth="1" "/opt/toolchains" 2>/dev/null | sort -hr ; echo -e "\n\n"
    fi
   #-------------------------------------------------------#

   #-------------------------------------------------------#
    ##Mold for linking
    if [ "$CONTINUE" == "YES" ]; then
          #Get Source
          pushd "$($TMPDIRS)" > /dev/null 2>&1 && eget "rui314/mold" --asset "x86_64-linux.tar.gz" --download-only --to "./mold.tar.gz"
          #Extract Archive
          find . -type f -name "*.tar.gz*" -exec tar -xvf {} --strip-components=1 \;
          #Main Binary
          sudo rm -rf "/usr/local/bin/ld.mold" 2>/dev/null ; sudo rm -rf "/usr/local/libexec/mold" 2>/dev/null
          sudo cp "./bin/mold" "/usr/local/bin/mold" ; sudo chmod +xwr "/usr/local/bin/mold"
          #symlinks 
          # /usr/local/bin/ld.mold -> mold
          sudo ln -s "/usr/local/bin/mold" "/usr/local/bin/ld.mold"
          # /usr/local/libexec/mold/ld --> /usr/local/bin/mold
          sudo mkdir -p "/usr/local/libexec/mold" && sudo ln -s "/usr/local/bin/mold" "/usr/local/libexec/mold/ld" ; sudo chmod +xwr "/usr/local/libexec/mold"/*
          #lib : /usr/local/lib/mold/mold-wrapper.so
          sudo cp -r "./lib/." "/usr/local/lib/" ; sudo chmod +xwr "/usr/local/lib/mold"/* ; popd > /dev/null 2>&1
          #Test
          if ! command -v mold &> /dev/null; then
             echo -e "\n[-] mold NOT Found\n"
             exit 1
          else   
             mold --version
             sudo ldconfig && sudo ldconfig -p
          fi
    fi
    ##Additional Libs
    if [ "$CONTINUE" == "YES" ]; then
         ##Install Alsa-Libs (libasound)
          sudo apt-get install alsa-base alsa-utils linux-sound-base libasound2-dev libfl-dev libjack-dev librust-cpal-dev libxi-dev libxtst-dev -y
          pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/alsa-project/alsa-lib" && cd "alsa-lib"
          bash "./gitcompile" ; "./configure" --enable-shared=no --enable-static=yes ; sudo make install ; popd > /dev/null 2>&1
          find "$SYSTMP" -type d -name "*alsa*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
         ##Install Meson & Ninja
          #Install
          sudo rm "/usr/bin/meson" "/usr/bin/ninja" 2>/dev/null
          pip install meson ninja --upgrade 2>/dev/null
          pip install meson ninja --break-system-packages --upgrade 2>/dev/null
          #python3 -m pip install meson ninja --upgrade
          sudo ln -s "$HOME/.local/bin/meson" "/usr/bin/meson" 2>/dev/null
          sudo ln -s "$HOME/.local/bin/ninja" "/usr/bin/ninja" 2>/dev/null
          sudo chmod +xwr "/usr/bin/meson" "/usr/bin/ninja"
          #version
          meson --version ; ninja --version
          sudo ldconfig && sudo ldconfig -p
         ##Install ncurses 
          pushd "$($TMPDIRS)" > /dev/null 2>&1 && wget --quiet --show-progress --progress="dot:giga" "https://invisible-island.net/datafiles/current/ncurses.tar.gz"
          find . -type f -name "*.tar.gz*" -exec tar -xvf {} \; 2>/dev/null
          cd "$(find . -maxdepth 1 -type d -name "*ncurses*" | grep -v "^.$")"
          export ZIG_LIBC_TARGET="x86_64-linux-musl"
          unset CC && export CC="zig cc -target $ZIG_LIBC_TARGET"
          unset CXX && export CXX="zig c++ -target $ZIG_LIBC_TARGET"
          unset DLLTOOL && export DLLTOOL="zig dlltool"
          unset HOST_CC && export HOST_CC="zig cc -target $ZIG_LIBC_TARGET"
          unset HOST_CXX && export HOST_CXX="zig c++ -target $ZIG_LIBC_TARGET"
          unset OBJCOPY && export OBJCOPY="zig objcopy"
          unset RANLIB && export RANLIB="zig ranlib"
          unset CFLAGS && export CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe ${CFLAGS}"
          unset CXXFLAGS && export CXXFLAGS="${CFLAGS}"
          unset LDFLAGS && export LDFLAGS="-static -static-pie -pie -s -Wl,-S -Wl,--build-id=none ${LDFLAGS}"
          make dist clean 2>/dev/null ; make clean 2>/dev/null
          "./configure" --with-build-cc="zig cc -target $ZIG_LIBC_TARGET" --with-build-cpp="zig c++ -target $ZIG_LIBC_TARGET" --with-libtool --with-libtool-opts="-static" --enable-bsdpad --enable-getcap --enable-static --disable-shared --with-normal --without-debug
          make CFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" CXXFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" LDFLAGS="$LDFLAGS ${ADDITIONAL_ARGS}" --jobs="$(($(nproc)+1))" --keep-going
          sudo make install ; popd > /dev/null 2>&1 ; tput -V
          unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
          sudo ldconfig && sudo ldconfig -p
          find "$SYSTMP" -type d -name "*ncurses*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
         ##Openssl (via nmap)
          curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Devscripts/install_nmap.sh" | bash
          find "$SYSTMP" -type d -name "*nmap*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
          find "$SYSTMP" -type d -name "*openssl*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
         ##wolfssl
          pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/wolfSSL/wolfssl" && cd "./wolfssl"
          bash "./autogen.sh" 2>/dev/null ; "./configure" --enable-all --disable-shared --enable-static --enable-sslv3
          make --jobs="$(($(nproc)+1))" --keep-going ; sudo make install ; wolfssl-config --version ; popd > /dev/null 2>&1
          sudo ldconfig && sudo ldconfig -p
          find "$SYSTMP" -type d -name "*wolfssl*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
    fi 
    #-------------------------------------------------------#
    
    #-------------------------------------------------------#
    ##Clean
    echo "INITIALIZED" > "$SYSTMP/INITIALIZED"
    rm -rf "$SYSTMP/init_Debian" 2>/dev/null
    #-------------------------------------------------------#
    ##END
    echo -e "\n\n [+] Finished Initializing $(uname -mnrs) :: at $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
    #In case of zig polluted env 
    unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
    #-------------------------------------------------------#
  #EOF
fi
echo -e "\n[+] Continue : $CONTINUE\n"
#-------------------------------------------------------#