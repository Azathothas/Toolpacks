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
    #mitmproxy : An interactive TLS-capable intercepting HTTP proxy for penetration testers and software developers
     export BIN="mitmproxy"
     export SOURCE_URL="https://github.com/mitmproxy/mitmproxy"
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      #https://github.com/JonathonReinhart/staticx/issues/188
      ###Build:
      # pushd "$($TMPDIRS)" >/dev/null 2>&1
      # docker stop "debian-builder-unstable" 2>/dev/null ; docker rm "debian-builder-unstable" 2>/dev/null
      # docker run --privileged --net="host" --name "debian-builder-unstable" "azathothas/debian-builder-unstable:latest" \
      #  bash -l -c '
      #  #Setup ENV
      #   mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
      #   sudo apt-get update -y -qq
      #  #https://mitmproxy.org/downloads/
      #   VERSION="$(git ls-remote --tags https://github.com/mitmproxy/mitmproxy | awk -F/ '\''/tags/ && !/{}$/ {print $NF}'\'' | tr -d "[:alpha:]" | sort --version-sort | tail -n 1 | tr -d "[:space:]")" && export VERSION="${VERSION}"
      #   curl -qfsSL "https://downloads.mitmproxy.org/${VERSION}/mitmproxy-${VERSION}-linux-x86_64.tar.gz" -o "./mitmproxy.tar.gz"
      #   tar -xvf "./mitmproxy.tar.gz" && rm -rf "./mitmproxy.tar.gz"
      #   mkdir -p "/tmp/bins" && find "." -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath | xargs -I {} rsync -av --copy-links --exclude="*/" "{}" "/tmp/bins"
      #  #Staticx
      #   cd "/tmp/bins" && staticx --loglevel DEBUG "./mitmdump" --strip "/build-bins/mitmdump"
      #   staticx --loglevel DEBUG "./mitmproxy" --strip "/build-bins/mitmproxy"
      #   staticx --loglevel DEBUG "./mitmweb" --strip "/build-bins/mitmweb"
      #  #strip & info 
      #   find "/build-bins/" -type f -exec objcopy --remove-section=".comment" --remove-section=".note.*" "{}" \;
      #   find "/build-bins/" -type f ! -name "*.no_strip" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
      #   file "/build-bins/"* && du -sh "/build-bins/"*
      #   popd >/dev/null 2>&1
      #  '
      ##Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "debian-builder-unstable" 2>/dev/null ; docker rm "debian-builder-unstable" 2>/dev/null
       docker run --privileged --net="host" --name "debian-builder-unstable" "azathothas/debian-builder-unstable:latest" \
        bash -l -c '
        #Setup ENV
         mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
         sudo apt-get update -y -qq
        #Build
         git clone --quiet --filter "blob:none" "https://github.com/mitmproxy/mitmproxy" && cd "./mitmproxy"
         pip install "." --break-system-packages --ignore-installed --force-reinstall --upgrade
         #https://github.com/mitmproxy/mitmproxy/blob/main/release/specs/standalone.spec
         sed "s/upx=True/upx=False/" -i "./release/specs/standalone.spec"
         pyinstaller --clean "./release/specs/standalone.spec" --noconfirm
         staticx --loglevel DEBUG "./dist/mitmdump" --strip "/build-bins/mitmdump"
         staticx --loglevel DEBUG "./dist/mitmproxy" --strip "/build-bins/mitmproxy"
         staticx --loglevel DEBUG "./dist/mitmweb" --strip "/build-bins/mitmweb"
        #strip & info 
         find "/build-bins/" -type f -exec objcopy --remove-section=".comment" --remove-section=".note.*" "{}" \;
         find "/build-bins/" -type f ! -name "*.no_strip" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
         file "/build-bins/"* && du -sh "/build-bins/"*
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