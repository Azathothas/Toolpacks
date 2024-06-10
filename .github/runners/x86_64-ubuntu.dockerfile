# syntax=docker/dockerfile:1
#------------------------------------------------------------------------------------#
#Ubuntu 22.04 LTS :: https://wiki.ubuntu.com/Releases
# Based on :: https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/ubuntu-systemd-base.dockerfile
# Preconfigured with: Systemd + SSHD + Docker
# REF :: https://docs.docker.com/engine/reference/builder/
# LINT :: https://github.com/hadolint/hadolint
## Note :: NO SPACE after EOS using heredoc `EOS` to write multiline scripts
#FROM nestybox/ubuntu-jammy-systemd-docker:latest
# URL: https://hub.docker.com/r/azathothas/gh-runner-x86_64-ubuntu
FROM ubuntu:latest
#FROM ubuntu:jammy
#------------------------------------------------------------------------------------#
##Base Deps
ENV DEBIAN_FRONTEND="noninteractive"
ENV INSTALL_SRC="https://bin.ajam.dev/x86_64_Linux"
RUN <<EOS
  #Base
  apt-get update -y
  apt-get install -y --ignore-missing apt-transport-https apt-utils bash ca-certificates coreutils curl dos2unix fdupes findutils git gnupg2 jq locales locate moreutils nano ncdu p7zip-full rename rsync software-properties-common texinfo sudo tmux unzip util-linux xz-utils wget zip
  #RE
  apt-get install -y --ignore-missing apt-transport-https apt-utils bash ca-certificates coreutils curl dos2unix fdupes findutils git gnupg2 jq locales locate moreutils nano ncdu p7zip-full rename rsync software-properties-common texinfo sudo tmux unzip util-linux xz-utils wget zip
  #unminimize : https://wiki.ubuntu.com/Minimal
  yes | unminimize
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
##Systemd installation
RUN <<EOS
  #SystemD
  apt-get update -y
  apt-get install -y --no-install-recommends dbus iptables iproute2 libsystemd0 kmod systemd systemd-sysv udev
 ##Prevents journald from reading kernel messages from /dev/kmsg
 # echo "ReadKMsg=no" >> "/etc/systemd/journald.conf"
 #Disable systemd services/units that are unnecessary within a container.
  systemctl mask "systemd-udevd.service"
  systemctl "systemd-udevd-kernel.socket"
  systemctl "systemd-udevd-control.socket"
  systemctl "systemd-modules-load.service"
  systemctl "sys-kernel-debug.mount"
  systemctl "sys-kernel-tracing.mount"
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
 #Recheck 
  grep runner "/etc/passwd"
