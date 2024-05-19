# syntax=docker/dockerfile:1
#------------------------------------------------------------------------------------#
# https://github.com/nestybox/dockerfiles/blob/master/ubuntu-jammy-systemd-docker/Dockerfile
# Based on :: https://github.com/nestybox/dockerfiles/blob/master/ubuntu-jammy-systemd/Dockerfile
#
# Usage: https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/README.md
#
# docker run --runtime=sysbox-runc -it --rm --name="ubuntu-systemd" "azathothas/ubuntu-systemd-base:latest"
#
# This will run systemd and prompt for a user login; the default user/password
# in this image is "admin/admin".
# URL : https://hub.docker.com/r/azathothas/ubuntu-systemd-base
FROM ubuntu:latest
#------------------------------------------------------------------------------------#
##Base Deps
ENV DEBIAN_FRONTEND="noninteractive"
RUN <<EOS
  #Base
  apt-get update -y
  apt-get install -y --ignore-missing apt-transport-https apt-utils bash ca-certificates coreutils curl dbus dos2unix fdupes file findutils git gnupg gnupg2 iproute2 jq kmod locales locate moreutils nano ncdu ntp p7zip-full rename rsync software-properties-common systemd texinfo sudo tmux udev unzip util-linux xz-utils wget zip
  #RE
  apt-get install -y --ignore-missing apt-transport-https apt-utils bash ca-certificates coreutils curl dbus dos2unix fdupes file findutils git gnupg gnupg2 iproute2 jq kmod locales locate moreutils nano ncdu ntp p7zip-full rename rsync software-properties-common systemd texinfo sudo tmux udev unzip util-linux xz-utils wget zip
  #unminimize : https://wiki.ubuntu.com/Minimal
  yes | unminimize
  #Network
  apt-get update -y -qq ; apt-get dist-upgrade -y -qq ; apt-get upgrade -y --ignore-missing -qq
  apt-get install dnsutils 'inetutils*' net-tools netcat-traditional -y --ignore-missing -qq
  apt-get install 'iputils*' -y -qq
  setcap 'cap_net_raw+ep' "$(which ping)"
  echo 'net.ipv4.ip_forward = 1' | tee -a "/etc/sysctl.conf"
  echo 'net.ipv6.conf.all.forwarding = 1' | tee -a "/etc/sysctl.conf"
  sysctl -p "/etc/sysctl.conf"
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
##Systemd installation
RUN <<EOS
  #SystemD
  apt-get update -y
  apt-get install -y --no-install-recommends dbus iptables iproute2 libsystemd0 kmod systemd systemd-sysv udev
 #Prevents journald from reading kernel messages from /dev/kmsg
  echo "ReadKMsg=no" >> "/etc/systemd/journald.conf"
 #Disable systemd services/units that are unnecessary within a container.
  systemctl mask "systemd-udevd.service"
  systemctl "systemd-udevd-kernel.socket"
  systemctl "systemd-udevd-control.socket"
  systemctl "systemd-modules-load.service"
  systemctl "sys-kernel-debug.mount"
  systemctl "sys-kernel-tracing.mount"
 #Housekeeping
  apt-get clean -y
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
 #Add admin
  useradd --create-home "admin"
  usermod --shell "/bin/bash" "admin" 2>/dev/null
 #Set password
  echo "admin:admin" | chpasswd
 #Add admin to sudo
  usermod -aG "sudo" "admin"
  usermod -aG "sudo" "root"
 #Passwordless sudo for admin
  echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" >> "/etc/sudoers"
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
 #Add admin to docker 
  usermod -aG "docker" "admin"
 #Add Docker Completions
  curl -qfsSL "https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker" > "/etc/bash_completion.d/docker.sh"
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Addons
RUN <<EOS
 #Addons
 #https://github.com/Azathothas/Arsenal/blob/main/misc/Linux/Debian/install_bb_tools_x86_64.sh
 curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/Debian/install_bb_tools_x86_64.sh" -o "./tools.sh"
 dos2unix --quiet "./tools.sh"
 bash "./tools.sh" 2>/dev/null || true ; rm -rf "./tools.sh"
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Display & x11 :: https://github.com/puppeteer/puppeteer/issues/8148
RUN <<EOS
 #x11 & display server
  echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
  DEBIAN_FRONTEND=noninteractive apt-get update -y && apt install dbus-x11 fonts-ipafont-gothic fonts-freefont-ttf gtk2-engines-pixbuf imagemagick libxss1 xauth xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable x11-apps xorg xvfb -y --ignore-missing
 #Re
  echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
  DEBIAN_FRONTEND=noninteractive apt-get update -y && apt install dbus-x11 fonts-ipafont-gothic fonts-freefont-ttf gtk2-engines-pixbuf imagemagick libxss1 xauth xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable x11-apps xorg xvfb -y --ignore-missing
 #Configure
  touch "$HOME/.Xauthority"
 #To start: (-ac --> disable access control restrictions)
 #Xvfb -ac ":0" & 
 # export DISPLAY=":0" && google-chrome
EOS
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Enable SSH & SSH Service
RUN <<EOS
  ##Install SSH
  apt-get update -y && apt-get install openssh-server -y
  #Config
  mkdir -p "/home/admin/.ssh"
  mkdir -p "/run/sshd"
  touch "/var/log/auth.log" "/var/log/btmp" 2>/dev/null || true
  chown "admin:admin" "/home/admin/.ssh"
  #Generate-Keys
  echo "yes" | ssh-keygen -N "" -t "ecdsa" -b 521 -f "/etc/ssh/ssh_host_ecdsa_key"
  cp "/etc/ssh/ssh_host_ecdsa_key" "$HOME/.ssh/id_ecdsa"
  cp "/etc/ssh/ssh_host_ecdsa_key.pub" "$HOME/.ssh/id_ecdsa.pub"
  echo "yes" | ssh-keygen -N "" -t "ed25519" -f "/etc/ssh/ssh_host_ed25519_key"
  cp "/etc/ssh/ssh_host_ed25519_key" "$HOME/.ssh/id_ed25519"
  cp "/etc/ssh/ssh_host_ed25519_key.pub" "$HOME/.ssh/id_ed25519.pub"
  echo "yes" | ssh-keygen -N "" -t "rsa" -b 4096 -f "/etc/ssh/ssh_host_rsa_key"
  cp "/etc/ssh/ssh_host_rsa_key" "$HOME/.ssh/id_rsa"
  cp "/etc/ssh/ssh_host_rsa_key.pub" "$HOME/.ssh/id_rsa.pub"
  #sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' "/etc/ssh/sshd_config"
  #sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication yes/' "/etc/ssh/sshd_config"
  curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Linux/sshd_config" -o "/etc/ssh/sshd_config"
EOS
RUN service ssh restart || true
EXPOSE 22
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Install TailScale
RUN <<EOS
  ##Install TailScale [pkg]
  #set +e
  systemctl daemon-reexec || true
  systemctl daemon-reload || true
  curl -qfsSL "https://tailscale.com/install.sh" -o "./tailscale.sh"
  dos2unix --quiet "./tailscale.sh"
  bash "./tailscale.sh" -s -- -h >/dev/null 2>&1 || true ; rm -rf "./tailscale.sh"
  systemctl -l --type "service" --all | grep -i "tailscale" || true
EOS
#RUN service tailscaled restart || true
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
# Set systemd as entrypoint.
ENTRYPOINT [ "/sbin/init" ]
#------------------------------------------------------------------------------------#
