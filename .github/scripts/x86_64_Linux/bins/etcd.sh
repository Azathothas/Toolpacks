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
     #etcd : Distributed reliable key-value store for the most critical data of a distributed system
     export BIN="etcd" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/etcd-io/etcd" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       eval "$EGET_TIMEOUT" eget "etcd-io/etcd" --asset "amd64" --asset "linux" --asset "gz" --asset "^etcdutl" --asset "^etcdctl" --to "$BINDIR/etcd"
       eval "$EGET_TIMEOUT" eget "etcd-io/etcd" --asset "amd64" --asset "linux" --asset "gz" --file "etcdctl" --to "$BINDIR/etcdctl"
       eval "$EGET_TIMEOUT" eget "etcd-io/etcd" --asset "amd64" --asset "linux" --asset "gz" --file "etcdutl" --to "$BINDIR/etcdutl"
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
#In case of zig polluted env
unset AR CC CXX DLLTOOL HOST_CC HOST_CXX OBJCOPY RANLIB
#-------------------------------------------------------#