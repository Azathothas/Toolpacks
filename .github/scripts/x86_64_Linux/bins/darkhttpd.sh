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
      #darkhttpd : Standalone, Minimal HTTP Server
     export BIN="darkhttpd" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/emikulic/darkhttpd" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/emikulic/darkhttpd" && cd "./darkhttpd"
       export ZIG_LIBC_TARGET="x86_64-linux-musl"
       unset CC && export CC="zig cc -target $ZIG_LIBC_TARGET"
       unset CXX && export CXX="zig c++ -target $ZIG_LIBC_TARGET"
       unset DLLTOOL && export DLLTOOL="zig dlltool"
       unset HOST_CC && export HOST_CC="zig cc -target $ZIG_LIBC_TARGET"
       unset HOST_CXX && export HOST_CXX="zig c++ -target $ZIG_LIBC_TARGET"
       unset OBJCOPY && export OBJCOPY="zig objcopy"
       unset RANLIB && export RANLIB="zig ranlib"
       unset CFLAGS && export CFLAGS="-O2 -flto=auto -static -w -pipe ${CFLAGS}"
       unset CXXFLAGS && export CXXFLAGS="${CFLAGS}"
       unset LDFLAGS && export LDFLAGS="-static -s -Wl,-S -Wl,--build-id=none ${LDFLAGS}"
       #If no zig
       make CFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" CXXFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" LDFLAGS="$LDFLAGS ${ADDITIONAL_ARGS}" --jobs="$(($(nproc)+1))" --keep-going all
       strip "./darkhttpd" ; file "./darkhttpd" && du -sh "./darkhttpd"
       mv "./darkhttpd" "$BINDIR/darkhttpd" ; popd > /dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
#-------------------------------------------------------#