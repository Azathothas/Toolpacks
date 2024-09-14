#!/usr/bin/env bash
##
# source <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/scripts/arm64_v8a_Android/env.sh")
##

#-------------------------------------------------------#
USER="$(whoami)" && export USER="$USER"
HOME="$(getent passwd $USER | cut -d: -f6)" && export HOME="$HOME"
export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.cargo/env:$HOME/.go/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/miniconda3/bin:$HOME/miniconda3/condabin:/usr/local/zig:/usr/local/zig/lib:/usr/local/zig/lib/include:/usr/local/musl/bin:/usr/local/musl/lib:/usr/local/musl/include:$PATH"
SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
TMPDIRS="mktemp -d --tmpdir=$SYSTMP/toolpacks XXXXXXX_android_arm64_v8a" && export TMPDIRS="$TMPDIRS"
rm -rf "$SYSTMP/toolpacks" 2>/dev/null ; mkdir -p "$SYSTMP/toolpacks"
BINDIR="$SYSTMP/toolpack_arm64_v8a_Android" && export BINDIR="$BINDIR"
rm -rf "$BINDIR" 2>/dev/null ; rm -rf "$BINDIR.7z" 2>/dev/null ; mkdir -p "$BINDIR"
BASEUTILSDIR="$SYSTMP/baseutils_arm64_v8a" && export BASEUTILSDIR="$BASEUTILSDIR"
rm -rf "$BASEUTILSDIR" 2>/dev/null ; rm -rf "$BASEUTILSDIR.7z" 2>/dev/null ; mkdir -p "$BASEUTILSDIR"
export GIT_TERMINAL_PROMPT="0"
export GIT_ASKPASS="/bin/echo"
EGET_TIMEOUT="timeout -k 1m 2m" && export EGET_TIMEOUT="$EGET_TIMEOUT"
EGET_EXCLUDE="--asset \"^386\" --asset \"^amd\" --asset \"^apple\" --asset \"^AppImage\" --asset \"^asc\" --asset \"^crt\" --asset \"^darwin\" --asset \"^deb\" --asset \"^exe\" --asset \"^freebsd\" --asset \"^gnueabi\"  --asset \"^i686\" --asset \"^mac\" --asset \"^mips\" --asset \"^rpm\" --asset \"^sbom\" --asset \"^sha\" --asset \"^solaris\" --asset \"^sig\" --asset \"^symbol\" --asset \"^v7\" --asset \"^windows\" --asset \"^x86\"" && export EGET_EXCLUDE="$EGET_EXCLUDE"
USER_AGENT="$(curl -qfsSL 'https://pub.ajam.dev/repos/Azathothas/Wordlists/Misc/User-Agents/ua_chrome_macos_latest.txt')" && export USER_AGENT="$USER_AGENT" 
TMPDIRS="mktemp -d --tmpdir=$SYSTMP/toolpacks XXXXXXX_android_arm64_v8a" && export TMPDIRS="$TMPDIRS"
rm -rf "$SYSTMP/toolpacks" 2>/dev/null ; mkdir -p "$SYSTMP/toolpacks"
TOOLPACKS_NDK_HOME="$(grep ^ANDROID_NDK_HOME= "$SYSTMP/ndk.log" | awk -F '=' '{print $2}' | tr -d "'" | tr -d '[:space:]')" && export TOOLPACKS_NDK_HOME="${TOOLPACKS_NDK_HOME}"
TOOLPACKS_NDK_ROOT="$(grep ^ANDROID_NDK_ROOT= "$SYSTMP/ndk.log" | awk -F '=' '{print $2}' | tr -d "'" | tr -d '[:space:]')" && export TOOLPACKS_NDK_ROOT="${TOOLPACKS_NDK_ROOT}"
TOOLPACKS_NDK_TOOLCHAIN_ROOT="$(grep ^ANDROID_NDK_TOOLCHAIN_ROOT= "$SYSTMP/ndk.log" | awk -F '=' '{print $2}' | tr -d "'" | tr -d '[:space:]')" && export TOOLPACKS_NDK_TOOLCHAIN_ROOT="${TOOLPACKS_NDK_TOOLCHAIN_ROOT}"
export ANDROID_HOME="${TOOLPACKS_NDK_HOME}"
export ANDROID_NDK_HOME="${TOOLPACKS_NDK_HOME}"
export ANDROID_NDK_ROOT="${TOOLPACKS_NDK_ROOT}"
export ANDROID_NDK_TOOLCHAIN_ROOT="${TOOLPACKS_NDK_TOOLCHAIN_ROOT}"
export ANDROID_NDK_TOOLCHAIN_BIN="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin"
export ANDROID_NDK_SYSROOT="${ANDROID_NDK_TOOLCHAIN_ROOT}/sysroot"
export ANDROID_NDK_CC="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang"
export ANDROID_NDK_CXX="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang++"
export ANDROID_NDK_CPP="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang -E"
export ANDROID_NDK_LD="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/ld.lld"
export ANDROID_NDK_AS="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-as"
export ANDROID_NDK_AR="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-ar"
export ANDROID_NDK_NM="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-nm"
export ANDROID_NDK_SIZE="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-size"
export ANDROID_NDK_STRIP="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-strip"
export ANDROID_NDK_RANLIB="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-ranlib"
export ANDROID_NDK_STRINGS="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-strings"
export ANDROID_NDK_OBJDUMP="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-objdump"
export ANDROID_NDK_OBJCOPY="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-objcopy"
export ANDROID_NDK_READELF="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-readelf"
export TOOLPACKS_ANDROID_APILEVEL_DYNAMIC="android-21"
TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X="$(echo ${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC} | sed 's/-//g' | tr -d '[:space:]')" && export TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X="${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X}"
export TOOLPACKS_ANDROID_APILEVEL_STATIC="android-34"
TOOLPACKS_ANDROID_APILEVEL_STATIC_X="$(echo ${TOOLPACKS_ANDROID_APILEVEL_STATIC} | sed 's/-//g' | tr -d '[:space:]')" && export TOOLPACKS_ANDROID_APILEVEL_STATIC_X="${TOOLPACKS_ANDROID_APILEVEL_STATIC_X}"
export TOOLPACKS_ANDROID_ABI="arm64-v8a"
export TOOLPACKS_ANDROID_BUILD_DYNAMIC="${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC}-${TOOLPACKS_ANDROID_ABI}"
export TOOLPACKS_ANDROID_BUILD_STATIC="${TOOLPACKS_ANDROID_APILEVEL_STATIC}-${TOOLPACKS_ANDROID_ABI}"
BUILD="YES" && export BUILD="$BUILD"
sudo groupadd docker 2>/dev/null ; sudo usermod -aG docker "$USER" 2>/dev/null
if ! sudo systemctl is-active --quiet docker; then
   sudo service docker restart >/dev/null 2>&1 ; sleep 10
