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
  # dsa
  echo "yes" | sudo ssh-keygen -N "" -t "dsa" -f "/etc/ssh/ssh_host_dsa_key" || echo "yes" | ssh-keygen -N "" -t dsa -f "$HOME/.ssh/ssh_host_dsa_key"
  # ecdsa
  echo "yes" | sudo ssh-keygen -N "" -t "ecdsa" -b 521 -f "/etc/ssh/ssh_host_ecdsa_key" || echo "yes" | ssh-keygen -N "" -t ecdsa -b 521 -f "$HOME/.ssh/ssh_host_ecdsa_key"
  # ed25519
  echo "yes" | sudo ssh-keygen -N "" -t "ed25519" -f "/etc/ssh/ssh_host_ed25519_key" || echo "yes" | ssh-keygen -N "" -t ed25519 -f "$HOME/.ssh/ssh_host_ed25519_key"
  # creates id_rsa (ssh_host_rsa_key) & id_rsa.pub (ssh_host_rsa_key.pub)
  echo "yes" | sudo ssh-keygen -N "" -t "rsa" -b 4096 -f "/etc/ssh/ssh_host_rsa_key" || echo "yes" | ssh-keygen -N "" -t rsa -b 4096 -f "$HOME/.ssh/ssh_host_rsa_key"
  #sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' "/etc/ssh/sshd_config"
  sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication yes/' "/etc/ssh/sshd_config"
EOS
RUN service ssh restart || true
EXPOSE 22
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
# Set systemd as entrypoint.
ENTRYPOINT [ "/sbin/init"]
#------------------------------------------------------------------------------------#
