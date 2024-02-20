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
  apt-get update -y
  apt-get install -y apt-transport-https apt-utils bash ca-certificates coreutils curl git gnupg2 jq locales moreutils nano software-properties-common sudo tmux unzip util-linux xz-utils wget zip
EOS
#------------------------------------------------------------------------------------#
##Systemd installation
RUN <<EOS
  apt-get update -y
  apt-get install -y --no-install-recommends dbus iptables iproute2 libsystemd0 kmod systemd systemd-sysv udev
 #Prevents journald from reading kernel messages from /dev/kmsg
  echo "ReadKMsg=no" >> "/etc/systemd/journald.conf"
 #Disable systemd services/units that are unnecessary within a container.
  systemctl mask systemd-udevd.service
  systemctl systemd-udevd-kernel.socket
  systemctl systemd-udevd-control.socket
  systemctl systemd-modules-load.service
  systemctl sys-kernel-debug.mount
  systemctl sys-kernel-tracing.mount
 #Housekeeping
  apt-get clean -y
  rm -rf /usr/share/doc/* 2>/dev/null
  rm -rf /usr/share/local/* 2>/dev/null
  rm -rf /usr/share/man/* 2>/dev/null
  rm -rf /var/cache/debconf/* 2>/dev/null
  rm -rf /var/lib/apt/lists/* 2>/dev/null
  rm -rf /var/log/* 2>/dev/null
  rm -rf /var/tmp/* 2>/dev/null
  rm -rf /tmp/* 2>/dev/null
 #Create default 'admin/admin' user
  useradd --create-home --shell /bin/bash admin && echo "admin:admin" | chpasswd && adduser admin sudo  
EOS
# Make use of stopsignal (instead of sigterm) to stop systemd containers.
STOPSIGNAL SIGRTMIN+3
#------------------------------------------------------------------------------------#
 
#------------------------------------------------------------------------------------#
##Install Docker
RUN <<EOS
  rm -rf /var/lib/apt/lists/*
  cd "$(mktemp -d)" > /dev/null 2>&1 
  curl -qfsSL "https://get.docker.com" -o "./get-docker.sh" && sh "./get-docker.sh"
  cd - > /dev/null 2>&1
 #Add user "admin" to the Docker group
  usermod -a -G docker admin
 #Add Docker Completions
  curl -qfsSL "https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker" > "/etc/bash_completion.d/docker.sh"
EOS
#------------------------------------------------------------------------------------#
##Install Sshd
RUN <<EOS
  apt-get update && apt-get install --no-install-recommends -y openssh-server
  rm -rf /var/lib/apt/lists/* 2>/dev/null
  mkdir "/home/admin/.ssh"
  chown "admin:admin" "/home/admin/.ssh"
EOS
EXPOSE 22
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
# Set systemd as entrypoint.
ENTRYPOINT [ "/sbin/init"]
#------------------------------------------------------------------------------------#