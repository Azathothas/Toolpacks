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
    #xdotool : Fake keyboard/mouse input, window management, and more
     export BIN="xdotool"
     export SOURCE_URL="https://github.com/jordansissel/xdotool"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
     ##Install 
      pushd "$($TMPDIRS)" >/dev/null 2>&1
      sudo apt update -y && sudo apt install xdotool -y
      sudo cp "$(which xdotool)" "./xdotool" && sudo chown -R "$(whoami):$(whoami)" "$(realpath .)" && chmod -R 755 "$(realpath .)"
      strip "./xdotool" ; staticx --loglevel DEBUG "./xdotool" --strip "$BINDIR/xdotool"
      file "$BINDIR/xdotool" ; du -sh "$BINDIR/xdotool" ; popd >/dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
unset SKIP_BUILD ; export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CPPFLAGS CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS LIBS OBJCOPY RANLIB
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#