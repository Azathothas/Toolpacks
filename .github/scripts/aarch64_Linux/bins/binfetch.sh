#!/usr/bin/env bash

#-------------------------------------------------------#
#Sanity Checks
if [ "$BUILD" != "YES" ] || \
   [ -z "$BINDIR" ] || \
   [ -z "$EGET_EXCLUDE" ] || \
   [ -z "$EGET_TIMEOUT" ] || \
   [ -z "$GIT_TERMINAL_PROMPT" ] || \
   [ -z "$GIT_ASKPASS" ] || \
   [ -z "$GITHUB_TOKEN" ] || \
   [ -z "$SYSTMP" ] || \
   [ -z "$TMPDIRS" ]; then
 #exit
  echo -e "\n[+]Skipping Builds...\n"
  exit 1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Main
export SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "$SKIP_BUILD" == "NO" ]; then
     #binfetch : neofetch for binaries
     export BIN="binfetch" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/Im-0xea/binfetch" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/Im-0xea/binfetch" && cd "./binfetch"
       #Install Deps
       sudo apt-get install libconfuse-common libconfuse-dev libelf-dev meson -y
       #https://mesonbuild.com/Builtin-options.html
       meson setup --buildtype="release" --default-library="static" --prefer-static -Ddebug="false" -Db_lto="true" -Db_pie="true" -Db_staticpic="true" --strip --reconfigure --wipe --clearcache "./build" "./"
       ninja -C "./build"
       file "./build/binfetch" && ldd "./build/binfetch" ; cp "./build/binfetch" "$BINDIR/binfetch"
       #Requires cfg
       curl -qfsSL "https://raw.githubusercontent.com/Im-0xea/binfetch/main/cfg/binfetch.cfg" -o "$BINDIR/binfetch.cfg"
       #mkdir -p "$HOME/.config/binfetch" && curl -qfsSL "https://raw.githubusercontent.com/Im-0xea/binfetch/main/cfg/binfetch.cfg" -o "$HOME/.config/binfetch/binfetch.cfg"
       #mkdir -p "$HOME/.config/binfetch" && curl -qfsSL "https://raw.githubusercontent.com/Im-0xea/binfetch/main/cfg/emby.cfg" -o "$HOME/.config/binfetch/binfetch.cfg"
       #mkdir -p "$HOME/.config/binfetch" && curl -qfsSL "https://raw.githubusercontent.com/Im-0xea/binfetch/main/cfg/rainbow.cfg" -o "$HOME/.config/binfetch/binfetch.cfg"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
unset SKIP_BUILD ; export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS LIBS OBJCOPY RANLIB
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#