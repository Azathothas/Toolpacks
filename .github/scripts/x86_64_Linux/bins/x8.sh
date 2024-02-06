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
     #x8 : Hidden parameters discovery suite
     export BIN="x8" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/Sh1Yo/x8" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
      #x8 : Hidden parameters discovery suite 
       eval "$EGET_TIMEOUT" eget "Sh1Yo/x8" --asset "linux" --to "$BINDIR/x8"
       # attempt to build a static binary produces dynamic anyway  
       # pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" https://github.com/Sh1Yo/x8 && cd x8
       # export TARGET="x86_64-unknown-linux-gnu"
       # rustup target add "$TARGET"
       # export RUSTFLAGS="-C target-feature=+crt-static" 
       # sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
       # echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
       # cargo build --target "$TARGET" --release
       # file "./target/$TARGET/release/x8" ; ldd "./target/$TARGET/release/x8" ; ls "./target/$TARGET/release/x8" -lah
       # mv "./target/$TARGET/release/x8" "$BINDIR/x8"
       # popd > /dev/null 2>&1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
#-------------------------------------------------------#