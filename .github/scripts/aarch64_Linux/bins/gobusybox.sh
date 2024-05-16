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
    #gobusybox : Tools for compiling many Go commands into one binary to save space
     export BIN="gobusybox" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/u-root/gobusybox" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build  
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/u-root/gobusybox" && cd "./gobusybox/src"
       ##Core
       #gencmddeps : Generates a command dependency Go file.
       GOOS="linux" GOARCH="arm64" CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" "./cmd/gencmddeps" ; cp "./gencmddeps" "$BINDIR/gencmddeps"
       #goanywhere : Creates a Go workspace & executes command after "--"
       GOOS="linux" GOARCH="arm64" CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" "./cmd/goanywhere" ; cp "./goanywhere" "$BINDIR/goanywhere"
       #makebb : Compiles many Go commands into one bb-style binary.
       GOOS="linux" GOARCH="arm64" CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" "./cmd/makebb" ; cp "./makebb" "$BINDIR/makebb"
       #makebbmain : adds u-root command package imports to an existing main() template file.
       GOOS="linux" GOARCH="arm64" CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" "./cmd/makebbmain" ; cp "./makebbmain" "$BINDIR/makebbmain"
       #rewritepkg : takes a Go command's source and rewrites it to be a u-root busybox compatible library package.
       GOOS="linux" GOARCH="arm64" CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" "./cmd/rewritepkg" ; cp "./rewritepkg" "$BINDIR/rewritepkg"
       ##U-root cmds
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/u-root/u-root" && cd "./u-root"
       export GOOS="linux" ; export GOARCH="arm64" ; export CGO_ENABLED="0"
       #BuysBox
       #find . -maxdepth 2 -mindepth 1 -type d -exec sh -c 'ls -1 "{}"/*.go >/dev/null 2>&1' \; -print | xargs -I {} "$BINDIR/makebb" {}
       "$BINDIR/makebb" "./cmds"/*/* ; strip "./bb" ; file "./bb" && du -sh "./bb"
       cp "./bb" "$BINDIR/gobusybox"
       cp "./bb" "$BINDIR/uroot-busybox"
       cp "./bb" "$BINDIR/u-root-busybox"
       popd >/dev/null 2>&1
       go clean -cache -fuzzcache -modcache -testcache
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