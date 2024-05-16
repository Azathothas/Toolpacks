#!/usr/bin/env bash
set -x
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
     #xbps : Void Package Builder|Installer
     export BIN="xbps" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/void-linux/xbps" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Fetch
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && eget https://repo-default.voidlinux.org/static/xbps-static-latest.x86_64-musl.tar.xz --all
       #Copy
       cp "./xbps-alternatives.static" "$BINDIR/xbps-alternatives"
       cp "./xbps-checkvers.static" "$BINDIR/xbps-checkvers"
       cp "./xbps-create.static" "$BINDIR/xbps-create"
       cp "./xbps-dgraph.static" "$BINDIR/xbps-dgraph"
       cp "./xbps-digest.static" "$BINDIR/xbps-digest"
       cp "./xbps-fbulk.static" "$BINDIR/xbps-fbulk"
       cp "./xbps-fetch.static" "$BINDIR/xbps-fetch"
       cp "./xbps-install.static" "$BINDIR/xbps-install"
       cp "./xbps-pkgdb.static" "$BINDIR/xbps-pkgdb"
       cp "./xbps-query.static" "$BINDIR/xbps-query"
       cp "./xbps-reconfigure.static" "$BINDIR/xbps-reconfigure"
       cp "./xbps-remove.static" "$BINDIR/xbps-remove"
       cp "./xbps-rindex.static" "$BINDIR/xbps-rindex"
       cp "./xbps-uchroot.static" "$BINDIR/xbps-uchroot"
       cp "./xbps-uhelper.static" "$BINDIR/xbps-uhelper"
       cp "./xbps-uunshare.static" "$BINDIR/xbps-uunshare"
       popd >/dev/null 2>&1
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
set +x
#-------------------------------------------------------#