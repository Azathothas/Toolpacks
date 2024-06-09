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
    #pwait : Small utility to wait for a process to finish
     export BIN="pwait" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/diazona/pwait" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        sh -c '
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins"
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/diazona/pwait" && cd "./pwait"
         mkdir -p "./STATIC_BUILD"
         cmake -DCMAKE_C_FLAGS="-O2 -flto=auto -static -w -pipe" \
         -DCMAKE_EXE_LINKER_FLAGS="-static -s -Wl,-S -Wl,--build-id=none" \
         -DCMAKE_BUILD_TYPE="Release" \
         -DCMAKE_INSTALL_PREFIX="/usr" \
         -DBUILD_SHARED_LIBS="Off" \
         -GNinja \
         -B "./STATIC_BUILD"
         cmake --build "./STATIC_BUILD" -j"$(($(nproc)+1))"
        #strip & info
         strip "./STATIC_BUILD/src/pwait" ; cp "./STATIC_BUILD/src/pwait" "/build-bins/pwait"
        '
      #Copy 
       docker cp "alpine-builder:/build-bins/." "./"
       #Meta 
       file "./pwait" && du -sh "./pwait" ; cp "./pwait" "$BINDIR/pwait"
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
