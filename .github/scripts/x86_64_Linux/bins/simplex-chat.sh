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
SKIP_BUILD="YES" #WIP
if [ "$SKIP_BUILD" == "NO" ]; then
    #simplex-chat : SimpleX Chat terminal (console) app
     export BIN="simplex-chat"
     export SOURCE_URL="https://github.com/simplex-chat/simplex-chat"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "debian-builder-unstable" 2>/dev/null ; docker rm "debian-builder-unstable" 2>/dev/null
       docker run --privileged --net="host" --name "debian-builder-unstable" "azathothas/debian-builder-unstable:latest" \
        bash -l -c '
        #Setup ENV
         mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
         sudo apt-get update -y -qq
         sudo apt-get install -y -qq libpcre3 libgmp3-dev xdg-utils zlib1g-dev
         sudo apt-get update -y -qq
        #Fetch
         eget "https://github.com/simplex-chat/simplex-chat" --asset "chat" --asset "ubuntu-22_04" --asset "x86_64" --asset "^desktop" --asset "^deb" --to "./simplex-chat"
         #sudo mkdir -p "/usr/share/desktop-directories"
         #sudo dpkg --install "./simplex-chat.deb"
         staticx --loglevel DEBUG "./simplex-chat" --strip "/build-bins/simplex-chat"
        #strip & info 
         objcopy --remove-section=".comment" --remove-section=".note.*" "/build-bins/simplex-chat"
         strip --strip-debug --strip-dwo --strip-unneeded -R ".comment" -R ".gnu.version" "/build-bins/simplex-chat"
         file "/build-bins/simplex-chat" && du -sh "/build-bins/simplex-chat"
         popd >/dev/null 2>&1
        '
      #Copy & Meta
       docker cp "debian-builder-unstable:/build-bins/." "$(pwd)/"
       find "." -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath
       #Meta
       find "." -maxdepth 1 -type f -exec sh -c 'file "{}"; du -sh "{}"' \;
       sudo rsync -av --copy-links --exclude="*/" "./." "$BINDIR"
      #Delete Containers
       docker stop "debian-builder-unstable" 2>/dev/null ; docker rm "debian-builder-unstable"
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