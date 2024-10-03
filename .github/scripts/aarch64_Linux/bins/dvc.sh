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
export SKIP_BUILD="YES" #Fails
if [ "${SKIP_BUILD}" == "NO" ]; then
      #dvc : 🦉 ML Experiments Management with Git 
     export BIN="dvc" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/iterative/dvc" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      #Build
      #pushd "$(mktemp -d)" >/dev/null 2>&1 && curl -qfsSL "$(curl -qfsSL "https://updater.dvc.org"| jq -r '.packages | .linux | .deb')" -o "dvc.deb" && sudo dpkg -i "./dvc.deb" ; popd >/dev/null 2>&1
       pip install --break-system-packages --upgrade pip || pip install --upgrade pip
       pip install --break-system-packages --force-reinstall --upgrade "git+https://github.com/iterative/dvc#egg=dvc[all]"
       pip install django flufl-lock pytest railroad sqlalchemy vcrpy --upgrade --break-system-packages
       #Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --filter="blob:none" --quiet "https://github.com/iterative/dvc" && cd "./dvc/dvc"
       cp "./__main__.py" "./dvc_pyinstaller.py"
       pyinstaller --clean "./dvc_pyinstaller.py" --noconfirm ; rm -rf "./dist" "$BINDIR/dvc_staticx" 2>/dev/null
       #This is overkill, but works
       pyinstaller --strip --onefile "./dvc_pyinstaller.py" --name "dvc" --noconfirm \
       --collect-submodules="adlfs" \
       --collect-submodules="aiobotocore" \
       --collect-submodules="aiohttp" \
       --collect-submodules="aiohttp-retry" \
       --collect-submodules="aioitertools" \
       --collect-submodules="aiooss2" \
       --collect-submodules="aiosignal" \
       --collect-submodules="aliyun-python-sdk-core" \
       --collect-submodules="aliyun-python-sdk-kms" \
       --collect-submodules="amqp" \
       --collect-submodules="annotated-types" \
       --collect-submodules="antlr4-python3-runtime" \
       --collect-submodules="anyio" \
       --collect-submodules="appdirs" \
       --collect-submodules="argcomplete" \
       --collect-submodules="asyncssh" \
       --collect-submodules="async-timeout" \
       --collect-submodules="atpublic" \
       --collect-submodules="attrs" \
       --collect-submodules="azure-core" \
       --collect-submodules="azure-datalake-store" \
       --collect-submodules="azure-identity" \
       --collect-submodules="azure-storage-blob" \
       --collect-submodules="bcrypt" \
       --collect-submodules="billiard" \
       --collect-submodules="boto3" \
       --collect-submodules="botocore" \
       --collect-submodules="cachetools" \
       --collect-submodules="celery" \
       --collect-submodules="certifi" \
       --collect-submodules="cffi" \
       --collect-submodules="charset-normalizer" \
       --collect-submodules="click" \
       --collect-submodules="click-didyoumean" \
       --collect-submodules="click-plugins" \
       --collect-submodules="click-repl" \
       --collect-submodules="colorama" \
       --collect-submodules="configobj" \
       --collect-submodules="crcmod" \
       --collect-submodules="cryptography" \
       --collect-submodules="decorator" \
       --collect-submodules="dictdiffer" \
       --collect-submodules="diskcache" \
       --collect-submodules="distro" \
       --collect-submodules="dpath" \
       --collect-submodules="dulwich" \
       --collect-submodules="dvc" \
       --collect-submodules="dvc-azure" \
       --collect-submodules="dvc-data" \
       --collect-submodules="dvc-gdrive" \
       --collect-submodules="dvc-gs" \
       --collect-submodules="dvc-hdfs" \
       --collect-submodules="dvc-http" \
       --collect-submodules="dvc-objects" \
       --collect-submodules="dvc-oss" \
       --collect-submodules="dvc-render" \
       --collect-submodules="dvc-s3" \
       --collect-submodules="dvc-ssh" \
       --collect-submodules="dvc-studio-client" \
       --collect-submodules="dvc-task" \
       --collect-submodules="dvc-webdav" \
       --collect-submodules="dvc-webhdfs" \
       --collect-submodules="entrypoints" \
       --collect-submodules="exceptiongroup" \
       --collect-submodules="filelock" \
       --collect-submodules="flatten-dict" \
       --collect-submodules="flufl.lock" \
       --collect-submodules="frozenlist" \
       --collect-submodules="fsspec" \
       --collect-submodules="funcy" \
       --collect-submodules="gcsfs" \
       --collect-submodules="gitdb" \
       --collect-submodules="gitpython" \
       --collect-submodules="google-api-core" \
       --collect-submodules="google-api-python-client" \
       --collect-submodules="googleapis-common-protos" \
       --collect-submodules="google-auth" \
       --collect-submodules="google-auth-httplib2" \
       --collect-submodules="google-auth-oauthlib" \
       --collect-submodules="google-cloud-core" \
       --collect-submodules="google-cloud-storage" \
       --collect-submodules="google-crc32c" \
       --collect-submodules="google-resumable-media" \
       --collect-submodules="grandalf" \
       --collect-submodules="gto" \
       --collect-submodules="h11" \
       --collect-submodules="httpcore" \
       --collect-submodules="httplib2" \
       --collect-submodules="httpx" \
       --collect-submodules="hydra-core" \
       --collect-submodules="idna" \
       --collect-submodules="isodate" \
       --collect-submodules="iterative-telemetry" \
       --collect-submodules="jmespath" \
       --collect-submodules="knack" \
       --collect-submodules="kombu" \
       --collect-submodules="markdown-it-py" \
       --collect-submodules="mdurl" \
       --collect-submodules="msal" \
       --collect-submodules="msal-extensions" \
       --collect-submodules="multidict" \
       --collect-submodules="networkx" \
       --collect-submodules="numpy" \
       --collect-submodules="oauth2client" \
       --collect-submodules="oauthlib" \
       --collect-submodules="omegaconf" \
       --collect-submodules="orjson" \
       --collect-submodules="oss2" \
       --collect-submodules="ossfs" \
       --collect-submodules="packaging" \
       --collect-submodules="pathspec" \
       --collect-submodules="platformdirs" \
       --collect-submodules="portalocker" \
       --collect-submodules="prompt-toolkit" \
       --collect-submodules="protobuf" \
       --collect-submodules="psutil" \
       --collect-submodules="pyarrow" \
       --collect-submodules="pyasn1" \
       --collect-submodules="pyasn1-modules" \
       --collect-submodules="pycparser" \
       --collect-submodules="pycryptodome" \
       --collect-submodules="pydantic" \
       --collect-submodules="pydantic-core" \
       --collect-submodules="pydot" \
       --collect-submodules="pydrive2" \
       --collect-submodules="pygit2" \
       --collect-submodules="pygments" \
       --collect-submodules="pygtrie" \
       --collect-submodules="PyJWT" \
       --collect-submodules="pyOpenSSL" \
       --collect-submodules="pyparsing" \
       --collect-submodules="python-dateutil" \
       --collect-submodules="PyYAML" \
       --collect-submodules="requests" \
       --collect-submodules="requests-oauthlib" \
       --collect-submodules="rich" \
       --collect-submodules="rsa" \
       --collect-submodules="ruamel.yaml" \
       --collect-submodules="ruamel.yaml.clib" \
       --collect-submodules="s3fs" \
       --collect-submodules="s3transfer" \
       --collect-submodules="scmrepo" \
       --collect-submodules="semver" \
       --collect-submodules="setuptools" \
       --collect-submodules="shortuuid" \
       --collect-submodules="shtab" \
       --collect-submodules="six" \
       --collect-submodules="smmap" \
       --collect-submodules="sniffio" \
       --collect-submodules="sqltrie" \
       --collect-submodules="sshfs" \
       --collect-submodules="tabulate" \
       --collect-submodules="tomlkit" \
       --collect-submodules="tqdm" \
       --collect-submodules="typer" \
       --collect-submodules="typing-extensions" \
       --collect-submodules="tzdata" \
       --collect-submodules="uritemplate" \
       --collect-submodules="urllib3" \
       --collect-submodules="vine" \
       --collect-submodules="voluptuous" \
       --collect-submodules="wcwidth" \
       --collect-submodules="webdav4" \
       --collect-submodules="wrapt" \
       --collect-submodules="yarl" \
       --collect-submodules="zc.lockfile" \
       --hidden-import="adlfs" \
       --hidden-import="aiobotocore" \
       --hidden-import="aiohttp" \
       --hidden-import="aiohttp-retry" \
       --hidden-import="aioitertools" \
       --hidden-import="aiooss2" \
       --hidden-import="aiosignal" \
       --hidden-import="aliyun-python-sdk-core" \
       --hidden-import="aliyun-python-sdk-kms" \
       --hidden-import="amqp" \
       --hidden-import="annotated-types" \
       --hidden-import="antlr4-python3-runtime" \
       --hidden-import="anyio" \
       --hidden-import="appdirs" \
       --hidden-import="argcomplete" \
       --hidden-import="asyncssh" \
       --hidden-import="async-timeout" \
       --hidden-import="atpublic" \
       --hidden-import="attrs" \
       --hidden-import="azure-core" \
       --hidden-import="azure-datalake-store" \
       --hidden-import="azure-identity" \
       --hidden-import="azure-storage-blob" \
       --hidden-import="bcrypt" \
       --hidden-import="billiard" \
       --hidden-import="boto3" \
       --hidden-import="botocore" \
       --hidden-import="cachetools" \
       --hidden-import="celery" \
       --hidden-import="certifi" \
       --hidden-import="cffi" \
       --hidden-import="charset-normalizer" \
       --hidden-import="click" \
       --hidden-import="click-didyoumean" \
       --hidden-import="click-plugins" \
       --hidden-import="click-repl" \
       --hidden-import="colorama" \
       --hidden-import="configobj" \
       --hidden-import="crcmod" \
       --hidden-import="cryptography" \
       --hidden-import="decorator" \
       --hidden-import="dictdiffer" \
       --hidden-import="diskcache" \
       --hidden-import="distro" \
       --hidden-import="dpath" \
       --hidden-import="dulwich" \
       --hidden-import="dvc" \
       --hidden-import="dvc-azure" \
       --hidden-import="dvc-data" \
       --hidden-import="dvc-gdrive" \
       --hidden-import="dvc-gs" \
       --hidden-import="dvc-hdfs" \
       --hidden-import="dvc-http" \
       --hidden-import="dvc-objects" \
       --hidden-import="dvc-oss" \
       --hidden-import="dvc-render" \
       --hidden-import="dvc-s3" \
       --hidden-import="dvc-ssh" \
       --hidden-import="dvc-studio-client" \
       --hidden-import="dvc-task" \
       --hidden-import="dvc-webdav" \
       --hidden-import="dvc-webhdfs" \
       --hidden-import="entrypoints" \
       --hidden-import="exceptiongroup" \
       --hidden-import="filelock" \
       --hidden-import="flatten-dict" \
       --hidden-import="flufl.lock" \
       --hidden-import="frozenlist" \
       --hidden-import="fsspec" \
       --hidden-import="funcy" \
       --hidden-import="gcsfs" \
       --hidden-import="gitdb" \
       --hidden-import="gitpython" \
       --hidden-import="google-api-core" \
       --hidden-import="google-api-python-client" \
       --hidden-import="googleapis-common-protos" \
       --hidden-import="google-auth" \
       --hidden-import="google-auth-httplib2" \
       --hidden-import="google-auth-oauthlib" \
       --hidden-import="google-cloud-core" \
       --hidden-import="google-cloud-storage" \
       --hidden-import="google-crc32c" \
       --hidden-import="google-resumable-media" \
       --hidden-import="grandalf" \
       --hidden-import="gto" \
       --hidden-import="h11" \
       --hidden-import="httpcore" \
       --hidden-import="httplib2" \
       --hidden-import="httpx" \
       --hidden-import="hydra-core" \
       --hidden-import="idna" \
       --hidden-import="isodate" \
       --hidden-import="iterative-telemetry" \
       --hidden-import="jmespath" \
       --hidden-import="knack" \
       --hidden-import="kombu" \
       --hidden-import="markdown-it-py" \
       --hidden-import="mdurl" \
       --hidden-import="msal" \
       --hidden-import="msal-extensions" \
       --hidden-import="multidict" \
       --hidden-import="networkx" \
       --hidden-import="numpy" \
       --hidden-import="oauth2client" \
       --hidden-import="oauthlib" \
       --hidden-import="omegaconf" \
       --hidden-import="orjson" \
       --hidden-import="oss2" \
       --hidden-import="ossfs" \
       --hidden-import="packaging" \
       --hidden-import="pathspec" \
       --hidden-import="platformdirs" \
       --hidden-import="portalocker" \
       --hidden-import="prompt-toolkit" \
       --hidden-import="protobuf" \
       --hidden-import="psutil" \
       --hidden-import="pyarrow" \
       --hidden-import="pyasn1" \
       --hidden-import="pyasn1-modules" \
       --hidden-import="pycparser" \
       --hidden-import="pycryptodome" \
       --hidden-import="pydantic" \
       --hidden-import="pydantic-core" \
       --hidden-import="pydot" \
       --hidden-import="pydrive2" \
       --hidden-import="pygit2" \
       --hidden-import="pygments" \
       --hidden-import="pygtrie" \
       --hidden-import="PyJWT" \
       --hidden-import="pyOpenSSL" \
       --hidden-import="pyparsing" \
       --hidden-import="python-dateutil" \
       --hidden-import="PyYAML" \
       --hidden-import="requests" \
       --hidden-import="requests-oauthlib" \
       --hidden-import="rich" \
       --hidden-import="rsa" \
       --hidden-import="ruamel.yaml" \
       --hidden-import="ruamel.yaml.clib" \
       --hidden-import="s3fs" \
       --hidden-import="s3transfer" \
       --hidden-import="scmrepo" \
       --hidden-import="semver" \
       --hidden-import="setuptools" \
       --hidden-import="shortuuid" \
       --hidden-import="shtab" \
       --hidden-import="six" \
       --hidden-import="smmap" \
       --hidden-import="sniffio" \
       --hidden-import="sqltrie" \
       --hidden-import="sshfs" \
       --hidden-import="tabulate" \
       --hidden-import="tomlkit" \
       --hidden-import="tqdm" \
       --hidden-import="typer" \
       --hidden-import="typing-extensions" \
       --hidden-import="tzdata" \
       --hidden-import="uritemplate" \
       --hidden-import="urllib3" \
       --hidden-import="vine" \
       --hidden-import="voluptuous" \
       --hidden-import="wcwidth" \
       --hidden-import="webdav4" \
       --hidden-import="wrapt" \
       --hidden-import="yarl" \
       --hidden-import="zc.lockfile"
       #Get meta
       echo -e "\n[+] PyInstaller: $(du -sh ./dist/dvc)\n"
       #Staticx
       #fails: Invalid ELF image: Magic number does not match
       staticx --loglevel DEBUG "./dist/dvc" --strip "$BINDIR/dvc_staticx"
       echo -e "\n[+] PyInstaller: $(du -sh $BINDIR/dvc_staticx)\n" ; popd >/dev/null 2>&1
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