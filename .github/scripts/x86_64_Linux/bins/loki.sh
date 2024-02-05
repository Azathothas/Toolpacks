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
      #loki : Like Prometheus, but for logs.
     export BIN="loki" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/grafana/loki" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch 
       eval "$EGET_TIMEOUT" eget "grafana/loki" --asset "logcli" --asset "linux" --asset "amd64" --asset "zip" --asset "^sig" --asset "^crt" --asset "^sha" --to "$BINDIR/logcli"
       eval "$EGET_TIMEOUT" eget "grafana/loki" --asset "loki" --asset "^loki-canary" --asset "linux" --asset "amd64" --asset "zip" --asset "^sig" --asset "^crt" --asset "^sha" --to "$BINDIR/loki"
       eval "$EGET_TIMEOUT" eget "grafana/loki" --asset "loki-canary" --asset "linux" --asset "amd64" --asset "zip" --asset "^sig" --asset "^crt" --asset "^sha" --to "$BINDIR/loki-canary"
       eval "$EGET_TIMEOUT" eget "grafana/loki" --asset "promtail" --asset "linux" --asset "amd64" --asset "zip" --asset "^sig" --asset "^crt" --asset "^sha" --to "$BINDIR/promtail"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#-------------------------------------------------------#