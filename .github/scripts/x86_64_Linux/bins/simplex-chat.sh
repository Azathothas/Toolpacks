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

      ##Build (alpine-musl)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "alpine:latest" \
        sh -c '
        #Setup ENV
         mkdir -p "/build-bins" && cd "$(mktemp -d)" >/dev/null 2>&1
         apk update && apk upgrade --no-interactive 2>/dev/null
        #CoreUtils 
         apk add alpine-sdk alpine-base coreutils croc curl file git grep jq moreutils nano ncdu rsync sudo tar util-linux xz 7zip --latest --upgrade --no-interactive 2>/dev/null
        #Deps
         apk add ghc-dev gmp-dev openssl-dev openssl-libs-static zlib-dev zlib-static --latest --upgrade --no-interactive 2>/dev/null
         ln -s "/usr/lib/libncursesw.so.6" "/usr/lib/libtinfow.so.6"
         #Install ghcup: https://github.com/simplex-chat/simplex-chat/blob/stable/Dockerfile
         export BOOTSTRAP_HASKELL_GHC_VERSION="9.6.3"
         export BOOTSTRAP_HASKELL_CABAL_VERSION="3.10.1.0"
         curl -qfsSL "https://get-ghcup.haskell.org" | BOOTSTRAP_HASKELL_NONINTERACTIVE="1" sh
         export PATH="/root/.cabal/bin:/root/.ghcup/bin:${PATH}" ; ghcup --version
         #ghcup install ghc "latest" ; ghcup set ghc "latest"
         #ghcup install cabal "latest" ; ghcup set cabal "latest"
         ghcup set ghc "${BOOTSTRAP_HASKELL_GHC_VERSION}"
         ghcup set cabal "${BOOTSTRAP_HASKELL_CABAL_VERSION}"
         cabal install hpack --install-method="copy" --installdir="/usr/local/bin"
        #Build
         cd "$(mktemp -d)" >/dev/null 2>&1 && git clone --filter "blob:none" --quiet "https://github.com/simplex-chat/simplex-chat" && cd "./simplex-chat"
         cp "./scripts/cabal.project.local.linux" "./cabal.project.local"
         sed '\''/- -Wunused-type-patterns/a\  - -O2\n\  - -split-sections\n\  - -with-rtsopts=-N\n\  - -static\n\cc-options: -static -w -pipe\n\ld-options: -static -pthread -s -Wl,-S -Wl,--build-id=none'\'' -i "./package.yaml"

         sed '/- -Wunused-type-patterns/a\  - -O2\n\  - -split-sections\n\  - -with-rtsopts=-N\n\  - -static\n\cc-options: -static -w -pipe\n\ld-options: -static -pthread -s -Wl,-S -Wl,--build-id=none' -i "./package.yaml"
         
         #Reconfigure cabal project
         cabal clean ; hpack ; cabal update
         cabal build "exe:simplex-chat" --allow-newer --jobs="$(($(nproc)+1))" --keep-going  


          find /project/dist-newstyle -name "simplex-chat" -type f -executable
        #Copy
         #cp "./simplex-chat" "/build-bins/simplex-chat"
         find "." -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath | xargs -I {} cp --force {} /build-bins/
        #strip & info 
         find "/build-bins/" -type f -exec objcopy --remove-section=".comment" --remove-section=".note.*" "{}" \;
         find "/build-bins/" -type f ! -name "*.AppImage" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
         file "/build-bins/"* && du -sh "/build-bins/"*
        '
      #Copy & Meta
       docker cp "alpine-builder:/build-bins/." "$(pwd)/"
       find "." -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath
       #Meta
       find "." -maxdepth 1 -type f -exec sh -c 'file "{}"; du -sh "{}"' \;
       sudo rsync -av --copy-links --exclude="*/" "./." "$BINDIR"       
      #Delete Containers
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder"
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