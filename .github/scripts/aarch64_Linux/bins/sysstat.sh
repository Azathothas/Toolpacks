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
      #sysstat : Performance monitoring tools for Linux 
     export BIN="sysstat" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/sysstat/sysstat" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/sysstat/sysstat" && cd "./sysstat"
       export ZIG_LIBC_TARGET="x86_64-linux-musl"
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
       #Build
       bash "./configure" --enable-lto --enable-clean-sa-dir --enable-install-cron --enable-use-crond --enable-collect-all  
       make CFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" CXXFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" LDFLAGS="$LDFLAGS ${ADDITIONAL_ARGS}" --jobs="$(($(nproc)+1))" --keep-going
       #Tests
       "../tests/testsuite"
       #Copy
       file "./cifsiostat" && du -sh "./cifsiostat" && cp "./cifsiostat" "$BINDIR/cifsiostat"
       file "./iostat" && du -sh "./iostat" && cp "./iostat" "$BINDIR/iostat"
       file "./mpstat" && du -sh "./mpstat" && cp "./mpstat" "$BINDIR/mpstat"
       file "./pidstat" && du -sh "./pidstat" && cp "./pidstat" "$BINDIR/pidstat"
       file "./sa1" && du -sh "./sa1" && cp "./sa1" "$BINDIR/sa1"
       file "./sa2" && du -sh "./sa2" && cp "./sa2" "$BINDIR/sa2"
       file "./sadc" && du -sh "./sadc" && cp "./sadc" "$BINDIR/sadc"
       file "./sadf" && du -sh "./sadf" && cp "./sadf" "$BINDIR/sadf"
       file "./sar" && du -sh "./sar" && cp "./sar" "$BINDIR/sar"
       file "./sysstat" && du -sh "./sysstat" && cp "./sysstat" "$BINDIR/sysstat"
       file "./tapestat" && du -sh "./tapestat" && cp "./tapestat" "$BINDIR/tapestat"
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