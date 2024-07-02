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
SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "$SKIP_BUILD" == "NO" ]; then
   #pspy : Monitor linux processes without root permissions 
     export BIN="pspy" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/DominicBreuker/pspy" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Build (ndk-pkg)
       #Fetch src
        pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/DominicBreuker/pspy" && cd "./pspy"
       #Set ENV
        #export CC="$HOME/.ndk-pkg/core/wrapper-target-cc"
        export CC="${ANDROID_NDK_TOOLCHAIN_BIN}/aarch64-linux-${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X}-clang"
        #export CXX="$HOME/.ndk-pkg/core/wrapper-target-c++"
        export CXX="${ANDROID_NDK_TOOLCHAIN_BIN}/aarch64-linux-${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC_X}-clang++"
        #export CPP="$HOME/.ndk-pkg/core/wrapper-target-cc -E"
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
        #android-34 --> Android 14
        #android-33 --> Android 13
        #android-31,32 --> Android 12
        #android-30 --> Android 11
        #android-29 --> Android 10
        #android-28 --> Android 9
        #android-26,27 --> Android 8
        #android-24,25 --> Android 7
        #android-23 --> Android 6
        #android-21,22 --> Android 5
        export ANDROID_API_LEVEL="29"
        export ANDROID_LIBRARY_DIR="${ANDROID_NDK_SYSROOT}/usr/lib/aarch64-linux-android/${ANDROID_API_LEVEL}"        
       #Compile: CGO_ENABLED must be enabled to use android native libs, else things like dns etc won't work
       #Binaries compiled this way are always dynamically linked to /system/bin/linker64
        export ANDROID_TARGET="${TOOLPACKS_ANDROID_BUILD_DYNAMIC}"
        export GOOS="android"
        export GOARCH="arm64"
        export CGO_ENABLED="1"
        export CGO_CFLAGS="-O2 -flto=auto -fPIE -fpie -w -pipe"
        #go build -v -ldflags="-buildid= -s -w"
        go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '-s -w -Wl,--build-id=none'"
       #Meta 
        file "./pspy" && du -sh "./pspy" ; aarch64-linux-gnu-readelf -d "./pspy" | grep -i 'needed'
        cp "./pspy" "$BINDIR/pspy"
       #Test
        timeout -k 10s 20s docker run --privileged -it --rm --platform="linux/arm64" --network="bridge" -v "$BINDIR:/mnt" "termux/termux-docker:aarch64" "/mnt/pspy" --help
        popd >/dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
unset SKIP_BUILD ; export BUILT="YES"
#In case of Android Polluted env
unset TOOLPACKS_ANDROID_BUILDIR
#In case of build polluted env
unset ANDROID_API_LEVEL ANDROID_LIBRARY_DIR ANDROID_TARGET AR AS CC CFLAGS CPP CXX CPPFLAGS CXXFLAGS CROSS_COMPILE DLLTOOL HOST_CC HOST_CXX LD LDFLAGS LIBS NM OBJCOPY OBJDUMP RANLIB READELF SIZE STRINGS STRIP SYSROOT TARGET
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#