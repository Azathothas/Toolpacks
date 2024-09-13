#!/usr/bin/env bash

###-------------------------------------------------------###
### Setups Essential Tools & Preps Sys Environ for Deps   ###
### This Script must be run as `root` (passwordless)      ###
### Assumptions: Arch: (arm64) AARCH64 | OS: Debian 64bit ###
###-------------------------------------------------------###

#-------------------------------------------------------#
## Init Script for toolpacks builder
# This should be run on Debian (Debian Based) Distros with apt, coreutils, curl, dos2unix & passwordless sudo
# sudo apt-get update -y && sudo apt-get install coreutils curl dos2unix moreutils -y
# OR (without sudo): apt-get update -y && apt-get install coreutils curl dos2unix moreutils sudo -y
#
# Hardware : At least 2vCPU + 8GB RAM + 50GB SSD
# Once requirement is satisfied, simply:
# bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/aarch64_Linux/init_debian.sh")
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
     TMPDIRS="mktemp -d --tmpdir=$SYSTMP/init_Debian XXXXXXX_debian_aarch64" && export TMPDIRS="$TMPDIRS"
     rm -rf "$SYSTMP/init_Debian" 2>/dev/null ; mkdir -p "$SYSTMP/init_Debian"
     pushd "$($TMPDIRS)" >/dev/null 2>&1 
    if [ "$CONTINUE" == "YES" ]; then
         #Install CoreUtils & Deps
          sudo apt-get update -y 2>/dev/null
          sudo apt-get install apt-transport-https apt-utils ca-certificates coreutils gnupg2 moreutils software-properties-common util-linux -y 2>/dev/null ; sudo apt-get update -y 2>/dev/null
          #Install Build Des
          sudo apt-get install aria2 automake bc binutils b3sum build-essential ca-certificates ccache diffutils dos2unix gawk imagemagick lzip jq libtool libtool-bin make musl musl-dev musl-tools p7zip-full rsync texinfo tree wget -y 2>/dev/null
          sudo apt-get install -y --no-install-recommends autoconf automake autopoint binutils bison build-essential byacc ca-certificates clang flex file jq libtool libtool-bin patch patchelf pkg-config qemu-user-static scons wget 2>/dev/null
          sudo apt-get install devscripts -y --no-install-recommends 2>/dev/null
          sudo apt-get install cmake -y
          #Re
          sudo apt-get install aria2 automake bc binutils b3sum build-essential ca-certificates ccache diffutils dos2unix gawk imagemagick lzip jq libtool libtool-bin make musl musl-dev musl-tools p7zip-full rsync texinfo tree wget -y 2>/dev/null
          sudo apt-get install -y --no-install-recommends autoconf automake autopoint binutils bison build-essential byacc ca-certificates clang flex file jq libtool libtool-bin patch patchelf pkg-config qemu-user-static scons wget 2>/dev/null
          sudo apt-get install devscripts -y --no-install-recommends 2>/dev/null
          sudo apt-get install cmake -y
          #Install Build Dependencies (arm64)
          sudo apt install binutils-aarch64-linux-gnu -y 2>/dev/null
          sudo apt-get install "g++-arm-linux-gnueabi" "g++-arm-linux-gnueabihf" "g++-aarch64-linux-gnu" qemu-user-static -y 2>/dev/null
         #libpcap
          sudo apt-get install 'libpcap*' -y 2>/dev/null
         #libsqlite3
          sudo apt-get install libsqlite3-dev sqlite3 sqlite3-pcre sqlite3-tools -y 2>/dev/null
         #lzma
          sudo apt-get install liblz-dev librust-lzma-sys-dev lzma lzma-dev -y 
         #musl
          #Source
          pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --filter "blob:none" "https://git.musl-libc.org/git/musl" && cd "./musl"
          #Flags
          unset AR CC CFLAGS CXX CPPFLAGS CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
          #Configure
          make dest clean 2>/dev/null ; make clean 2>/dev/null
          bash "./configure" --prefix="/usr/local/musl"
          sudo make --jobs="$(($(nproc)+1))" --keep-going install ; popd >/dev/null 2>&1
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
          pip install build cffi scons scuba pytest --upgrade --force 2>/dev/null ; pip install ansi2txt pipx scons py2static typer --upgrade --force 2>/dev/null
          pip install build cffi scons scuba pytest --break-system-packages --upgrade --force 2>/dev/null ; pip install ansi2txt pipx scons py2static typer --break-system-packages --upgrade --force 2>/dev/null
          #Nutika
          #pip install nuitka --break-system-packages --upgrade ; nuitka3 --version
          pip install "git+https://github.com/Nuitka/Nuitka" --break-system-packages --force-reinstall --upgrade ; nuitka3 --version
          #Pex
          pip install "git+https://github.com/pex-tool/pex" --break-system-packages --force-reinstall --upgrade ; pex --version
          #pyinstaller
          pip install "git+https://github.com/pyinstaller/pyinstaller" --break-system-packages --force-reinstall --upgrade ; pyinstaller --version
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
          sudo rm "/etc/apt/sources.list.d/crystal.list" -rf 2>/dev/null
          ## Doesn't provide prebuilts for arm64
          #https://github.com/crystal-lang/distribution-scripts/issues/125#issuecomment-1298548759
          #https://packagecloud.io/84codes/crystal
          curl -qfsSL "https://packagecloud.io/84codes/crystal/gpgkey" | gpg --dearmor | sudo tee "/etc/apt/trusted.gpg.d/84codes_crystal.gpg" > /dev/null
          echo "deb https://packagecloud.io/84codes/crystal/any any main" | sudo tee "/etc/apt/sources.list.d/84codes_crystal.list"
          sudo apt-get update -y ; sudo apt-get install crystal -y
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
         #------------------------------# 
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
         #----------------------# 
         ##Nix
          ##Official Installers break
          #curl -qfsSL "https://nixos.org/nix/install" | bash -s -- --no-daemon
          #source "$HOME/.bash_profile" ; source "$HOME/.nix-profile/etc/profile.d/nix.sh" ; . "$HOME/.nix-profile/etc/profile.d/nix.sh"
          ##https://github.com/DeterminateSystems/nix-installer
          "/nix/nix-installer" uninstall --no-confirm 2>/dev/null
          #curl -qfsSL "https://install.determinate.systems/nix" | bash -s -- install linux --init none --no-confirm
          curl -qfsSL "https://install.determinate.systems/nix" | bash -s -- install linux --init none --extra-conf "filter-syscalls = false" --no-confirm
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
          bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/Debian/install_node_aarch64.sh")
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
         ##Install rust & cargo
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
         #staticx: https://github.com/JonathonReinhart/staticx/blob/main/.github/workflows/build-test.yml
          pushd "$($TMPDIRS)" >/dev/null 2>&1
          #Switch to default: https://github.com/JonathonReinhart/staticx/pull/284
          git clone --filter "blob:none" "https://github.com/JonathonReinhart/staticx" --branch "add-type-checking" && cd "./staticx"
          #https://github.com/JonathonReinhart/staticx/blob/main/build.sh
          pip install -r "./requirements.txt" --break-system-packages --upgrade --force
          sudo apt-get update -y
          sudo apt-get install -y busybox musl-tools scons
          export BOOTLOADER_CC="musl-gcc"
          rm -rf "./build" "./dist" "./scons_build" "./staticx/assets"
          python "./setup.py" sdist bdist_wheel
          find "dist/" -name "*.whl" | xargs -I {} sh -c 'newname=$(echo {} | sed "s/none-[^/]*\.whl$/none-any.whl/"); mv "{}" "$newname"'
          find "dist/" -name "*.whl" | xargs pip install --break-system-packages --upgrade --force
          staticx --version || pip install staticx --break-system-packages --force-reinstall --upgrade ; unset BOOTLOADER_CC
          popd >/dev/null 2>&1
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
          pushd "$($TMPDIRS)" >/dev/null 2>&1 && curl -qfSLJO $(curl -qfsSL "https://ziglang.org/download/index.json" | jq -r '.master | ."aarch64-linux".tarball')
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
    ##Additional Libs
    ##Mold for linking
    if [ "$CONTINUE" == "YES" ]; then
          #Get Source
          pushd "$($TMPDIRS)" >/dev/null 2>&1 && eget "rui314/mold" --asset "aarch64-linux.tar.gz" --download-only --to "./mold.tar.gz"
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
    ##Clean
    echo "INITIALIZED" > "$SYSTMP/INITIALIZED"
    rm -rf "$SYSTMP/init_Debian" 2>/dev/null
    #-------------------------------------------------------#
    ##END
    echo -e "\n\n [+] Finished Initializing $(uname -mnrs) :: at $(TZ='Asia/Kathmandu' date +'%A, %Y-%m-%d (%I:%M:%S %p)')\n\n"
    #In case of polluted env 
    unset ANDROID_TARGET AR AS CC CFLAGS CPP CXX CPPFLAGS CXXFLAGS DLLTOOL HOST_CC HOST_CXX LD LDFLAGS LIBS NM OBJCOPY OBJDUMP RANLIB READELF SIZE STRINGS STRIP SYSROOT
    #-------------------------------------------------------#
  #EOF
fi
popd >/dev/null 2>&1
echo -e "\n[+] Continue : $CONTINUE\n"
#-------------------------------------------------------#
