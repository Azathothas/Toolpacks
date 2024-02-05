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
          sudo apt-get install coreutils moreutils util-linux -y 2>/dev/null
          sudo apt-get install automake b3sum build-essential ca-certificates ccache dos2unix lzip jq make musl musl-dev musl-tools p7zip-full wget -y 2>/dev/null
          sudo apt-get install -y --no-install-recommends autoconf automake autopoint binutils bison build-essential byacc ca-certificates clang flex file jq patch patchelf pkg-config python3-pip qemu-user-static wget 2>/dev/null
          sudo apt-get install devscripts -y --no-install-recommends 2>/dev/null
          #Re
          sudo apt-get install automake b3sum build-essential ca-certificates ccache dos2unix lzip jq make musl musl-dev musl-tools p7zip-full wget -y 2>/dev/null
          sudo apt-get install -y --no-install-recommends autoconf automake autopoint binutils bison build-essential byacc ca-certificates clang flex file jq patch patchelf pkg-config 2>/dev/null
          sudo apt-get install devscripts -y --no-install-recommends 2>/dev/null
          #Install Build Dependencies (arm64)
          sudo apt install binutils-aarch64-linux-gnu -y 2>/dev/null
          sudo apt-get install "g++-arm-linux-gnueabi" "g++-arm-linux-gnueabihf" "g++-aarch64-linux-gnu" qemu-user-static -y 2>/dev/null
         #libpcap
          sudo apt install 'libpcap*' -y 2>/dev/null
         #Networking
          sudo apt-get install dnsutils 'inetutils*' net-tools netcat-traditional -y 2>/dev/null
          sudo apt-get install 'iputils*' -y 2>/dev/null
          sudo setcap cap_net_raw+ep "$(which ping)" 2>/dev/null
         #Install PythonUtils & Deps (StaticX)
          sudo apt install python3-pip python3-venv -y 2>/dev/null
          sudo apt install lm-sensors pciutils procps python3-distro python3-netifaces sysfsutils virt-what -y 2>/dev/null
          sudo apt-get install libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev xcb -y 2>/dev/null
          pip install ansi2txt --upgrade 2>/dev/null
          pip install scons  --upgrade 2>/dev/null
          pip install staticx --upgrade 2>/dev/null
          pip install pyinstaller --upgrade 2>/dev/null
          pip install py2static --upgrade 2>/dev/null
          pip install typer --upgrade 2>/dev/null
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
          pip install meson ninja --upgrade
          #python3 -m pip install meson ninja --upgrade
          sudo ln -s "$HOME/.local/bin/meson" "/usr/bin/meson" 2>/dev/null
          sudo ln -s "$HOME/.local/bin/ninja" "/usr/bin/ninja" 2>/dev/null
          sudo chmod +xwr "/usr/bin/meson" "/usr/bin/ninja"
          #version
          meson --version ; ninja --version
         ##Install ncurses 
          curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/Debian/install_ncurses_zig_x86_64.sh" | bash
          find "$SYSTMP" -type d -name "*ncurses*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
         ##Openssl (via nmap)
          curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Devscripts/install_nmap.sh" | bash
          find "$SYSTMP" -type d -name "*nmap*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
          find "$SYSTMP" -type d -name "*openssl*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
         ##wolfssl
          pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/wolfSSL/wolfssl" && cd "./wolfssl"
          bash "./autogen.sh" 2>/dev/null ; "./configure" --enable-all --disable-shared --enable-static --enable-sslv3
          make --jobs="$(($(nproc)+1))" --keep-going ; sudo make install ; wolfssl-config --version ; popd > /dev/null 2>&1
          find "$SYSTMP" -type d -name "*wolfssl*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
    fi 
    #-------------------------------------------------------#
    
    #-------------------------------------------------------#
    ##Langs
    if [ "$CONTINUE" == "YES" ]; then
         #Crystal
          curl -qfsSL "https://crystal-lang.org/install.sh" | sudo bash
          crystal --version ; shards --version
         #golang 
          echo "yes" | bash <(curl -qfsSL "https://git.io/go-installer")
          PATH="$HOME/.go/bin:$HOME/go/bin:$PATH" go version
         #rust & cargo
          bash <(curl -qfsSL "https://sh.rustup.rs") -y 
          PATH="$HOME/.cargo/bin:$HOME/.cargo/env:$PATH" rustc --version
          PATH="$HOME/.cargo/bin:$HOME/.cargo/env:$PATH" cargo --version
          #Cross-rs
           PATH="$HOME/.cargo/bin:$HOME/.cargo/env:$PATH" cargo install cross --git "https://github.com/cross-rs/cross"
         #zig
          curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/Debian/install_zig.sh" | bash
          find "$SYSTMP" -type d -name "*zig*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
          find "$SYSTMP" -type f -name "*zig*" 2>/dev/null -exec rm -rf {} \; >/dev/null 2>&1
    fi 
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