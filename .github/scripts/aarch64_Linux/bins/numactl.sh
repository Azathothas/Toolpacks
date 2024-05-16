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
    #numactl : NUMA stats
     export BIN="numactl" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/numactl/numactl" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       NIXPKGS_ALLOW_BROKEN="1" NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM="1" nix-build '<nixpkgs>' --attr "pkgsStatic.numactl" --cores "$(($(nproc)+1))" --max-jobs "$(($(nproc)+1))" --log-format bar-with-logs
       sudo strip "./result/bin/memhog" ; file "./result/bin/memhog" && du -sh "./result/bin/memhog" ; cp "./result/bin/memhog" "$BINDIR/memhog"
       sudo strip "./result/bin/migratepages" ; file "./result/bin/migratepages" && du -sh "./result/bin/migratepages" ; cp "./result/bin/migratepages" "$BINDIR/migratepages"
       sudo strip "./result/bin/migspeed" ; file "./result/bin/migspeed" && du -sh "./result/bin/migspeed" ; cp "./result/bin/migspeed" "$BINDIR/migspeed"
       sudo strip "./result/bin/numactl" ; file "./result/bin/numactl" && du -sh "./result/bin/numactl" ; cp "./result/bin/numactl" "$BINDIR/numactl"
       sudo strip "./result/bin/numademo" ; file "./result/bin/numademo" && du -sh "./result/bin/numademo" ; cp "./result/bin/numademo" "$BINDIR/numademo"
       sudo strip "./result/bin/numastat" ; file "./result/bin/numastat" && du -sh "./result/bin/numastat" ; cp "./result/bin/numastat" "$BINDIR/numastat"
       nix-collect-garbage >/dev/null 2>&1 ; popd >/dev/null 2>&1
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