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
      #libnfs : NFS client library 
     export BIN="libnfs" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/sahlberg/libnfs" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/sahlberg/libnfs" && cd "./libnfs"
       sudo apt-get install libglobus-gssapi-gsi-dev libkrb5-dev -y
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
       #Configure
       bash "./bootstrap"
       "./configure" --disable-shared --disable-werror --enable-pthread --enable-static --enable-examples --enable-utils --without-libkrb5
       #Make
       make CFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" CXXFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" LDFLAGS="$LDFLAGS ${ADDITIONAL_ARGS}" --jobs="$(($(nproc)+1))" --keep-going
       #Bins
       strip "./utils/nfs-cat" ; file "./utils/nfs-cat" && du -sh "./utils/nfs-cat" ; cp "./utils/nfs-cat" "$BINDIR/nfs-cat"
       strip "./utils/nfs-cp" ; file "./utils/nfs-cp" && du -sh "./utils/nfs-cp" ; cp "./utils/nfs-cp" "$BINDIR/nfs-cp"
       strip "./utils/nfs-ls" ; file "./utils/nfs-ls" && du -sh "./utils/nfs-ls" ; cp "./utils/nfs-ls" "$BINDIR/nfs-ls"
       strip "./utils/nfs-stat" ; file "./utils/nfs-stat" && du -sh "./utils/nfs-stat" ; cp "./utils/nfs-stat" "$BINDIR/nfs-stat"
       popd > /dev/null 2>&1
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