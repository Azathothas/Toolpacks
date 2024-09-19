# syntax=docker/dockerfile:1
#------------------------------------------------------------------------------------#
#https://hub.docker.com/r/azathothas/alpine-builder-ndk
#FROM azathothas/alpine-builder:latest
FROM alpine:latest
#------------------------------------------------------------------------------------#
RUN <<EOS
 ##Update
  apk update && apk upgrade --no-interactive
  apk add autoconf binutils build-base clang clang-static cmake coreutils croc curl elfutils file gawk gcc gettext git iputils jq linux-tools make mold moreutils musl musl-dev musl-utils nano ncdu perl pkgconfig procps python3 rsync sudo tar util-linux xz zig zstd 7zip --no-interactive 2>/dev/nul
 ##Enable glibc: https://github.com/sgerrand/alpine-pkg-glibc/issues/210
  #echo 'https://storage.sev.monster/alpine/edge/testing' | tee -a "/etc/apk/repositories"
  #wget "https://storage.sev.monster/alpine/edge/testing/x86_64/sevmonster-keys-1-r0.apk"
  #apk add --allow-untrusted "./sevmonster-keys-1-r0.apk" && rm "./sevmonster-keys-1-r0.apk"
  #apk update && apk upgrade --no-interactive 
  #apk add gcompat --latest --upgrade --no-interactive
  #rm "/lib/ld-linux-x86-64.so.2" 2>/dev/null
  #apk add glibc --latest --upgrade --no-interactive --force-overwrite
  #apk add glibc-bin --latest --upgrade --no-interactive
  #apk update && apk upgrade --no-interactive
 ##Install ndk-pkg
  #Install (Stable) : https://github.com/leleliu008/ndk-pkg?tab=readme-ov-file#install-ndk-pkg-via-curl
  curl -qfsSL "https://raw.githubusercontent.com/leleliu008/ndk-pkg/master/ndk-pkg" -o "/usr/bin/ndk-pkg"
  chmod +x "/usr/bin/ndk-pkg"
  ##Install (DEV)
  ##curl -qfsSL "https://raw.githubusercontent.com/leleliu008/ndk-pkg/dev/ndk-pkg" -o "/usr/bin/ndk-pkg" && chmod +x "/usr/bin/ndk-pkg"
 ##Setup
  ndk-pkg setup
  ndk-pkg update
  ndk-pkg upgrade-self
  ndk-pkg sysinfo
  ndk-pkg formula-repo-list
  ndk-pkg formula-repo-sync "official-core"
  #curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/runners/alpine-builder-ndk.sh" -o "./setup_env.sh" && chmod +x "./setup_env.sh" && source "./setup_env.sh"
  curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/runners/alpine-builder-ndk.sh" -o "./setup_env.sh" && chmod +x "./setup_env.sh" && source "./setup_env.sh"
EOS
#------------------------------------------------------------------------------------#
##Addons
RUN <<EOS
 #dasel for toml
  curl -qfsSL "https://bin.ajam.dev/$(uname -m)/dasel" -o "/usr/bin/dasel" && chmod +x "/usr/bin/dasel"
 #Eget for simplified releases
  curl -qfsSL "https://bin.ajam.dev/$(uname -m)/eget" -o "/usr/bin/eget" && chmod +x "/usr/bin/eget"
 #Golang
  #pushd "$(mktemp -d)" >/dev/null 2>&1 && echo "yes" | bash <(curl -qfsSL "https://git.io/go-installer") && popd >/dev/null 2>&1
  cd "$(mktemp -d)" >/dev/null 2>&1
  apk del go --force --no-interactive 2>/dev/null
  curl -qfsSL "https://git.io/go-installer" -o "./install.sh" && chmod +x "./install.sh"
  echo "yes" | bash "./install.sh"
  cd - >/dev/null 2>&1
 #Mold
  apk add mold --latest --upgrade --no-interactive 2>/dev/null 
 #Rust
  apk add rustup --latest --upgrade --no-interactive 2>/dev/null ; rustup-init -y 
 #yq
  curl -qfsSL "https://bin.ajam.dev/$(uname -m)/yq" -o "/usr/bin/yq" && chmod +x "/usr/bin/yq"
EOS
#------------------------------------------------------------------------------------#
#END