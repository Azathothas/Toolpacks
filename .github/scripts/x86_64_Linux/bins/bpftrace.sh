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
    #bpftrace : High-level tracing language & tool for Linux 
     export BIN="bpftrace"
     export SOURCE_URL="https://github.com/bpftrace/bpftrace"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       git clone --filter "blob:none" --quiet "https://github.com/bpftrace/bpftrace" && cd "./bpftrace"
       IMAGE="bpftrace-static" ; docker stop "$IMAGE" 2>/dev/null ; docker rm "$IMAGE" ; docker rmi "$IMAGE"
       docker build -t "$IMAGE" -f "docker/Dockerfile.static" docker/
       docker run --privileged --net="host" --name "$IMAGE" -v "$(pwd):$(pwd)" -w "$(pwd)" -i "$IMAGE" sh -c '
        #Setup ENV
         mkdir -p "/build-bins"
         apk update && apk upgrade --no-interactive 2>/dev/null
         apk add bash --latest --upgrade --no-interactive 2>/dev/null
         apk add coreutils --latest --upgrade --no-interactive 2>/dev/null
         apk add file --latest --upgrade --no-interactive 2>/dev/null
         apk add grep --latest --upgrade --no-interactive 2>/dev/null
         apk add moreutils --latest --upgrade --no-interactive 2>/dev/null
         apk add rsync --latest --upgrade --no-interactive 2>/dev/null
         apk add util-linux --latest --upgrade --no-interactive 2>/dev/null
         #Main Libs: https://github.com/bpftrace/bpftrace/blob/master/.github/include/static.sh
         BUILD_DIR="STATIC_BUILD"
         cmake -DCMAKE_BUILD_TYPE="Release" \
         -DCMAKE_VERBOSE_MAKEFILE="ON" \
         -DBUILD_TESTING="OFF" \
         -DSTATIC_LINKING="ON" \
         -B "./STATIC_BUILD"
         make -C "./STATIC_BUILD" -j"$(($(nproc)+1))" all
         #Main Binary
         cmake -DCMAKE_C_FLAGS="-O2 -flto=auto -static -w -pipe" \
         -DCMAKE_EXE_LINKER_FLAGS="-static -s -Wl,-S -Wl,--build-id=none" \
         -DCMAKE_BUILD_TYPE="Release" \
         -DIS_MUSL="ON" \
         -DBUILD_SHARED_LIBS="Off" \
         -DSTATIC_LINKING="ON" \
         -DBUILD_TESTING="OFF" \
         -DCMAKE_VERBOSE_MAKEFILE="ON" \
         -B "./STATIC_BUILD"
         make -C "./STATIC_BUILD" -j"$(($(nproc)+1))" all
         #copy
         find "./STATIC_BUILD/src/" -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath | xargs -I {} cp --force {} /build-bins/
         '
      #Copy
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker cp "$IMAGE:/build-bins/." "$(pwd)/"
       #Meta
       file "./bpftrace" && du -sh "./bpftrace" ; cp "./bpftrace" "$BINDIR/bpftrace"
      #Delete Containers
       docker stop "$IMAGE" 2>/dev/null ; docker rm "$IMAGE" 2>/dev/null
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