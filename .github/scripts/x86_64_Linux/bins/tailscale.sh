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
       #tailscale : The easiest, most secure way to use WireGuard and 2FA
     export BIN="tailscale" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/tailscale/tailscale" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       eval "$EGET_TIMEOUT" eget "https://github.com/Azathothas/Static-Binaries/raw/main/tailscale/tailscale_amd_x86_64_Linux" --to "$BINDIR/tailscale"
       eval "$EGET_TIMEOUT" eget "https://github.com/Azathothas/Static-Binaries/raw/main/tailscale/tailscale_merged_amd_x86_64_Linux" --to "$BINDIR/tailscale_merged"
       eval "$EGET_TIMEOUT" eget "https://github.com/Azathothas/Static-Binaries/raw/main/tailscale/tailscaled_amd_x86_64_Linux" --to "$BINDIR/tailscaled"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#-------------------------------------------------------#