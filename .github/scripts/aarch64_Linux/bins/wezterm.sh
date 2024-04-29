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
    #wezterm: A GPU-accelerated cross-platform terminal emulator and multiplexer
     export BIN="wezterm" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/wez/wezterm" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" > /dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        sh -c '
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins"
         source "$HOME/.cargo/env"
         export RUST_TARGET="aarch64-unknown-linux-musl"
         rustup target add "$RUST_TARGET"
         export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=clang -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,--Bstatic -C link-arg=-Wl,--static -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
        #Install Deps :: https://github.com/wez/wezterm/blob/main/get-deps
         #apk update && apk upgrade --no-interactive
         #apk add boost-dev --latest --upgrade --no-interactive
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/wez/wezterm" && cd "./wezterm"
         echo -e "\n[+] Target: $RUST_TARGET\n"
         echo -e "\n[+] Flags: $RUSTFLAGS\n"
         sed "/^\[profile\.release\]/,/^$/d" -i "./Cargo.toml" ; echo -e "\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true" >> "./Cargo.toml"
         rm rust-toolchain* 2>/dev/null
         cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going
         cp "./target/$RUST_TARGET/release/generate-bidi" "/build-bins/generate-bidi"
         cp "./target/$RUST_TARGET/release/strip-ansi-escapes" "/build-bins/strip-ansi-escapes"
         cp "./target/$RUST_TARGET/release/sync-color-schemes" "/build-bins/sync-color-schemes"
         cp "./target/$RUST_TARGET/release/wezterm" "/build-bins/wezterm"
         cp "./target/$RUST_TARGET/release/wezterm-gui" "/build-bins/wezterm-gui"
         cp "./target/$RUST_TARGET/release/wezterm-mux-server" "/build-bins/wezterm-mux-server"
        '
      #Copy 
       docker cp "alpine-builder:/build-bins/generate-bidi" "./generate-bidi"
       docker cp "alpine-builder:/build-bins/strip-ansi-escapes" "./strip-ansi-escapes"
       docker cp "alpine-builder:/build-bins/sync-color-schemes" "./sync-color-schemes"
       docker cp "alpine-builder:/build-bins/wezterm" "./wezterm"
       docker cp "alpine-builder:/build-bins/wezterm-gui" "./wezterm-gui"
       docker cp "alpine-builder:/build-bins/wezterm-mux-server" "./wezterm-mux-server"
       #Meta 
       file "./generate-bidi" && du -sh "./generate-bidi" ; cp "./generate-bidi" "$BINDIR/generate-bidi"
       file "./strip-ansi-escapes" && du -sh "./strip-ansi-escapes" ; cp "./strip-ansi-escapes" "$BINDIR/strip-ansi-escapes"
       file "./sync-color-schemes" && du -sh "./sync-color-schemes" ; cp "./sync-color-schemes" "$BINDIR/sync-color-schemes"
       file "./wezterm" && du -sh "./wezterm" ; cp "./wezterm" "$BINDIR/wezterm"
       file "./wezterm-gui" && du -sh "./wezterm-gui" ; cp "./wezterm-gui" "$BINDIR/wezterm-gui"
       file "./wezterm-mux-server" && du -sh "./wezterm-mux-server" ; cp "./wezterm-mux-server" "$BINDIR/wezterm-mux-server"
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