EOS
##Set PATH [Default: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin] /command is s6-tools
#ENV PATH "/command:${PATH}"
RUN echo 'export PATH="/command:${PATH}"' >> "/etc/bash.bashrc"
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Install Docker
RUN <<EOS
  #Install Docker
  rm -rf "/var/lib/apt/lists/"*
  cd "$(mktemp -d)" >/dev/null 2>&1
  curl -qfsSL "https://get.docker.com" -o "./get-docker.sh" && sh "./get-docker.sh"
  cd - >/dev/null 2>&1
 #Add runner to docker
  usermod -aG "docker" "runner"
 #Add Docker Completions
  curl -qfsSL "https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker" > "/etc/bash_completion.d/docker.sh"
 #Confiure Docker Opts
  #Remove Hardlimit
  sed -i 's/ulimit -Hn/# ulimit -Hn/g' "/etc/init.d/docker"
  #Install Additional Deps
  sudo apt-get install fuse-overlayfs -y
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Addons
RUN <<EOS
 #Addons
 #https://github.com/Azathothas/Arsenal/blob/main/misc/Linux/install_bb_tools.sh
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/install_bb_tools.sh" -o "./tools.sh"
 dos2unix --quiet "./tools.sh" && chmod +x "./tools.sh"
 INSTALL_SRC="https://bin.ajam.dev/x86_64_Linux" bash "./tools.sh" 2>/dev/null || true ; rm -rf "./tools.sh"
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Build Tools
RUN <<EOS
  apt-get update -y
  apt-get install -y aria2 automake bc binutils b3sum build-essential ca-certificates ccache diffutils dos2unix findutils gawk lzip jq libtool libtool-bin make musl musl-dev musl-tools p7zip-full rsync texinfo wget xz-utils
  apt-get install python3 -y
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
# Build args
#ARG TARGETPLATFORM=amd64
#ARG RUNNER_VERSION=2.313.0
#------------------------------------------------------------------------------------#
##Download Runner Script
# https://github.com/actions/runner/releases
WORKDIR /runner
RUN <<EOS
 #Setup GH Runner (X86_64)
  eget "https://github.com/actions/runner" --asset "linux" --asset "x64" --asset "^arm" --asset "tar.gz" --to "./runner.tar.gz" --download-only 
 #Untar
  mkdir -p "/runner-init"
  tar xzf "./runner.tar.gz" -C "/runner-init" && rm "./runner.tar.gz"
 #Dos2unix
  find "/runner-init" -type f -exec dos2unix --quiet {} \; 2>/dev/null || true
 #Run Install
  chmod +x "/runner-init/bin/installdependencies.sh" && bash "/runner-init/bin/installdependencies.sh"
 #Remove cache 
  rm -rf "/var/lib/apt/lists/"* 2>/dev/null
EOS
#Copy startup script
COPY "./startup.sh" "/usr/local/bin/startup.sh"
RUN chmod +x "/usr/local/bin/startup.sh"
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Display & x11 :: https://github.com/puppeteer/puppeteer/issues/8148
RUN <<EOS
 #x11 & display server
  echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
  DEBIAN_FRONTEND=noninteractive apt-get update -y -qq && apt install dbus-x11 fonts-ipafont-gothic fonts-freefont-ttf gtk2-engines-pixbuf imagemagick libxss1 xauth xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable x11-apps xorg xvfb -y --ignore-missing
 #Re
  echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
  DEBIAN_FRONTEND=noninteractive apt-get update -y -qq && apt install dbus-x11 fonts-ipafont-gothic fonts-freefont-ttf gtk2-engines-pixbuf imagemagick libxss1 xauth xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable x11-apps xorg xvfb -y --ignore-missing
 #Configure
  touch "$HOME/.Xauthority"
 #To start: (-ac --> disable access control restrictions)
 #Xvfb -ac ":0" & 
 # export DISPLAY=":0" && google-chrome
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##This is no longer needed because replaced docker with podman
##Docker systemctl https://github.com/gdraheim/docker-systemctl-replacement
RUN <<EOS
#systemctl
#System has not been booted with systemd as init system (PID 1). Can't operate.
#Failed to connect to bus: Host is down
#Replace with patched
 apt-get install python3 -y
# curl -qfsSL "https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py" -o "$(which systemctl)"
 mkdir -p "/var/run/dbus" ; dbus-daemon --config-file="/usr/share/dbus-1/system.conf" --print-address
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Setup TailScale (sudo tailscale up --authkey="$TSKEY" --ssh --hostname="$TS_NAME" --accept-dns="true" --accept-risk="all" --accept-routes="false" --shields-up="false" --advertise-exit-node --reset)
RUN <<EOS
  #Install TailScale [pkg]
  set +e
  curl -qfsSL "https://tailscale.com/install.sh" -o "./tailscale.sh"
  dos2unix --quiet "./tailscale.sh"
  bash "./tailscale.sh" -s -- -h >/dev/null 2>&1 || true ; rm -rf "./tailscale.sh"
  systemctl -l --type "service" --all | grep -i "tailscale" || true
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
#Start
ENTRYPOINT ["/sbin/init"]
#------------------------------------------------------------------------------------#