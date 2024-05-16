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
   #anew-rs : A fast, simple, recursive content discovery tool written in Rust.
     export BIN="anew-rs" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/zer0yu/anew" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Build (ndk-pkg)
       #Fetch src
        pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/Azathothas/anew-rs" && cd "./anew-rs"
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
        export ANDROID_API_LEVEL="31"
        export ANDROID_LIBRARY_DIR="${ANDROID_NDK_SYSROOT}/usr/lib/aarch64-linux-android/${ANDROID_API_LEVEL}"
       #Compile:
        export RUST_TARGET="aarch64-linux-android" && rustup target add "$RUST_TARGET"
        export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=${CC} -C ar=${AR} -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,--Bstatic -C link-arg=-Wl,--static -C link-arg=-Wl,--no-dynamic-linker -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
        sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true' >> "./Cargo.toml"
        cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going ; cp "./target/$RUST_TARGET/release/anew" "./anew-rs"
       #Meta
        file "./anew-rs" && du -sh "./anew-rs" ; aarch64-linux-gnu-readelf -d "./anew-rs" | grep -i 'needed'
        cp "./anew-rs" "$BINDIR/anew-rs"
       #Test
        timeout -k 10s 20s docker run --privileged -it --rm --platform="linux/arm64" --network="host" -v "$BINDIR:/mnt" "termux/termux-docker:aarch64" "/mnt/anew-rs" --help
        popd >/dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
unset SKIP_BUILD ; export BUILT="YES"
#In case of Android Polluted env
unset TOOLPACKS_ANDROID_BUILDIR
#In case of build polluted env
unset ANDROID_TARGET AR AS CC CFLAGS CPP CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LD LDFLAGS LIBS NM OBJCOPY OBJDUMP RANLIB READELF SIZE STRINGS STRIP SYSROOT
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#