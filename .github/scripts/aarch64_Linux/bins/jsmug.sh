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
SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "$SKIP_BUILD" == "NO" ]; then
      #jsmug : JSON Smuggling technique to smuggle arbitrary files through JSON
      #https://grimminck.medium.com/json-smuggling-a-far-fetched-intrusion-detection-evasion-technique-51ed8f5ee05f
     export BIN="jsmug" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/xscorp/jsmug" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/xscorp/jsmug" && cd "./jsmug"
       export ZIG_LIBC_TARGET="aarch64-linux-musl"
       export CC="zig cc -target $ZIG_LIBC_TARGET"
       export CXX="zig c++ -target $ZIG_LIBC_TARGET"
       export DLLTOOL="zig dlltool"
       export HOST_CC="zig cc -target $ZIG_LIBC_TARGET"
       export HOST_CXX="zig c++ -target $ZIG_LIBC_TARGET"
       export OBJCOPY="zig objcopy"
       export RANLIB="zig ranlib"
       export CFLAGS="-O2 -flto=auto -static -w -pipe ${CFLAGS}"
       export CXXFLAGS="${CFLAGS}"
       export LDFLAGS="-static -s -Wl,-S -Wl,--build-id=none ${LDFLAGS}"
       #Compile
       zig cc -target "aarch64-linux-musl" "./jsmug.c" -o "./jsmug"
       strip "./jsmug" ; file "./jsmug" && du -sh "./jsmug"
       cp "./jsmug" "$BINDIR/jsmug" ; popd >/dev/null 2>&1
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