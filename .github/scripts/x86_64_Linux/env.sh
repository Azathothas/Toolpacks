#!/usr/bin/env bash
#source <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/scripts/$(uname -m)_Linux/env.sh")
export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.cargo/env:$HOME/.go/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/miniconda3/bin:$HOME/miniconda3/condabin:/usr/local/zig:/usr/local/zig/lib:/usr/local/zig/lib/include:/usr/local/musl/bin:/usr/local/musl/lib:/usr/local/musl/include:$PATH"
SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
TMPDIRS="mktemp -d --tmpdir=$SYSTMP/toolpacks XXXXXXX_linux_x86_64" && export TMPDIRS="$TMPDIRS"
rm -rf "$SYSTMP/toolpacks" 2>/dev/null ; mkdir -p "$SYSTMP/toolpacks"
BINDIR="$SYSTMP/toolpack_x86_64" && export BINDIR="$BINDIR"
rm -rf "$BINDIR" 2>/dev/null ; rm -rf "$BINDIR.7z" 2>/dev/null ; mkdir -p "$BINDIR"
BASEUTILSDIR="$SYSTMP/baseutils_x86_64" && export BASEUTILSDIR="$BASEUTILSDIR"
rm -rf "$BASEUTILSDIR" 2>/dev/null ; rm -rf "$BASEUTILSDIR.7z" 2>/dev/null ; mkdir -p "$BASEUTILSDIR"
export GIT_TERMINAL_PROMPT="0"
export GIT_ASKPASS="/bin/echo"
EGET_TIMEOUT="timeout -k 1m 2m" && export EGET_TIMEOUT="$EGET_TIMEOUT"
EGET_EXCLUDE="--asset \"^386\" --asset \"^aarch64\" --asset \"^apple\" --asset \"^arm\" --asset \"^AppImage\" --asset \"^asc\" --asset \"^crt\" --asset \"^darwin\" --asset \"^deb\" --asset \"^exe\" --asset \"^freebsd\" --asset \"^i686\" --asset \"^mac\" --asset \"^mips\" --asset \"^rpm\" --asset \"^pem\" --asset \"^sbom\" --asset \"^sha\" --asset \"^solaris\" --asset \"^sig\" --asset \"^symbol\" --asset \"^windows\"" && export EGET_EXCLUDE="$EGET_EXCLUDE"
USER_AGENT="$(curl -qfsSL 'https://pub.ajam.dev/repos/Azathothas/Wordlists/Misc/User-Agents/ua_chrome_macos_latest.txt')" && export USER_AGENT="$USER_AGENT"
BUILD="YES" && export BUILD="$BUILD"
sudo groupadd docker 2>/dev/null ; sudo usermod -aG docker "$USER" 2>/dev/null
if ! sudo systemctl is-active --quiet docker; then
   sudo service docker restart >/dev/null 2>&1 ; sleep 10
fi
sudo systemctl status "docker.service" --no-pager
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