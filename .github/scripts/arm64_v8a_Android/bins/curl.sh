#!/usr/bin/env bash

#-------------------------------------------------------#
#Sanity Checks
if [ "$BUILD" != "YES" ] || \
   [ -z "$ANDROID_NDK_TOOLCHAIN_ROOT" ] || \
   [ -z "$ANDROID_NDK_TOOLCHAIN_BIN" ] || \
   [ -z "$ANDROID_NDK_SYSROOT" ] || \
   [ -z "$BINDIR" ] || \
   [ -z "$EGET_EXCLUDE" ] || \
   [ -z "$EGET_TIMEOUT" ] || \
   [ -z "$GIT_TERMINAL_PROMPT" ] || \
   [ -z "$GIT_ASKPASS" ] || \
   [ -z "$GITHUB_TOKEN" ] || \
   [ -z "$SYSTMP" ] || \
   [ -z "$TOOLPACKS_ANDROID_ABI" ] || \
   [ -z "$TOOLPACKS_ANDROID_APILEVEL_DYNAMIC" ] || \
   [ -z "$TOOLPACKS_ANDROID_APILEVEL_STATIC" ] || \
   [ -z "$TOOLPACKS_ANDROID_BUILD_DYNAMIC" ] || \
   [ -z "$TOOLPACKS_ANDROID_BUILD_STATIC" ] || \
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
   #curl : A command line tool for transferring files with URL syntax 
     export BIN="curl" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/curl/curl" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Fetch
      # eval "$EGET_TIMEOUT" eget "https://github.com/stunnel/static-curl" --asset "linux" --asset "musl" --asset "aarch64" --asset "tar" --asset "^dev" --file "curl" "$EGET_EXCLUDE" --to "$BINDIR/curl"
      # eval "$EGET_TIMEOUT" eget "https://github.com/stunnel/static-curl" --asset "linux" --asset "musl" --asset "aarch64" --asset "tar" --asset "^dev" --file "trurl" "$EGET_EXCLUDE" --to "$BINDIR/trurl"     
      #Build (ndk-pkg)
       pushd "$($TMPDIRS)" > /dev/null 2>&1
       docker exec -it "ndk-pkg" ndk-pkg install "${TOOLPACKS_ANDROID_BUILD_DYNAMIC}/curl" --profile="release" --jobs="$(($(nproc)+1))"
       TOOLPACKS_ANDROID_BUILDIR="$(docker exec -it "ndk-pkg" ndk-pkg tree "${TOOLPACKS_ANDROID_BUILD_DYNAMIC}/curl" --dirsfirst -L 1 | grep -o '/.*/.*' | tail -n1 | tr -d '[:space:]')" && export TOOLPACKS_ANDROID_BUILDIR="${TOOLPACKS_ANDROID_BUILDIR}"
       docker exec -it "ndk-pkg" ls "${TOOLPACKS_ANDROID_BUILDIR}/bin"
      #Copy 
       docker cp "ndk-pkg:/${TOOLPACKS_ANDROID_BUILDIR}/bin/." "./"
       #Meta 
       file "./curl" && du -sh "./curl" ; aarch64-linux-gnu-readelf -d "./curl"
       cp "./curl" "$BINDIR/curl"
       #get cert
       eget "https://curl.se/ca/cacert.pem" --to "$BINDIR/curl_cacert.pem"
      #Test [PREFIX=/data/data/com.termux/files/usr]
       timeout -k 10s 20s docker run --privileged -it --rm --platform="linux/arm64" --network="host" -v "$BINDIR:/mnt" "termux/termux-docker:aarch64" "/mnt/curl" --version
      #Cleanup Container
       docker exec -it "ndk-pkg" ndk-pkg uninstall "${TOOLPACKS_ANDROID_BUILD_DYNAMIC}/curl"
       docker exec -it "ndk-pkg" ndk-pkg cleanup
       popd > /dev/null 2>&1
      #Fixes
       # certs : curl -kqfsSLO https://curl.se/ca/cacert.pem
       #       : export SSL_CERT_FILE="$PWD/cacert.pem"
       # specify in curl : --cacert="$PWD/cacert.pem"
       # specify in wget : --ca-certificate="$PWD/cacert.pem" 
fi
#-------------------------------------------------------#

#-------------------------------------------------------#
##Cleanup
unset SKIP_BUILD ; export BUILT="YES"
#In case of Android Polluted env
unset TOOLPACKS_ANDROID_BUILDIR
#In case of build polluted env
unset ANDROID_API_LEVEL ANDROID_LIBRARY_DIR ANDROID_TARGET AR AS CC CFLAGS CPP CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LD LDFLAGS LIBS NM OBJCOPY OBJDUMP RANLIB READELF SIZE STRINGS STRIP SYSROOT
#In case of go polluted env
unset GOARCH GOOS CGO_ENABLED CGO_CFLAGS
#PKG Config
unset PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_SYSTEM_INCLUDE_PATH PKG_CONFIG_SYSTEM_LIBRARY_PATH
#-------------------------------------------------------#