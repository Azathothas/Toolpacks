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
    #czkawka: Multi functional app to find duplicates, empty folders, similar images etc.
     export BIN="czkawka"
     export SOURCE_URL="https://github.com/qarmin/czkawka"
     echo -e "\n\n [+] (Building | Fetching) ${BIN} :: ${SOURCE_URL} [$(TZ='UTC' date +'%A, %Y-%m-%d (%I:%M:%S %p)') UTC]\n"
      #Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" --pull="always" "azathothas/alpine-builder:latest" \
        bash -l -c '
        #Setup ENV
         mkdir -p "/build-bins" && pushd "$(mktemp -d)" >/dev/null 2>&1
         source "$HOME/.cargo/env"
         export RUST_TARGET="aarch64-unknown-linux-musl"
         rustup target add "$RUST_TARGET"
         export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C link-self-contained=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=clang -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,--Bstatic -C link-arg=-Wl,--static -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/qarmin/czkawka" && cd "./czkawka"
         SRC_DIR="$(realpath .)" && export SRC_DIR="${SRC_DIR}"
         echo -e "\n[+] Target: $RUST_TARGET\n"
         echo -e "\n[+] Flags: $RUSTFLAGS\n"
         sed "/^\[profile\.release\]/,/^$/d" -i "./Cargo.toml" ; echo -e "\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true" >> "./Cargo.toml"
         rm rust-toolchain* 2>/dev/null
         cargo update ; cd "${SRC_DIR}/czkawka_cli"
         #https://github.com/qarmin/czkawka/tree/master/czkawka_cli#compilation
         #cargo metadata --no-deps --format-version 1 | jq ".packages[0].features | to_entries[]" | less
         apk update --no-interactive 2>/dev/null
         apk add libheif libheif-dev libraw libraw-dev --latest --upgrade --no-interactive 2>/dev/null
         #heif --> fails
         cargo build --target "$RUST_TARGET" --features "libraw" --release --jobs="$(($(nproc)+1))" --keep-going
         find "${SRC_DIR}/target/$RUST_TARGET/release" -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath | xargs -I {} cp --force {} /build-bins/
        #Strip & Meta
         find "/build-bins/" -type f -exec objcopy --remove-section=".comment" --remove-section=".note.*" "{}" \;
         find "/build-bins/" -type f ! -name "*.no_strip" -exec strip --strip-debug --strip-dwo --strip-unneeded --preserve-dates "{}" \; 2>/dev/null
         cp "/build-bins/czkawka_cli" "/build-bins/czkawka-cli"
         file "/build-bins/"* && du -sh "/build-bins/"* 
         popd >/dev/null 2>&1
        '
      #Copy 
       docker cp "alpine-builder:/build-bins/." "$(pwd)/" ; find "." -maxdepth 1 -type f -exec file -i "{}" \; | grep "application/.*executable" | cut -d":" -f1 | xargs realpath
       #Meta
       find "." -maxdepth 1 -type f | xargs -I {} sh -c 'file {}; b3sum {}; sha256sum {}; du -sh {}'
       sudo rsync -av --copy-links --exclude="*/" "./." "$BINDIR"
      #Delete Containers
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builders"
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