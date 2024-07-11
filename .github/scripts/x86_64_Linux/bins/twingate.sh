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
     #twingate : programmatically deploy and maintain a zero trust approach to infrastructures
     export BIN="twingate-connector" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://www.twingate.com/" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       eval "$EGET_TIMEOUT" eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_client_amd_x86_64_staticx_Linux" --to "$BINDIR/twingate-client"
       eval "$EGET_TIMEOUT" eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_connector_amd_x86_64_dynamic_Linux" --to "$BINDIR/twingate-connector"
       eval "$EGET_TIMEOUT" eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_connector_amd_x86_64_staticx_Linux" --to "$BINDIR/twingate-connector-staticx"
       eval "$EGET_TIMEOUT" eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_connectorctl_amd_x86_64_staticx_Linux" --to "$BINDIR/twingate-connectorctl"
       eval "$EGET_TIMEOUT" eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_notifier_amd_x86_64_staticx_Linux" --to "$BINDIR/twingate-notifier"
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