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
export SKIP_BUILD="NO" #YES, in case of deleted repos, broken builds etc
if [ "${SKIP_BUILD}" == "NO" ]; then
   #quotes-escaper : Escape Single | Double Quotes
     export BIN="quotes-escaper" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/Azathothas/Arsenal" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      #Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && mkdir -p "./quotes-escaper" && cd "./quotes-escaper"
       curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/quotes-escaper/main.go"
       go mod init "github.com/Azathothas/Arsenal/quotes-escaper" ; go mod tidy
       GOOS="linux" GOARCH="arm64" CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" -o "./quotes-escaper" ; cp "./quotes-escaper" "$BINDIR/quotes-escaper" ; popd >/dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
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