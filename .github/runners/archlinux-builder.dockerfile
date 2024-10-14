# syntax=docker/dockerfile:1
#------------------------------------------------------------------------------------#
#https://hub.docker.com/r/azathothas/archlinux-builder
FROM azathothas/archlinux:latest
#------------------------------------------------------------------------------------#
##Base Deps
RUN <<EOS
  #Base
  set +e
  pacman -Syu --noconfirm
  pacman base-devel bash bison ca-certificates coreutils curl dos2unix findutils gettext git gnupg gperf imagemagick jq less lzip lzlib moreutils micro nano ncdu pacutils p7zip rsync sudo texinfo tmux unzip util-linux wget xz zip --sync --noconfirm
  #RE
  pacman -Syu --noconfirm
  pacman base-devel bash bison ca-certificates coreutils curl dos2unix findutils gettext git gnupg gperf imagemagick jq less lzip lzlib moreutils micro nano ncdu pacutils p7zip rsync sudo texinfo tmux unzip util-linux wget xz zip --sync --needed --noconfirm
  #NetTools
  pacman inetutils iproute2 iputils net-tools openbsd-netcat --sync --needed --noconfirm
  setcap 'cap_net_raw+ep' "$(which ping)"
  #Python & Deps
  pacman patchelf python python-devtools python-distro python-lxml python-netifaces python-pypatchelf python-pip python-pipx python-pkgconfig python-xxhash scons sysfsutils virt-what --sync --needed --noconfirm
  #Test
  python --version 2>/dev/null ; python3 --version 2>/dev/null
  pip --version 2>/dev/null ; pip3 --version 2>/dev/null
  pipx --version 2>/dev/null
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##OS Settings
RUN <<EOS
 #NameServers
  echo "nameserver 1.0.0.1" >> "/etc/resolv.conf"
  echo "nameserver 1.1.1.1" >> "/etc/resolv.conf"
  echo "nameserver 8.8.4.4" >> "/etc/resolv.conf"
  echo "nameserver 8.8.8.8" >> "/etc/resolv.conf"
 #Key-Verification
  #sed 's/^.*SigLevel\s*=.*$/SigLevel = Never/' -i "/etc/pacman.conf"
 #Update
  pacman -Syu --noconfirm
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Create User + Setup Perms
RUN <<EOS
 #Add runner
  useradd -m -s "/bin/bash" "runner"
 #Set password
  echo "runner:runneradmin" | chpasswd
 #Add runner to sudo
  usermod -aG "wheel" "runner"
  usermod -aG "wheel" "root"
 #Passwordless sudo for runner
  echo "%wheel ALL=(ALL) NOPASSWD: ALL" | tee -a "/etc/sudoers"
  compgen -u
 #Fix perms
  chmod 0440 "/etc/sudoers"
  visudo -c
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
  ##Main
  set +e
  pacman -Syu --noconfirm
  pacman aria2 autoconf autoconf-archive automake bazel bc binutils b3sum brotli busybox ccache clang cmake coreutils cython diffutils dos2unix findutils fontconfig gawk gcc gettext kernel-headers-musl jq libpcap libtool meson musl nasm polkit pkgconf rsync spirv-headers spirv-tools sqlite texinfo texi2html util-linux util-linux-libs wget libxslt xxhash yasm --sync --needed --noconfirm
  #Re
  pacman -Syu --noconfirm
  pacman aria2 autoconf autoconf-archive automake bazel bc binutils b3sum brotli busybox ccache clang cmake coreutils cython diffutils dos2unix findutils fontconfig gawk gcc gettext kernel-headers-musl jq libpcap libtool meson musl nasm polkit pkgconf rsync spirv-headers spirv-tools sqlite texinfo texi2html util-linux util-linux-libs wget libxslt xxhash yasm --sync --needed --noconfirm
  #----------------------#
  ##Dockerc
  curl -qfsSL "https://bin.ajam.dev/$(uname -m)/dockerc" -o "/usr/bin/dockerc" && chmod +x "/usr/bin/dockerc"
  #----------------------#
  ##Linux Headers
  if [ "$(uname -m)" == "aarch64" ]; then
     pacman -Syu --noconfirm && pacman linux-aarch64-headers --sync --needed --noconfirm
  elif [ "$(uname -m)" == "x86_64" ]; then
     pacman -Syu --noconfirm && pacman linux-headers --sync --needed --noconfirm
  else
     echo "[+]"
  fi
  #----------------------#
  ##Install Meson & Ninja
  #sudo rm "/usr/bin/meson" "/usr/bin/ninja" 2>/dev/null
  pip install meson ninja --break-system-packages --upgrade --force-reinstall 2>/dev/null
  #----------------------#  
  ##musl
   export CWD="$(realpath .)" ; cd "$(mktemp -d)" >/dev/null 2>&1 ; realpath "."
   git clone --filter "blob:none" --depth="1" "https://git.musl-libc.org/git/musl" && cd "./musl"
   unset AR CC CFLAGS CXX CPPFLAGS CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
   make dest clean 2>/dev/null ; make clean 2>/dev/null
   bash "./configure" || true
   make --jobs="$(($(nproc)+1))" --keep-going install || true
   rm -rf "$(realpath .)" ; cd "${CWD}"
   ldconfig && ldconfig -p || true
  #----------------------#
  ##staticx: https://github.com/JonathonReinhart/staticx/blob/main/.github/workflows/build-test.yml
  export CWD="$(realpath .)" ; cd "$(mktemp -d)" >/dev/null 2>&1 ; realpath .
  #Switch to default: https://github.com/JonathonReinhart/staticx/pull/284
  git clone --filter "blob:none" "https://github.com/JonathonReinhart/staticx" --branch "add-type-checking" && cd "./staticx"
  #https://github.com/JonathonReinhart/staticx/blob/main/build.sh
  pip install -r "./requirements.txt" --break-system-packages --upgrade --force
  pacman -Syu --noconfirm
  export BOOTLOADER_CC="/usr/local/musl/bin/musl-gcc"
  rm -rf "./build" "./dist" "./scons_build" "./staticx/assets"
  python "./setup.py" sdist bdist_wheel
  find "dist/" -name "*.whl" | xargs -I {} sh -c 'newname=$(echo {} | sed "s/none-[^/]*\.whl$/none-any.whl/"); mv "{}" "$newname"'
  find "dist/" -name "*.whl" | xargs pip install --break-system-packages --upgrade --force
  staticx --version || pip install staticx --break-system-packages --force-reinstall --upgrade ; unset BOOTLOADER_CC
  rm -rf "$(realpath .)" ; cd "${CWD}"
  #----------------------#
  ##pyinstaller
  pip install "git+https://github.com/pyinstaller/pyinstaller" --break-system-packages --force-reinstall --upgrade ; pyinstaller --version
  #----------------------#
  ##golang
  #Installed later to ensure correct ENV
  #pacman -Syu --noconfirm && pacman go --sync --needed --noconfirm ; go version
  sudo -u "runner" bash -c \
  '
  sudo pacman -R go --noconfirm 2>/dev/null
  rm -rf "/usr/lib/go" 2>/dev/null 
  pushd "$(mktemp -d)" >/dev/null
  echo "yes" | bash <(curl -qfsSL "https://git.io/go-installer")
  popd >/dev/null
  ' || true
  echo 'export GOROOT="/home/runner/.go"' >> "/etc/bash.bashrc"
  echo 'export GOPATH="/home/runner/go"' >> "/etc/bash.bashrc"
  echo 'export PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"' >> "/etc/bash.bashrc"
  #----------------------#
  ##patchelf
  curl -qfsSL "https://bin.ajam.dev/$(uname -m)/patchelf" -o "/usr/bin/patchelf" && chmod +x "/usr/bin/patchelf"
  #----------------------#
  ##Rust
  pacman -Syu --noconfirm && pacman rust --sync --needed --noconfirm ; cargo --version ; rustc --version
  #----------------------#
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##AUR Helpers
RUN <<EOS
  #----------------------#
  #Paru:https://github.com/Morganamilo/paru
  sudo -u "runner" bash -c \
  '
  export CWD="$(realpath .)" ; cd "$(mktemp -d)" >/dev/null 2>&1 ; realpath "."
  git clone --filter "blob:none" --depth="1" "https://aur.archlinux.org/paru-bin.git" && cd "./paru-bin"
  makepkg --install --syncdeps --cleanbuild --clean --force --noconfirm ; paru --version
  rm -rf "$(realpath .)" ; cd "${CWD}"
  ' || true
  #----------------------#
  #Yay:https://github.com/Jguer/yay
  sudo -u "runner" bash -c \
  '
  export CWD="$(realpath .)" ; cd "$(mktemp -d)" >/dev/null 2>&1 ; realpath "."
  git clone --filter "blob:none" --depth="1" "https://aur.archlinux.org/yay.git" && cd "./yay"
  makepkg --install --syncdeps --cleanbuild --clean --force --noconfirm ; yay --version
  rm -rf "$(realpath .)" ; cd "${CWD}"
  ' || true
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
EOS
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US:en"
ENV LC_ALL="en_US.UTF-8"
#------------------------------------------------------------------------------------#