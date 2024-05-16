# syntax=docker/dockerfile:1
#------------------------------------------------------------------------------------#
#https://hub.docker.com/r/azathothas/alpine-builder-ndk
FROM azathothas/alpine-builder:latest
#------------------------------------------------------------------------------------#
RUN <<EOS
 ##Update
  apk update && apk upgrade --no-interactive
 ##Enable glibc: https://github.com/sgerrand/alpine-pkg-glibc/issues/210
  echo 'https://storage.sev.monster/alpine/edge/testing' | tee -a "/etc/apk/repositories"
  wget "https://storage.sev.monster/alpine/edge/testing/x86_64/sevmonster-keys-1-r0.apk"
  apk add --allow-untrusted "./sevmonster-keys-1-r0.apk" && rm "./sevmonster-keys-1-r0.apk"
  apk update && apk upgrade --no-interactive 
  apk add gcompat --latest --upgrade --no-interactive
  rm "/lib/ld-linux-x86-64.so.2" 2>/dev/null
  apk add glibc --latest --upgrade --no-interactive --force-overwrite
  apk add glibc-bin --latest --upgrade --no-interactive
  apk update && apk upgrade --no-interactive
 ##Install ndk-pkg
  #Install (Stable) : https://github.com/leleliu008/ndk-pkg?tab=readme-ov-file#install-ndk-pkg-via-curl
  #curl -qfsSL "https://raw.githubusercontent.com/leleliu008/ndk-pkg/master/ndk-pkg" -o "/usr/bin/ndk-pkg"
  #chmod +x "/usr/bin/ndk-pkg"
  #Install (DEV)
  curl -qfsSL "https://raw.githubusercontent.com/leleliu008/ndk-pkg/dev/ndk-pkg" -o "/usr/bin/ndk-pkg" && chmod +x "/usr/bin/ndk-pkg"
 ##Setup
  ndk-pkg setup
  ndk-pkg update
  ndk-pkg sysinfo
  ndk-pkg formula-repo-list
  ndk-pkg formula-repo-sync "official-core"
  #curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/runners/alpine-builder-ndk.sh" -o "./setup_env.sh" && chmod +x "./setup_env.sh" && source "./setup_env.sh"
  curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/runners/alpine-builder-ndk.sh" -o "./setup_env.sh" && chmod +x "./setup_env.sh" && source "./setup_env.sh"
EOS
#------------------------------------------------------------------------------------#
##Addons
RUN <<EOS
 #Eget for simplified releases
  wget --quiet --show-progress "https://bin.ajam.dev/$(uname -m)/eget" -O "/usr/bin/eget"
  chmod +xwr "/usr/bin/eget"
EOS
#------------------------------------------------------------------------------------#
#END
