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
    #huggingface_hub : The official Python client for the Huggingface Hub
     export BIN="huggingface-cli"
     export SOURCE_URL="https://github.com/huggingface/huggingface_hub"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Build (Debian-GLIBC)
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "debian-builder-unstable" 2>/dev/null ; docker rm "debian-builder-unstable" 2>/dev/null
       docker run --privileged --net="host" --name "debian-builder-unstable" "azathothas/debian-builder-unstable:latest" \
        bash -c '
        #Setup ENV
         mkdir -p "/build-bins" && TMP_BUILD="$(mktemp -d)" && export TMP_BUILD="${TMP_BUILD}"
         sudo apt-get update -y -qq
         sudo apt-get install -y -qq autoconf curl git g++ libffi-dev libxml2-dev libxslt-dev libssl-dev openssl python3-dev 
         sudo apt-get update -y -qq
         pip install "git+https://github.com/pyinstaller/pyinstaller" --break-system-packages --force-reinstall --upgrade ; pyinstaller --version
        #Build
         pip install --break-system-packages --force-reinstall --ignore-installed --upgrade "git+https://github.com/huggingface/huggingface_hub#[cli]"
         cd "$(dirname $(which huggingface-cli))" && cp "$(which huggingface-cli)" "${TMP_BUILD}/huggingface-cli.py"
         pushd "${TMP_BUILD}" >/dev/null 2>&1 && pyinstaller --clean "${TMP_BUILD}/huggingface-cli.py" --noconfirm ; rm -rf "/build-bins/huggingface-cli"
        #This is overkill, but works: https://github.com/huggingface/huggingface_hub/blob/main/setup.py
         pyinstaller --strip --noupx --onefile "${TMP_BUILD}/huggingface-cli.py" --name "huggingface-cli" --noconfirm \
         --collect-submodules="aiohttp" \
         --collect-submodules="certifi" \
         --collect-submodules="charset-normalizer" \
         --collect-submodules="fastcore" \
         --collect-submodules="fastai" \
         --collect-submodules="fastapi" \
         --collect-submodules="filelock" \
         --collect-submodules="fsspec" \
         --collect-submodules="gradio" \
         --collect-submodules="graphviz" \
         --collect-submodules="hf_transfer" \
         --collect-submodules="huggingface_hub" \
         --collect-submodules="huggingface_hub.commands" \
         --collect-submodules="huggingface_hub.commands.huggingface_cli" \
         --collect-submodules="idna" \
         --collect-submodules="InquirerPy" \
         --collect-submodules="jedi" \
         --collect-submodules="Jinja2" \
         --collect-submodules="keras" \
         --collect-submodules="minijinja" \
         --collect-submodules="mypy" \
         --collect-submodules="numpy" \
         --collect-submodules="packaging" \
         --collect-submodules="Pillow" \
         --collect-submodules="pydot" \
         --collect-submodules="pytest" \
         --collect-submodules="pytest-asyncio" \
         --collect-submodules="pytest-cov" \
         --collect-submodules="pytest-env" \
         --collect-submodules="pytest-mock" \
         --collect-submodules="pytest-rerunfailures" \
         --collect-submodules="pytest-vcr" \
         --collect-submodules="pytest-xdist" \
         --collect-submodules="pyyaml" \
         --collect-submodules="requests" \
         --collect-submodules="ruff" \
         --collect-submodules="safetensors" \
         --collect-submodules="soundfile" \
         --collect-submodules="system" \
         --collect-submodules="torch" \
         --collect-submodules="tensorflow" \
         --collect-submodules="tqdm" \
         --collect-submodules="typing-extensions" \
         --collect-submodules="types-PyYAML" \
         --collect-submodules="types-requests" \
         --collect-submodules="types-simplejson" \
         --collect-submodules="types-toml" \
         --collect-submodules="types-tqdm" \
         --collect-submodules="types-urllib" \
         --collect-submodules="urllib3" \
         --hidden-import="aiohttp" \
         --hidden-import="certifi" \
         --hidden-import="charset-normalizer" \
         --hidden-import="fastcore" \
         --hidden-import="fastai" \
         --hidden-import="fastapi" \
         --hidden-import="filelock" \
         --hidden-import="fsspec" \
         --hidden-import="gradio" \
         --hidden-import="graphviz" \
         --hidden-import="hf_transfer" \
         --hidden-import="huggingface_hub" \
         --hidden-import="huggingface_hub.commands" \
         --hidden-import="huggingface_hub.commands.huggingface_cli" \
         --hidden-import="idna" \
         --hidden-import="InquirerPy" \
         --hidden-import="jedi" \
         --hidden-import="Jinja2" \
         --hidden-import="keras" \
         --hidden-import="minijinja" \
         --hidden-import="mypy" \
         --hidden-import="numpy" \
         --hidden-import="packaging" \
         --hidden-import="Pillow" \
         --hidden-import="pydot" \
         --hidden-import="pytest" \
         --hidden-import="pytest-asyncio" \
         --hidden-import="pytest-cov" \
         --hidden-import="pytest-env" \
         --hidden-import="pytest-mock" \
         --hidden-import="pytest-rerunfailures" \
         --hidden-import="pytest-vcr" \
         --hidden-import="pytest-xdist" \
         --hidden-import="pyyaml" \
         --hidden-import="requests" \
         --hidden-import="ruff" \
         --hidden-import="safetensors" \
         --hidden-import="soundfile" \
         --hidden-import="system" \
         --hidden-import="torch" \
         --hidden-import="tensorflow" \
         --hidden-import="tqdm" \
         --hidden-import="typing-extensions" \
         --hidden-import="types-PyYAML" \
         --hidden-import="types-requests" \
         --hidden-import="types-simplejson" \
         --hidden-import="types-toml" \
         --hidden-import="types-tqdm" \
         --hidden-import="types-urllib" \
         --hidden-import="urllib3"
        #Staticx 
         find "/" -type l -name "*libpython*.so*" -print 2>/dev/null | xargs -I {} rsync -av --copy-links --exclude="*/" "{}" "./"
         ADD_LIBS="$(echo $(find . -maxdepth 1 -type f -name "*.so*" -exec realpath {} \; | sed "s/^/-l \"/" | sed "s/$/\" /" | tr "\n" " "))" && export ADD_LIBS="${ADD_LIBS}"
         eval staticx --loglevel DEBUG "${TMP_BUILD}/dist/huggingface-cli" "${ADD_LIBS}" --strip "/build-bins/huggingface-cli"
        #strip & info 
         find "/build-bins/" -type f -exec objcopy --remove-section=".comment" --remove-section=".note.*" "{}" \;
         find "/build-bins/" -type f ! -name "*.AppImage" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
         cp "/build-bins/huggingface-cli" "/build-bins/hf-cli"
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