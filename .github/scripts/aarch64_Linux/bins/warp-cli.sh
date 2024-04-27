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
    #warp-cli: cloudflare warp
     export BIN="warp-cli" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://pkg.cloudflareclient.com" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" > /dev/null 2>&1
       #Install
       curl -qfsSL "https://pkg.cloudflareclient.com/pubkey.gpg" | sudo gpg --yes --dearmor --output "/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg"
       echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ bookworm main" | sudo tee "/etc/apt/sources.list.d/cloudflare-client.list"
       sudo apt-get update -y && sudo apt-get install cloudflare-warp -y
       sudo systemctl stop warp-svc
       #Strip & Staticx
       sudo strip "$(which warp-cli)" && staticx --loglevel DEBUG "$(which warp-cli)" --strip "./warp-cli"
       sudo strip "$(which warp-dex)" && staticx --loglevel DEBUG "$(which warp-dex)" --strip "./warp-dex"
       sudo strip "$(which warp-diag)" && staticx --loglevel DEBUG "$(which warp-diag)" --strip "./warp-diag"
       sudo strip "$(which warp-svc)" && staticx --loglevel DEBUG "$(which warp-svc)" --strip "./warp-svc"
       #Copy
       file "./warp-cli" && du -sh "./warp-cli" && cp "./warp-cli" "$BINDIR/warp-cli"
       file "./warp-dex" && du -sh "./warp-dex" && cp "./warp-dex" "$BINDIR/warp-dex"
       file "./warp-diag" && du -sh "./warp-diag" && cp "./warp-diag" "$BINDIR/warp-diag"
       file "./warp-svc" && du -sh "./warp-svc" && cp "./warp-svc" "$BINDIR/warp-svc"
       #Test 
       "./warp-cli" --version
       docker run --privileged -it --rm --network="host" -v "$BINDIR:/mnt" "alpine" "/mnt/warp-cli" --help
       #sudo ./warp-svc start > /dev/null 2>&1
       #sudo warp-cli --accept-tos registration new
       #sudo warp-cli --accept-tos mode warp+doh
       #sudo warp-cli --accept-tos add-excluded-route 0.0.0.0/0
       #sudo warp-cli --accept-tos connect
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