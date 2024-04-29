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
    #goaccess : real-time web log analyzer and interactive viewer that runs in a terminal in *nix systems or through your browser.
     export BIN="goaccess" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/allinurl/goaccess" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" > /dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        sh -c '
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins"
        #Deps
         apk update && apk upgrade --no-interactive
         apk add geoip --latest --upgrade --no-interactive
         apk add geoip-dev --latest --upgrade --no-interactive
         apk add libmaxminddb-dev --latest --upgrade --no-interactive
         apk add libmaxminddb-libs --latest --upgrade --no-interactive
         apk add libmaxminddb-static --latest --upgrade --no-interactive
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/allinurl/goaccess" && cd "./goaccess"
         export CFLAGS="-O2 -flto=auto -static -w -pipe"
         export LDFLAGS="-static -s -Wl,-S -Wl,--build-id=none"
         autoreconf -fiv ; "./configure" --disable-shared --enable-static --enable-geoip="mmdb" --enable-utf8 --with-getline --with-openssl="/usr/include/openssl"
         make CFLAGS="$CFLAGS" CXXFLAGS="$CFLAGS" CPPFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" --jobs="$(($(nproc)+1))" --keep-going
        #strip & info
         strip "./goaccess"
         cp "./goaccess" "/build-bins/goaccess"
        '
      #Copy 
       docker cp "alpine-builder:/build-bins/goaccess" "./goaccess"
       #Meta 
       file "./goaccess" && du -sh "./goaccess"
       cp "./goaccess" "$BINDIR/goaccess"
      #Delete Containers
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder"
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
