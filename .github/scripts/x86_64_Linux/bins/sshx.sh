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
      #sshx : Fast, collaborative live terminal sharing over the web
     export BIN="sshx" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/ekzhang/sshx" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/ekzhang/sshx" && cd "./sshx"
       sudo apt-get install protobuf-compiler -y
       export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
       sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true' >> "./Cargo.toml"
       cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going ; mv "./target/$RUST_TARGET/release/sshx" "$BINDIR/sshx" ; mv "./target/$RUST_TARGET/release/sshx-server" "$BINDIR/sshx-server" ; popd > /dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
#-------------------------------------------------------#