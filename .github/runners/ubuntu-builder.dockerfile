# syntax=docker/dockerfile:1
#------------------------------------------------------------------------------------#
# DOCKER HUB URL : https://hub.docker.com/r/azathothas/ubuntu-builder
FROM ubuntu:latest
#FROM ubuntu:rolling
#------------------------------------------------------------------------------------#
##Base Deps
ENV DEBIAN_FRONTEND="noninteractive"
RUN <<EOS
  #Base
  apt-get update -y
  packages="apt-transport-https apt-utils bash ca-certificates coreutils curl dos2unix fdupes findutils git gnupg2 imagemagick jq locales locate moreutils nano ncdu p7zip-full rename rsync software-properties-common sudo texinfo tmux tree unzip util-linux xz-utils wget zip"
  #Install
  apt-get update -y -qq
  for pkg in $packages; do DEBIAN_FRONTEND="noninteractive" apt install -y --ignore-missing "$pkg"; done
  #Install_Re
  for pkg in $packages; do DEBIAN_FRONTEND="noninteractive" apt install -y --ignore-missing "$pkg"; done
  #unminimize : https://wiki.ubuntu.com/Minimal
  yes | unminimize
  #Python
  apt-get install python3 -y
  #Test
  python --version 2>/dev/null ; python3 --version 2>/dev/null
  #Install pip:
  #python3 -m ensurepip --upgrade ; pip3 --version
  #curl -qfsSL "https://bootstrap.pypa.io/get-pip.py" -o "$SYSTMP/get-pip.py" && python3 "$SYSTMP/get-pip.py"
  packages="libxslt-dev lm-sensors pciutils procps python3-distro python-dev-is-python3 python3-lxml python3-netifaces python3-pip python3-venv sysfsutils virt-what"
  for pkg in $packages; do DEBIAN_FRONTEND="noninteractive" apt install -y --ignore-missing "$pkg"; done
  pip install --break-system-packages --upgrade pip || pip install --upgrade pip
  #Misc
  pip install ansi2txt --break-system-packages --force-reinstall --upgrade
  #pipx
  pip install pipx --upgrade 2>/dev/null
  pip install pipx --upgrade --break-system-packages 2>/dev/null
EOS
#------------------------------------------------------------------------------------#
##Systemd installation
RUN <<EOS
  #SystemD
  apt-get update -y
  packages="dbus iptables iproute2 libsystemd0 kmod systemd systemd-sysv udev"
  for pkg in $packages; do apt install -y --ignore-missing "$pkg"; done
 #Housekeeping
  apt-get clean -y
  rm -rf "/lib/systemd/system/getty.target" 2>/dev/null
  rm -rf "/lib/systemd/system/systemd"*udev* 2>/dev/null
  rm -rf "/usr/share/doc/"* 2>/dev/null
  rm -rf "/usr/share/local/"* 2>/dev/null
  rm -rf "/usr/share/man/"* 2>/dev/null
  rm -rf "/var/cache/debconf/"* 2>/dev/null
  rm -rf "/var/lib/apt/lists/"* 2>/dev/null
  rm -rf "/var/log/"* 2>/dev/null
  rm -rf "/var/tmp/"* 2>/dev/null
  rm -rf "/tmp/"* 2>/dev/null
EOS
# Make use of stopsignal (instead of sigterm) to stop systemd containers.
STOPSIGNAL SIGRTMIN+3
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Create User + Setup Perms
RUN <<EOS
 #Add runner
  useradd --create-home "runner"
 #Set password
  echo "runner:runneradmin" | chpasswd
 #Add runner to sudo
  usermod -aG "sudo" "runner"
  usermod -aG "sudo" "root"
 #Passwordless for runner
  echo "%sudo  ALL=(ALL:ALL) NOPASSWD:ALL" >> "/etc/sudoers"
 #Remove preconfigured admin user
  userdel -r "admin" 2>/dev/null || true
