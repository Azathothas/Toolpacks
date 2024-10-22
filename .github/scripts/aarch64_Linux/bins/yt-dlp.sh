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
    #yt-dlp : A feature-rich command-line audio/video downloader
     export BIN="yt-dlp"
     export SOURCE_URL="https://github.com/yt-dlp/yt-dlp"
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      #Build: https://github.com/yt-dlp/yt-dlp/blob/master/bundle/docker/static/entrypoint.sh
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" --depth="1" "https://github.com/yt-dlp/yt-dlp" && cd "./yt-dlp"
       export channel="nightly"
       export origin="yt-dlp/yt-dlp"
       version="$(git tag --sort="-v:refname" | head -n 1 | tr -d "[:space:]")" && export version="${version}"
       if [[ -z "${version}" ]]; then
         #version="$(git log --oneline --format="%h" | head -n 1 | tr -d "[:space:]")" && export version="${version}"
         version="$(date -u +"%Y.%m.%d")" && export version="${version}"
       fi
       #https://github.com/yt-dlp/yt-dlp/blob/master/.github/workflows/build.yml
       cd "./bundle/docker"
       sed 's/yt-dlp_linux/yt-dlp_linux_aarch64/g' -i "./static/entrypoint.sh"
       channel="${channel}" origin="${origin}" version="${version}" docker compose up --build "static"
       #copy
       INSTANCE_ID="$(docker ps -a --format '{{json .}}' | jq -rs 'sort_by(.CreatedAt) | reverse | .[] | select(.Status | contains("Exited")) | .ID' | head -n 1)" && export INSTANCE_ID="${INSTANCE_ID}"
       docker cp "${INSTANCE_ID}:/build/yt-dlp_linux_aarch64" "./yt-dlp"
       #Meta
       file "./yt-dlp" && du -sh "./yt-dlp" ; cp "./yt-dlp" "${BINDIR}/yt-dlp"
       objcopy --remove-section=".comment" --remove-section=".note.*" "${BINDIR}/yt-dlp"
       strip --strip-debug --strip-dwo --strip-unneeded -R ".comment" -R ".gnu.version" "${BINDIR}/yt-dlp"
       realpath "${BINDIR}/yt-dlp" | xargs -I {} sh -c 'file {}; b3sum {}; sha256sum {}; du -sh {}'
      #Delete Containers
       docker stop "${INSTANCE_ID}" 2>/dev/null ; docker rm "${INSTANCE_ID}"
       unset channel INSTANCE_ID origin version; popd >/dev/null 2>&1
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