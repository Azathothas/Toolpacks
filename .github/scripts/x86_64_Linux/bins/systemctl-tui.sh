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
      #systemctl-tui : A fast, simple TUI for interacting with systemd services and their logs
     export BIN="systemctl-tui" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/rgwood/systemctl-tui" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/rgwood/systemctl-tui" && cd "./systemctl-tui"
       export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
       sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
       echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
       cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/systemctl-tui" "$BINDIR/systemctl-tui"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
#-------------------------------------------------------#