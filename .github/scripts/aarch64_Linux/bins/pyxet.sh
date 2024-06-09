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
      #pyxet :💥 Python CLI for XetHub
     export BIN="pyxet" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/xetdata/pyxet" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
       pip install fsspec ipython maturin pyxet s3fs tabulate --upgrade 2>/dev/null
       pip install fsspec ipython maturin pyxet s3fs tabulate --upgrade --break-system-packages 2>/dev/null
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && cd "$(dirname $(which xet))" && cp "$(which xet)" "./xet.py"
       pyinstaller --clean "./xet.py" --noconfirm ; rm -rf "$BINDIR/xet_staticx"
       pyinstaller --strip --onefile --collect-submodules="fsspec" --collect-submodules="pyxet" --collect-submodules="rpyxet" --collect-submodules="tabulate" --collect-submodules="typer" --collect-submodules="s3fs" --hidden-import="aiohttp" --hidden-import="pyxet" --hidden-import="requests" --hidden-import="rpyxet" "./xet.py" --noconfirm 
       staticx --loglevel DEBUG "./dist/xet" --strip "$BINDIR/xet_staticx" ; popd >/dev/null 2>&1
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