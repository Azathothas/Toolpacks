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
    #wireguard-tools : tools for configuring WireGuard
     export BIN="wg" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://git.zx2c4.com/wireguard-tools" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        sh -c '
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins"
        #Build
         git clone --filter "blob:none" --quiet "https://git.zx2c4.com/wireguard-tools" && cd "./wireguard-tools/src"
         export ZIG_LIBC_TARGET="aarch64-linux-musl"
         export CC="zig cc -target $ZIG_LIBC_TARGET"
         export CXX="zig c++ -target $ZIG_LIBC_TARGET"
         export DLLTOOL="zig dlltool"
         export HOST_CC="zig cc -target $ZIG_LIBC_TARGET"
         export HOST_CXX="zig c++ -target $ZIG_LIBC_TARGET"
         export OBJCOPY="zig objcopy"
         export RANLIB="zig ranlib"
         export CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe"
         export CXXFLAGS="${CFLAGS}"
         export CPPFLAGS="${CFLAGS}"
         export LDFLAGS="-static -static-pie -pie -s -Wl,-S -Wl,--build-id=none"
         make --jobs="$(($(nproc)+1))" --keep-going
        #strip & info
         strip "./wg" ; "./wg" --version
         cp "./wg" "/build-bins/wg"
         cp "./wg-quick/linux.bash" "/build-bins/wg-quick"
        '
      #Copy 
       docker cp "alpine-builder:/build-bins/wg" "./wg"
       docker cp "alpine-builder:/build-bins/wg-quick" "./wg-quick"
       #Meta 
       file "./wg" && du -sh "./wg"
       cp "./wg" "$BINDIR/wg"
       cp "./wg-quick" "$BINDIR/wg-quick"
      #Delete Containers
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder"
       popd >/dev/null 2>&1
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