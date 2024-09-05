#!/usr/bin/env bash

#-------------------------------------------------------#
#Sanity Checks
if [ "$BUILD" != "YES" ] || \
   [ -z "$ANDROID_NDK_TOOLCHAIN_ROOT" ] || \
   [ -z "$ANDROID_NDK_TOOLCHAIN_BIN" ] || \
   [ -z "$ANDROID_NDK_SYSROOT" ] || \
   [ -z "$BINDIR" ] || \
   [ -z "$EGET_EXCLUDE" ] || \
   [ -z "$EGET_TIMEOUT" ] || \
   [ -z "$GIT_TERMINAL_PROMPT" ] || \
   [ -z "$GIT_ASKPASS" ] || \
   [ -z "$GITHUB_TOKEN" ] || \
   [ -z "$SYSTMP" ] || \
   [ -z "$TOOLPACKS_ANDROID_ABI" ] || \
   [ -z "$TOOLPACKS_ANDROID_APILEVEL_DYNAMIC" ] || \
   [ -z "$TOOLPACKS_ANDROID_APILEVEL_STATIC" ] || \
   [ -z "$TOOLPACKS_ANDROID_BUILD_DYNAMIC" ] || \
   [ -z "$TOOLPACKS_ANDROID_BUILD_STATIC" ] || \
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
    #rclone : Rsync for cloud storage
     export BIN="rclone" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/rclone/rclone" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
     #Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder-ndk:latest" \
        bash -c '
        #Setup Base ENV
         pushd "$(mktemp -d)" >/dev/null 2>&1 && mkdir -p "/build-bins"
         source "$HOME/.cargo/env" ; source "$HOME/.bashrc"
        #Setup Build ENV
         export CC="${ANDROID_NDK_TOOLCHAIN_BIN}/aarch64-linux-${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X}-clang"
         export CXX="${ANDROID_NDK_TOOLCHAIN_BIN}/aarch64-linux-${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X}-clang++"
         export CPP="${CXX}"
         export LD="${ANDROID_NDK_TOOLCHAIN_BIN}/ld.lld"
         export AS="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-as"
         export AR="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-ar"
         export NM="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-nm"
         export SIZE="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-size"
         export STRIP="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-strip"
         export RANLIB="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-ranlib"
         export STRINGS="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-strings"
         export OBJDUMP="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-objdump"
         export OBJCOPY="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-objcopy"
         export READELF="${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-readelf"
         export SYSROOT="${ANDROID_NDK_SYSROOT}"
         export ANDROID_API_LEVEL="31"
         export ANDROID_INCLUDE_DIR="${ANDROID_NDK_SYSROOT}/usr/include"
         #export ANDROID_INCLUDE_DIR="${ANDROID_NDK_SYSROOT}/usr/include/aarch64-linux-android"
         export ANDROID_LIBRARY_DIR="${ANDROID_NDK_SYSROOT}/usr/lib/aarch64-linux-android/${ANDROID_API_LEVEL}"
        #Build (Native)
         git clone --quiet --filter "blob:none" "https://github.com/rclone/rclone" && cd "./rclone"
         #rclone
         GOOS="android" GOARCH="arm64" CGO_ENABLED="1" CGO_CFLAGS="-O2 -flto=auto -fPIE -fpie -w -pipe" go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '\''-s -w -Wl,--build-id=none'\''" ; cp "./rclone" "/build-bins/rclone"
        '
      #Copy
       docker cp "alpine-builder:/build-bins/." "$(pwd)/"
       find "." -maxdepth 1 -type f ! -exec file "{}" \; | grep -v ".*executable.*aarch64" | cut -d":" -f1 | xargs -I {} rm -f "{}"
       #Meta 
       file "./rclone" && du -sh "./rclone" ; aarch64-linux-gnu-readelf -d "./rclone" | grep -i 'needed' ; cp "./rclone" "$BINDIR/rclone"
       file "./rcloned" && du -sh "./rcloned" ; aarch64-linux-gnu-readelf -d "./rcloned" | grep -i 'needed' ; cp "./rcloned" "$BINDIR/rcloned"
       file "./rclone_combined" && du -sh "./rclone_combined" ; aarch64-linux-gnu-readelf -d "./rclone_combined" | grep -i 'needed' ; cp "./rclone_combined" "$BINDIR/rclone_combined"
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
#-------------------------------------------------------#