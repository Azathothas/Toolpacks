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
    #jless: command-line JSON viewer designed for reading, exploring, and searching through JSON data.
     export BIN="jless" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/PaulJuliusMartinez/jless" #github/gitlab/homepage/etc for $BIN
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
         export ANDROID_LIBRARY_DIR="${ANDROID_NDK_SYSROOT}/usr/lib/aarch64-linux-android/${ANDROID_API_LEVEL}"
        #Setup Rust ENV
         export RUST_TARGET="aarch64-linux-android" && rustup target add "$RUST_TARGET"
         export RUSTFLAGS="-C linker=${CC} -C ar=${AR} -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols"
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/PaulJuliusMartinez/jless" && cd "./jless"
         echo -e "\n[+] Target: $RUST_TARGET\n"
         echo -e "\n[+] Flags: $RUSTFLAGS\n"
         #Release Profile
         dasel delete --file "./Cargo.toml" ".profile.release" 2>/dev/null
         dasel put --file "./Cargo.toml" ".profile.release.lto" --type bool --value "true"
         dasel put --file "./Cargo.toml" ".profile.release.opt-level" --type int --value "3"
         dasel put --file "./Cargo.toml" ".profile.release.strip" --type bool --value "true"
         rm rust-toolchain* 2>/dev/null
         cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going
         cp "./target/$RUST_TARGET/release/jless" "/build-bins/jless"
        '
      #Copy 
       docker cp "alpine-builder:/build-bins/jless" "./jless"
      #Meta
       file "./jless" && du -sh "./jless" ; aarch64-linux-gnu-readelf -d "./jless" | grep -i 'needed'
       cp "./jless" "$BINDIR/jless"
      #Test
       timeout -k 10s 20s docker run --privileged -it --rm --platform="linux/arm64" --network="host" -v "$BINDIR:/mnt" "termux/termux-docker:aarch64" "/mnt/jless" --help
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