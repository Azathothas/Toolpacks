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
     #cpu : cpu command in Go, inspired by the Plan 9 cpu command
     export BIN="cpu" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/u-root/cpu" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build 
       pushd "$($TMPDIRS)" >/dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/u-root/cpu" && cd "./cpu"
       #cpu
       GOOS="linux" GOARCH="amd64" CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" -o "./bin/cpu" "./cmds/cpu/." ; cp "./bin/cpu" "$BINDIR/cpu"
       GOOS="linux" GOARCH="amd64" CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" -o "./bin/cpud" "./cmds/cpud/." ; cp "./bin/cpud" "$BINDIR/cpud"
       GOOS="linux" GOARCH="amd64" CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" -o "./bin/decpu" "./cmds/decpu/." ; cp "./bin/decpu" "$BINDIR/decpu"
       GOOS="linux" GOARCH="amd64" CGO_ENABLED="0" go build -v -ldflags="-buildid= -s -w -extldflags '-static'" -tags "mDNS" -o "./bin/decpud" "./cmds/cpud/." ; cp "./bin/decpud" "$BINDIR/decpud"
       popd >/dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
       #p9cpu
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder" 2>/dev/null
       docker run --privileged --net="host" --name "alpine-builder" "azathothas/alpine-builder:latest" \
        sh -c '
        #Setup ENV
         tempdir="$(mktemp -d)" ; mkdir -p "$tempdir" && cd "$tempdir"
         mkdir -p "/build-bins"
         source "$HOME/.cargo/env"
         export RUST_TARGET="x86_64-unknown-linux-musl"
         rustup target add "$RUST_TARGET"
         export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C link-self-contained=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=clang -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,--Bstatic -C link-arg=-Wl,--static -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"
        #Build
         git clone --filter "blob:none" --quiet "https://github.com/u-root/cpu" && cd "./cpu/p9cpu"
         echo -e "\n[+] Target: $RUST_TARGET\n"
         echo -e "\n[+] Flags: $RUSTFLAGS\n"
         sed "/^\[profile\.release\]/,/^$/d" -i "./Cargo.toml" ; echo -e "\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true" >> "./Cargo.toml"
         rm rust-toolchain* 2>/dev/null
         cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going
         ls "./target/$RUST_TARGET/release" ; file "./target/$RUST_TARGET/release"/*
         cp "./target/$RUST_TARGET/release/p9cpu" "/build-bins/p9cpu"
         cp "./target/$RUST_TARGET/release/p9cpud" "/build-bins/p9cpud"
        '
       #Copy 
       docker cp "alpine-builder:/build-bins/p9cpu" "$BINDIR/p9cpu"
       docker cp "alpine-builder:/build-bins/p9cpud" "$BINDIR/p9cpud"
      #Delete Containers
       docker stop "alpine-builder" 2>/dev/null ; docker rm "alpine-builder"
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
#-------------------------------------------------------#