fi
sudo systemctl status "docker.service" --no-pager
#Nix
source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
#sg docker newgrp "$(id -gn)"
cd "$HOME" ; clear
##Sanity Checks
if [[ ! -n "$GITHUB_TOKEN" ]]; then
   echo -e "\n[-] GITHUB_TOKEN is NOT Exported"
   echo -e "Export it to avoid ratelimits\n"
fi
#rclone
if command -v rclone &> /dev/null; then
     if [ -s "$HOME/.rclone.conf" ] && [ ! -s "$HOME/.config/rclone/rclone.conf" ]; then
         mkdir -p "$HOME/.config/rclone" && touch "$HOME/.config/rclone/rclone.conf"
         cat "$HOME/.rclone.conf" > "$HOME/.config/rclone/rclone.conf"
         dos2unix --quiet "$HOME/.config/rclone/rclone.conf"
     elif [ -s "$HOME/.config/rclone/rclone.conf" ]; then
        dos2unix --quiet "$HOME/.config/rclone/rclone.conf"
     else
       echo -e "\n[-] rClone Config Not Found\n"
     fi
   ##ENV VARS
     export RCLONE_STATS="120s"
else
    echo -e "\n[-] rclone is NOT Installed"
     if [ -s "$HOME/.rclone.conf" ]; then
       echo -e "rClone Config --> "$HOME/.rclone.conf"\n"
     elif [ -s "$HOME/.config/rclone/rclone.conf" ]; then
       echo -e "rClone Config --> "$HOME/.config/rclone/rclone.conf"\n"
     else
       echo -e "[-] rClone Config Not Found\n"
     fi
fi
#-------------------------------------------------------#