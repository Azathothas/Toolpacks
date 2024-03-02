# syntax=docker/dockerfile:1
#------------------------------------------------------------------------------------#
#Ubuntu 22.04 LTS :: https://wiki.ubuntu.com/Releases
# Based on :: https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/ubuntu-systemd-base.dockerfile
# Preconfigured with: Systemd + SSHD + Docker
# REF :: https://docs.docker.com/engine/reference/builder/
# LINT :: https://github.com/hadolint/hadolint
## Note :: NO SPACE after EOS using heredoc `EOS` to write multiline scripts
#FROM nestybox/ubuntu-jammy-systemd-docker:latest
# URL: https://hub.docker.com/r/azathothas/gh-runner-aarch64-ubuntu
FROM azathothas/ubuntu-systemd-base:latest
#------------------------------------------------------------------------------------#
##Base Deps
ENV DEBIAN_FRONTEND="noninteractive"
RUN <<EOS
  apt-get update -y
  apt-get install -y apt-transport-https apt-utils bash ca-certificates coreutils curl git gnupg2 jq locales moreutils nano software-properties-common sudo tmux unzip util-linux xz-utils wget zip
  rm -rf /var/lib/apt/list/* 2>/dev/null
EOS
##Switch to bash
#SHELL ["/bin/bash"]
#------------------------------------------------------------------------------------#
##Addons
RUN <<EOS
# Eget for simplified releases
  echo "$PATH"
  wget --quiet --show-progress "https://bin.ajam.dev/aarch64_arm64_Linux/eget" -O "/usr/local/bin/eget"
  chmod +xwr "/usr/local/bin/eget"
  eget -h && eget --rate
 #croc:https://github.com/schollz/croc
  eget "https://bin.ajam.dev/aarch64_arm64_Linux/croc" --to "/usr/local/bin/croc"
EOS
#ENV GITHUB_TOKEN="$GITHUB_PERSONAL_TOKEN"
RUN eget --rate
#----------------#
##Build Tools
RUN <<EOS
  apt-get update -y
  apt-get install -y aria2 automake bc binutils b3sum build-essential ca-certificates ccache diffutils dos2unix findutils gawk lzip jq libtool libtool-bin make musl musl-dev musl-tools p7zip-full rsync texinfo wget xz-utils
  apt-get install python3 -y
EOS
#------------------------------------------------------------------------------------#
##Add and config runner user as sudo
# Remove default admin user
# https://github.com/nestybox/dockerfiles/blob/master/ubuntu-focal-systemd/Dockerfile
RUN <<EOS
 #Add runner
  useradd -m runner
 #Add runner to sudo 
  usermod -aG sudo runner
 #Add runner to docker 
  usermod -aG docker runner
 #Passwordless sudo for runner 
  echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > "/etc/sudoers"
 #Remove preconfigured admin user
  userdel -r admin
EOS
##Change Default shell for runner to bash
RUN <<EOS
 #Check current shell
  grep runner "/etc/passwd"
 #Change to bash 
  usermod --shell "/bin/bash" runner 2>/dev/null
 #Recheck 
  grep runner "/etc/passwd"
EOS
#------------------------------------------------------------------------------------#
# Build args
#ARG TARGETPLATFORM=arm64
#ARG RUNNER_VERSION=2.313.0
#------------------------------------------------------------------------------------#
##Download Runner Script
# https://github.com/actions/runner/releases
WORKDIR /runner
RUN <<EOS
 #Get latest source
  eget "https://github.com/actions/runner" --asset "linux" --asset "arm64" --asset "tar.gz" --to "./runner.tar.gz" --download-only 
 #Untar
  tar xzf "./runner.tar.gz" && rm "./runner.tar.gz"
 #Run Install 
  chmod +xwr "./bin/installdependencies.sh" && bash "./bin/installdependencies.sh"
 #Remove cache 
  rm -rf /var/lib/apt/lists/* 2>/dev/null
EOS
#Copy startup script
COPY "./startup.sh" "/usr/local/bin/startup.sh"
RUN chmod +xwr "/usr/local/bin/startup.sh"
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##systemctl
RUN <<EOS
 #System has not been booted with systemd as init system (PID 1). Can't operate.
 #Failed to connect to bus: Host is down
 #Replace with patched
  apt-get install python3 -y
  curl -qfsSL "https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py" -o "$(which systemctl)"
  mkdir -p "/var/run/dbus" ; dbus-daemon --config-file="/usr/share/dbus-1/system.conf" --print-address
 #Start DBUS
  service dbus start
EOS
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
##s6-overlays & Init
RUN <<EOS
 #Deps
  apt-get update -y && apt-get install -y nginx xz-utils
 #Switch to temp
  cd "$(mktemp -d)" > /dev/null 2>&1
 #Get latest Tars 
 #s6-overlay scripts
  eget "https://github.com/just-containers/s6-overlay" --asset "s6-overlay-noarch.tar.xz" --to "./s6-overlay-noarch.tar.xz" --download-only
 #s6-overlay binaries
  eget "https://github.com/just-containers/s6-overlay" --asset "s6-overlay-aarch64.tar.xz" --to "./s6-overlay-aarch64.tar.xz" --download-only
 #/usr/bin symlinks for s6-overlay scripts
  eget "https://github.com/just-containers/s6-overlay" --asset "s6-overlay-symlinks-noarch.tar.xz" --to "./s6-overlay-symlinks-noarch.tar.xz" --download-only
 #syslogd emulation
  eget "https://github.com/just-containers/s6-overlay" --asset "syslogd-overlay-noarch.tar.xz" --to "./syslogd-overlay-noarch.tar.xz" --download-only
 #Extract to /
  find -type f -name "*tar.xz" -exec tar -C / -Jvxpf {} \; 2>/dev/null
 #End
  cd - > /dev/null 2>&1
EOS
#https://github.com/just-containers/s6-overlay?tab=readme-ov-file#customizing-s6-overlay-behaviour
#Preserve env vars & pass on further 
ENV S6_KEEP_ENV="1"
# 2 --> Service start/stop + warnings+errors [0 :: errors || 1 :: warnings+errors] (Max: 5)
ENV S6_VERBOSITY="2"
# Output only cmd stdout/stderr
ENV S6_LOGGING="1"
# Wait for services before running CMD
ENV S6_CMD_WAIT_FOR_SERVICES="1"
# Wait 30s (30k ms) for services to start
ENV S6_CMD_WAIT_FOR_SERVICES_MAXTIME="30000"
# Wait 30s for services to stop
ENV S6_SERVICES_GRACETIME="30000"
# Wait 1s to send KILL Signal to services
ENV S6_KILL_GRACETIME="1"
#Start
ENTRYPOINT ["/init"]
USER runner
#------------------------------------------------------------------------------------#

# #------------------------------------------------------------------------------------#
# ##Dumb Init
# RUN <<EOS
#  #Get latest
#   eget "https://github.com/Yelp/dumb-init" --asset "aarch64" --asset "^deb" --to "/usr/local/bin/dumb-init"
#  #Perms
#   chmod +x "/usr/local/bin/dumb-init"
# EOS
# #Start
# USER runner
# ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
# #------------------------------------------------------------------------------------#

#----------------#
#Start
CMD ["/usr/local/bin/startup.sh"]
#------------------------------------------------------------------------------------#
