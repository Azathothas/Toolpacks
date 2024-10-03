#!/usr/bin/env bash

#-------------------------------------------------------#
#Sanity Checks
if [ "${BUILD}" != "YES" ] || \
   [ -z "${BINDIR}" ] || \
   [ -z "${EGET_EXCLUDE}" ] || \
   [ -z "${EGET_TIMEOUT}" ] || \
   [ -z "${GIT_TERMINAL_PROMPT}" ] || \
   [ -z "${GIT_ASKPASS}" ] || \
   [ -z "${GITHUB_TOKEN}" ] || \
   [ -z "${SYSTMP}" ] || \
   [ -z "${TMPDIRS}" ]; then
 #exit
  echo -e "\n[+]Skipping Builds...\n"
  exit 1
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Main
SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "${SKIP_BUILD}" == "NO" ]; then
     #docker : Container
     export BIN="docker" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/docker/cli" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      #Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && eget "https://download.docker.com/linux/static/stable/x86_64/$(curl -qfsSL "https://download.docker.com/linux/static/stable/x86_64/" | grep -o 'href="[^"]*"' | sed 's/href="//' | sed 's/"$//' | grep -iv "rootless" | sort | tail -n 1)" --all
       eget "https://download.docker.com/linux/static/stable/x86_64/$(curl -qfsSL "https://download.docker.com/linux/static/stable/x86_64/" | grep -o 'href="[^"]*"' | sed 's/href="//' | sed 's/"$//' | grep -i "rootless" | sort | tail -n 1)" --all
       cp "./containerd" "$BINDIR/containerd"
       cp "./containerd-shim-runc-v2" "$BINDIR/containerd-shim-runc-v2"
       cp "./ctr" "$BINDIR/ctr"
       cp "./docker" "$BINDIR/docker"
       cp "./docker-init" "$BINDIR/docker-init"
       cp "./docker-proxy" "$BINDIR/docker-proxy"
       cp "./dockerd" "$BINDIR/dockerd"
       cp "./dockerd-rootless-setuptool.sh" "$BINDIR/dockerd-rootless-setuptool.sh"
       cp "./dockerd-rootless.sh" "$BINDIR/dockerd-rootless.sh"
       cp "./rootlesskit" "$BINDIR/rootlesskit"
       cp "./rootlesskit-docker-proxy" "$BINDIR/rootlesskit-docker-proxy"
       cp "./runc" "$BINDIR/runc"
       cp "./vpnkit" "$BINDIR/vpnkit"
       popd >/dev/null 2>&1
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