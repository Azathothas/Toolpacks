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
      #dos2unix : Convert Line Endings
     export BIN="dos2unix" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://dos2unix.sourceforge.io" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" > /dev/null 2>&1
       NIXPKGS_ALLOW_BROKEN="1" NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM="1" nix-build '<nixpkgs>' --attr "pkgsStatic.dos2unix" --cores "$(($(nproc)+1))" --max-jobs "$(($(nproc)+1))" --log-format bar-with-logs
       sudo strip "./result/bin/dos2unix" ; file "./result/bin/dos2unix" && du -sh "./result/bin/dos2unix"
       sudo strip "./result/bin/mac2unix" ; file "./result/bin/mac2unix" && du -sh "./result/bin/mac2unix"
       sudo strip "./result/bin/unix2dos" ; file "./result/bin/unix2dos" && du -sh "./result/bin/unix2dos"
       sudo strip "./result/bin/unix2mac" ; file "./result/bin/unix2mac" && du -sh "./result/bin/unix2mac"
       cp "./result/bin/dos2unix" "$BINDIR/dos2unix"
       cp "./result/bin/mac2unix" "$BINDIR/mac2unix"
       cp "./result/bin/unix2dos" "$BINDIR/unix2dos"
       cp "./result/bin/unix2mac" "$BINDIR/unix2mac"
       nix-collect-garbage > /dev/null 2>&1 ; popd > /dev/null 2>&1
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