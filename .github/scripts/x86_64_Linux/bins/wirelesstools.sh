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
    #wirelesstools: Wireless tools for Linux
     export BIN="wirelesstools" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://www.gnu.org/software/wirelesstools/" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" > /dev/null 2>&1
       NIXPKGS_ALLOW_BROKEN="1" NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM="1" nix-build '<nixpkgs>' --attr "pkgsStatic.wirelesstools" --cores "$(($(nproc)+1))" --max-jobs "$(($(nproc)+1))" --log-format bar-with-logs
       sudo strip "./result/bin/"* ; file "./result/bin/"* && du -sh "./result/bin/"*
       cp "./result/bin/ifrename" "$BINDIR/ifrename" ; sudo cp "./result/bin/ifrename" "$BASEUTILSDIR/ifrename"
       cp "./result/bin/iwconfig" "$BINDIR/iwconfig" ; sudo cp "./result/bin/iwconfig" "$BASEUTILSDIR/iwconfig"
       cp "./result/bin/iwevent" "$BINDIR/iwevent" ; sudo cp "./result/bin/iwevent" "$BASEUTILSDIR/iwevent"
       cp "./result/bin/iwgetid" "$BINDIR/iwgetid" ; sudo cp "./result/bin/iwgetid" "$BASEUTILSDIR/iwgetid"
       cp "./result/bin/iwlist" "$BINDIR/iwlist" ; sudo cp "./result/bin/iwlist" "$BASEUTILSDIR/iwlist"
       cp "./result/bin/iwpriv" "$BINDIR/iwpriv" ; sudo cp "./result/bin/iwpriv" "$BASEUTILSDIR/iwpriv"
       cp "./result/bin/iwspy" "$BINDIR/iwspy" ; sudo cp "./result/bin/iwspy" "$BASEUTILSDIR/iwspy"
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