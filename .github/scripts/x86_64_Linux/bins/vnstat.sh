#!/usr/bin/env bash

#-------------------------------------------------------#
#Sanity Checks
if [ "${BUILD}" != "YES" ] || \
   [ -z "${BINDIR}" ] || \
   [ -z "${EGET_EXCLUDE}" ] || \
   [ -z "${EGET_TIMEOUT}" ] || \
   [ -z "${GIT_TERMINAL_PROMPT}" ] || \
   [ -z "${GIT_ASKPASS}" ] || \
   [ -z "${GITHUB_TOKEN}" ] || \
   [ -z "${SYSTMP}" ] || \
   [ -z "${TMPDIRS}" ]; then
 #exit
  echo -e "\n[+]Skipping Builds...\n"
  exit 1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Main
SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "${SKIP_BUILD}" == "NO" ]; then
    #vnstat : a network traffic monitor for Linux and BSD
     export BIN="vnstat" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/vergoh/vnstat" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      #Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" --pull="always" "azathothas/alpine-builder:latest" \
        sh -c '
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins"
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/vergoh/vnstat" && cd "./vnstat"
         export CFLAGS="-O2 -flto=auto -static -w -pipe"
         export CXXFLAGS="${CFLAGS}" ; export CPPFLAGS="${CFLAGS}"
         export LDFLAGS="-static -s -Wl,-S -Wl,--build-id=none"
         "./configure" --disable-shared --enable-static 
         make --jobs="$(($(nproc)+1))" --keep-going
        #strip & info
         strip "./vnstat" ; cp "./vnstat" "/build-bins/vnstat"
         strip "./vnstatd" ; cp "./vnstatd" "/build-bins/vnstatd"
        '
      #Copy 
       docker cp "alpine-builder:/build-bins/vnstat" "./vnstat"
       #Meta 
       file "./vnstat" && du -sh "./vnstat"
       cp "./vnstat" "$BINDIR/vnstat"
      #Services
       #https://github.com/vergoh/vnstat/blob/master/examples/systemd/vnstat.service
       #https://github.com/vergoh/vnstat/blob/master/examples/systemd/simple/vnstat.service
       #https://github.com/vergoh/vnstat/tree/master/examples/init.d/debian 
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