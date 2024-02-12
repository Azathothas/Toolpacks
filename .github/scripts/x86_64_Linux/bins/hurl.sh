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
SKIP_BUILD="YES" #https://github.com/BlackDex/rust-musl/issues/4
if [ "$SKIP_BUILD" == "NO" ]; then
      #hurl: Hurl, run and test HTTP requests with plain text.
     export BIN="hurl" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/Orange-OpenSource/hurl" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build   
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/Orange-OpenSource/hurl" && cd "./hurl"
       export RUST_TARGET="x86_64-unknown-linux-musl" && rustup target add "$RUST_TARGET"
       export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C link-self-contained=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=clang -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,--Bstatic -C link-arg=-Wl,--static -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
       sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true' >> "./Cargo.toml"
       #https://github.com/BlackDex/rust-musl/issues/4
      #  docker run --rm -it -v "$(pwd):/home/rust/src" "docker.io/blackdex/rust-musl:x86_64-musl" cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going
      #  cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going ; cp "./target/$RUST_TARGET/release/hurl" "$BINDIR/hurl" ; popd > /dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
#-------------------------------------------------------#