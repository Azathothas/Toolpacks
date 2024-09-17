# syntax=docker/dockerfile:1
#------------------------------------------------------------------------------------#
#https://hub.docker.com/r/azathothas/debian-builder-unstable
FROM debian:unstable
#------------------------------------------------------------------------------------#
##Base Deps
ENV DEBIAN_FRONTEND="noninteractive"
#ENV INSTALL_SRC="https://bin.ajam.dev/x86_64_Linux"
RUN <<EOS
  #Base
  set +e
  apt-get update -y
  apt-get install -y --ignore-missing apt-transport-https apt-utils autopoint bash bison ca-certificates coreutils curl dos2unix fdupes findutils gettext git gnupg2 gperf imagemagick jq locales locate moreutils nano ncdu p7zip-full rename rsync software-properties-common texinfo sudo tmux unzip util-linux xz-utils wget zip
  #RE
  apt-get install -y --ignore-missing apt-transport-https apt-utils autopoint bash bison ca-certificates coreutils curl dos2unix fdupes findutils gettext git gnupg2 gperf imagemagick jq locales locate moreutils nano ncdu p7zip-full rename rsync software-properties-common texinfo sudo tmux unzip util-linux xz-utils wget zip
  #NetTools
  apt-get install dnsutils inetutils-ftp inetutils-ftpd inetutils-inetd inetutils-ping inetutils-syslogd inetutils-tools inetutils-traceroute iproute2 net-tools netcat-traditional -y -qq --ignore-missing
  apt-get install iputils-arping iputils-clockdiff iputils-ping iputils-tracepath iproute2 -y -qq --ignore-missing
  setcap 'cap_net_raw+ep' "$(which ping)"
  #Python
  apt-get install python3 -y
  #Test
  python --version 2>/dev/null ; python3 --version 2>/dev/null
  #Install pip:
  #python3 -m ensurepip --upgrade ; pip3 --version
  #curl -qfsSL "https://bootstrap.pypa.io/get-pip.py" -o "$SYSTMP/get-pip.py" && python3 "$SYSTMP/get-pip.py"
  apt-get install libxslt-dev lm-sensors pciutils procps python3-distro python-dev-is-python3 python3-lxml python3-netifaces python3-pip python3-venv sysfsutils virt-what -y --ignore-missing
  pip install --break-system-packages --upgrade pip || pip install --upgrade pip
  #Misc
  pip install ansi2txt --break-system-packages --force-reinstall --upgrade
  #pipx
  pip install pipx --upgrade 2>/dev/null
  pip install pipx --upgrade --break-system-packages 2>/dev/null
EOS
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
 #Passwordless sudo for runner
  echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" >> "/etc/sudoers"
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
##Set PATH [Default: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin] /command is s6-tools
#ENV PATH "/command:${PATH}"
#RUN echo 'export PATH="/command:${PATH}"' >> "/etc/bash.bashrc"
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Addons
RUN <<EOS
 #Addons
 #https://github.com/Azathothas/Arsenal/blob/main/misc/Linux/install_bb_tools.sh
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/install_bb_tools.sh" -o "./tools.sh"
 dos2unix --quiet "./tools.sh" && chmod +x "./tools.sh"
 bash "./tools.sh" 2>/dev/null || true ; rm -rf "./tools.sh"
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Build Tools
RUN <<EOS
  #----------------------#
  #Main
  set +e
  apt-get update -y
  apt-get install -y aria2 automake bc binutils b3sum brotli build-essential ca-certificates ccache clang cmake cmake-extras cython3 diffutils dos2unix execline findutils fontconfig gawk gcc lzip jq libtool libtool-bin make meson musl musl-dev musl-tools nasm python3 p7zip-full spirv-cross rsync texinfo texi2html txt2html wget xxhash xz-utils yasm
  #Re
  apt-get install -y aria2 automake bc binutils b3sum brotli build-essential ca-certificates ccache clang cmake cmake-extras cython3 diffutils dos2unix execline findutils fontconfig gawk gcc lzip jq libtool libtool-bin make meson musl musl-dev musl-tools nasm python3 p7zip-full spirv-cross rsync texinfo texi2html txt2html wget xxhash xz-utils yasm
  #----------------------#
  #Install Meson & Ninja
  #sudo rm "/usr/bin/meson" "/usr/bin/ninja" 2>/dev/null
  pip install meson ninja --upgrade 2>/dev/null
  pip install meson ninja --break-system-packages --upgrade --force-reinstall 2>/dev/null
  #python3 -m pip install meson ninja --upgrade
  #Installs to /usr/local/bin/
  #sudo ln -s "$HOME/.local/bin/meson" "/usr/bin/meson" 2>/dev/null
  #sudo ln -s "$HOME/.local/bin/ninja" "/usr/bin/ninja" 2>/dev/null
  #sudo chmod +xwr "/usr/bin/meson" "/usr/bin/ninja" 2>/dev/null
  #----------------------#
  #libpcap
  sudo apt install libpcap-dev pcaputils -y 2>/dev/null 
  #----------------------#        
  #libsqlite3
  sudo apt-get install libsqlite3-dev sqlite3 sqlite3-pcre sqlite3-tools -y 2>/dev/null
  #----------------------#
  #lzma
  sudo apt-get install liblz-dev librust-lzma-sys-dev lzma lzma-dev -y
  #----------------------#
  #staticx: https://github.com/JonathonReinhart/staticx/blob/main/.github/workflows/build-test.yml
  export CWD="$(realpath .)" ; cd "$(mktemp -d)" >/dev/null 2>&1 ; realpath .
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