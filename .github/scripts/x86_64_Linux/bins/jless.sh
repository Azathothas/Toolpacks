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
      #jless : jless is a command-line JSON viewer designed for reading, exploring, and searching through JSON data
     export BIN="jless" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/PaulJuliusMartinez/jless" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/PaulJuliusMartinez/jless" && cd "./jless"
       # Currenttly can't build static, due to xcb 
       export RUST_TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$RUST_TARGET"
       echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
       unset RUSTFLAGS ; cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going
       #cp "./target/$RUST_TARGET/release/jless" "$BINDIR/jless"
       staticx --loglevel DEBUG "./target/$RUST_TARGET/release/jless" --strip "$BINDIR/jless_staticx" ; popd > /dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
#-------------------------------------------------------#