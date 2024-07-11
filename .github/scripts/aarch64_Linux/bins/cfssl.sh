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
     #cfssl : Cloudflare's PKI and TLS toolkit
     export BIN="cfssl" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/cloudflare/cfssl" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       eval "$EGET_TIMEOUT" eget "cloudflare/cfssl" --asset "cfssl" --asset "^cfssl-bundle" --asset "^cfssl-certinfo" --asset "^cfssl-newkey" --asset "^cfssl-scan" --asset "^cfssljson" --asset "linux" --asset "arm64" --to "$BINDIR/cfssl" 
       eval "$EGET_TIMEOUT" eget "cloudflare/cfssl" --asset "cfssl-bundle" --asset "linux" --asset "arm64" --to "$BINDIR/cfssl-bundle"
       eval "$EGET_TIMEOUT" eget "cloudflare/cfssl" --asset "cfssl-certinfo" --asset "linux" --asset "arm64" --to "$BINDIR/cfssl-certinfo"
       eval "$EGET_TIMEOUT" eget "cloudflare/cfssl" --asset "cfssl-newkey" --asset "linux" --asset "arm64" --to "$BINDIR/cfssl-newkey"
       eval "$EGET_TIMEOUT" eget "cloudflare/cfssl" --asset "cfssl-scan" --asset "linux" --asset "arm64" --to "$BINDIR/cfssl-scan"
       eval "$EGET_TIMEOUT" eget "cloudflare/cfssl" --asset "cfssljson" --asset "linux" --asset "arm64" --to "$BINDIR/cfssljson"
       eval "$EGET_TIMEOUT" eget "cloudflare/cfssl" --asset "mkbundle" --asset "linux" --asset "arm64" --to "$BINDIR/mkbundle"
       eval "$EGET_TIMEOUT" eget "cloudflare/cfssl" --asset "multirootca" --asset "linux" --asset "arm64" --to "$BINDIR/multirootca"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
unset SKIP_BUILD ; export BUILT="YES"
#In case of zig polluted env
unset AR CC CFLAGS CXX CPPFLAGS CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS LIBS OBJCOPY RANLIB
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#