EOS
##Change Default shell for runner to bash
RUN <<EOS
 #Check current shell
  grep runner "/etc/passwd"
 #Change to bash 
  usermod --shell "/bin/bash" "runner" 2>/dev/null
  curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/.bashrc" -o "/etc/bash.bashrc"
  dos2unix --quiet "/etc/bash.bashrc" 2>/dev/null
  ln --symbolic --force "/etc/bash.bashrc" "/home/runner/.bashrc" 2>/dev/null
  ln --symbolic --force "/etc/bash.bashrc" "/root/.bashrc" 2>/dev/null
  ln --symbolic --force "/etc/bash.bashrc" "/etc/bash/bashrc" 2>/dev/null
 #Recheck 
  grep runner "/etc/passwd"
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Addons
RUN <<EOS
 #Addons
 #https://github.com/Azathothas/Arsenal/blob/main/misc/Linux/install_dev_tools.sh
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/install_dev_tools.sh" -o "./tools.sh"
 dos2unix --quiet "./tools.sh" && chmod +x "./tools.sh"
 bash "./tools.sh" 2>/dev/null || true ; rm -rf "./tools.sh"
 ##Appimage tools
 curl -qfsSL "https://bin.ajam.dev/$(uname -m)/go-appimagetool.no_strip" -o "/usr/local/bin/go-appimagetool" && chmod +x "/usr/local/bin/go-appimagetool"
 curl -qfsSL "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-$(uname -m).AppImage" -o "/usr/local/bin/appimagetool" && chmod +x "/usr/local/bin/appimagetool"
 curl -qfsSL "https://bin.ajam.dev/$(uname -m)/linuxdeploy.no_strip" -o "/usr/local/bin/linuxdeploy" && chmod +x "/usr/local/bin/linuxdeploy"
 curl -qfsSL "https://bin.ajam.dev/$(uname -m)/mkappimage" -o "/usr/local/bin/mkappimage" && chmod +x "/usr/local/bin/mkappimage"
 curl -qfsSL "https://bin.ajam.dev/$(uname -m)/Baseutils/squashfstools/mksquashfs" -o "/usr/local/bin/mksquashfs" && chmod +x "/usr/local/bin/mksquashfs"
 curl -qfsSL "https://bin.ajam.dev/$(uname -m)/Baseutils/squashfstools/sqfscat" -o "/usr/local/bin/sqfscat" && chmod +x "/usr/local/bin/sqfscat"
 curl -qfsSL "https://bin.ajam.dev/$(uname -m)/Baseutils/squashfstools/sqfstar" -o "/usr/local/bin/sqfstar" && chmod +x "/usr/local/bin/sqfstar"
 curl -qfsSL "https://bin.ajam.dev/$(uname -m)/Baseutils/squashfstools/unsquashfs" -o "/usr/local/bin/unsquashfs" && chmod +x "/usr/local/bin/unsquashfs"
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Build Tools
RUN <<EOS
  #----------------------#
  #Main
  set +e
  packages="apt-transport-https apt-utils aria2 autoconf automake autopoint bc binutils bison b3sum build-essential byacc ca-certificates ccache clang cmake coreutils desktop-file-utils devscripts diffutils dnsutils dos2unix flex file findutils gawk git-lfs gnupg2 imagemagick lzip liblz-dev librust-lzma-sys-dev lzma lzma-dev jq libsqlite3-dev libtool libtool-bin make moreutils musl musl-dev musl-tools patch patchelf pkg-config python3-pip python3-venv p7zip-full qemu-user-static rsync scons software-properties-common sqlite3 sqlite3-pcre sqlite3-tools texinfo tree util-linux wget xz-utils zsync"
  #Install
  apt-get update -y -qq
  for pkg in $packages; do DEBIAN_FRONTEND="noninteractive" apt install -y --ignore-missing "$pkg"; done
  #Install_Re
  for pkg in $packages; do DEBIAN_FRONTEND="noninteractive" apt install -y --ignore-missing "$pkg"; done
  #----------------------#
  #Dockerc
  curl -qfsSL "https://bin.ajam.dev/$(uname -m)/dockerc" -o "/usr/bin/dockerc" && chmod +x "/usr/bin/dockerc"
  #----------------------#
  #Install Meson & Ninja
  #rm "/usr/bin/meson" "/usr/bin/ninja" 2>/dev/null
  pip install meson ninja --upgrade 2>/dev/null
  pip install meson ninja --break-system-packages --upgrade --force-reinstall 2>/dev/null
  #----------------------#
  #libpcap
  apt install libpcap-dev pcaputils -y 2>/dev/null 
  #----------------------#        
  #libsqlite3
  apt-get install libsqlite3-dev sqlite3 sqlite3-pcre sqlite3-tools -y 2>/dev/null
  #----------------------#
  #lzma
  apt-get install liblz-dev librust-lzma-sys-dev lzma lzma-dev -y
  #----------------------#
  #staticx: https://github.com/JonathonReinhart/staticx/blob/main/.github/workflows/build-test.yml
  export CWD="$(realpath .)" ; cd "$(mktemp -d)" >/dev/null 2>&1 ; realpath .
  #Switch to default: https://github.com/JonathonReinhart/staticx/pull/284
  git clone --filter "blob:none" "https://github.com/JonathonReinhart/staticx" --branch "add-type-checking" && cd "./staticx"
  #https://github.com/JonathonReinhart/staticx/blob/main/build.sh
  pip install -r "./requirements.txt" --break-system-packages --upgrade --force
  apt-get update -y
  apt-get install -y busybox musl-tools scons
  export BOOTLOADER_CC="musl-gcc"
  rm -rf "./build" "./dist" "./scons_build" "./staticx/assets"
  python "./setup.py" sdist bdist_wheel
  find "dist/" -name "*.whl" | xargs -I {} sh -c 'newname=$(echo {} | sed "s/none-[^/]*\.whl$/none-any.whl/"); mv "{}" "$newname"'
  find "dist/" -name "*.whl" | xargs pip install --break-system-packages --upgrade --force
  staticx --version || pip install staticx --break-system-packages --force-reinstall --upgrade ; unset BOOTLOADER_CC
  rm -rf "$(realpath .)" ; cd "${CWD}"
  #----------------------#
  #pyinstaller
  pip install "git+https://github.com/pyinstaller/pyinstaller" --break-system-packages --force-reinstall --upgrade ; pyinstaller --version
  #----------------------#
  #golang
  cd "$(mktemp -d)" >/dev/null 2>&1 ; realpath .
  curl -qfsSL "https://git.io/go-installer" -o "./install.sh"
  dos2unix --quiet "./install.sh" && chmod +x "./install.sh"
  echo "yes" | bash "./install.sh" 2>/dev/null || true
  rm -rf "$(realpath .)" ; cd "${CWD}"
  #patchelf
  curl -qfsSL "https://bin.ajam.dev/$(uname -m)/patchelf" -o "/usr/bin/patchelf" && chmod +x "/usr/bin/patchelf"
  #----------------------#
  #Rust
  cd "$(mktemp -d)" >/dev/null 2>&1 ; realpath .
  curl -qfsSL "https://sh.rustup.rs" -o "./install.sh"
  dos2unix --quiet "./install.sh" && chmod +x "./install.sh"
  bash "./install.sh" -y 2>/dev/null || true
  rm -rf "$(realpath .)" ; cd "${CWD}"
  #----------------------#
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
#Start
RUN <<EOS
 #Locale
  echo "LC_ALL=en_US.UTF-8" | tee -a "/etc/environment"
  echo "en_US.UTF-8 UTF-8" | tee -a "/etc/locale.gen"
  echo "LANG=en_US.UTF-8" | tee -a "/etc/locale.conf"
  locale-gen "en_US.UTF-8"
 #Dialog
  echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections
  debconf-show debconf 
EOS
ENV DEBIAN_FRONTEND="noninteractive"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US:en"
ENV LC_ALL="en_US.UTF-8"
ENV PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.cargo/env:$HOME/.go/bin:$HOME/go/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$HOME/.local/bin:$HOME/miniconda3/bin:$HOME/miniconda3/condabin:/usr/local/zig:/usr/local/zig/lib:/usr/local/zig/lib/include:/usr/local/musl/bin:/usr/local/musl/lib:/usr/local/musl/include:$PATH"
#------------------------------------------------------------------------------------#