#### [Index](https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md)
> - [**Cargo (Rust)**<img src="https://github.com/Azathothas/Toolpacks/assets/58171889/27ccd9d9-7a9d-43b2-92e5-bc43bb969eb3" width="30" height="30">](https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#cargocross-rust)
> - [**Go**<img src="https://github.com/Azathothas/Toolpacks/assets/58171889/46dbcab3-44cd-4527-a941-5de05713bbe9" width="30" height="30">](https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#go)
> - [**Make**<img src="https://github.com/Azathothas/Toolpacks/assets/58171889/2ea3fbfb-e93e-4fef-94ac-f506befb0e95" width="30" height="30">](https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#make)
> - [**Nim**<img src="https://github.com/Azathothas/Toolpacks/assets/58171889/745a11a6-7569-439d-924c-846877ed82a9" width="30" height="30">](https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#nim)
> - [**Zig**<img src="https://github.com/Azathothas/Toolpacks/assets/58171889/a02545f0-9b70-49df-bf6b-4a823bd0e1e9" width="30" height="30">](https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#zig-musl)
> 
> - [Appendix](https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#appendix)
> > - [Tests](https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#tests)
- ##### Note: All `Built/Compiled` Binaries must be [***throughly tested*** using](https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#tests) https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#tests
---
- #### [Make](https://wiki.gentoo.org/wiki/GCC_optimization)
```bash
!#CFLAGS :: https://man7.org/linux/man-pages/man1/gcc.1.html
#        :: https://wiki.gentoo.org/wiki/GCC_optimization
#        :: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
# -O2 --> Optimizes by 2x [https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-O2]
# -fpie/-fPIE --> Allows position independent executable (Used by -static-pie in LDFALGS)
#  -fpie | -fPIPE both define the macros "__pie__" and "__PIE__". The macros have the value 1 for -fpie and 2 for -fPIE.
# -w --> Inhibits all warning messages [-Wall --> All Warnings | -Werror --> Treats warnings as failures]
# -pipe --> Use pipes rather than temporary files (Consumes Memory/RAM, but faster)
#
# ☣️ -fpic/-fPIC  --> generates position independent code (PIC) for SHARED libraries. Use only for Dynamic Linking
#    # https://gcc.gnu.org/onlinedocs/gcc/Code-Gen-Options.html#index-fpic
# ☣️ -Og --> completely disables a number of optimization passes, meant for DEBUG builds
# ☣️ -g --> This option includes debugging information in the compiled executable
#
!#LTO :: https://wiki.gentoo.org/wiki/LTO
#     :: https://gcc.gnu.org/wiki/LinkTimeOptimization
#     :: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-flto
# -flto=auto ($CFLAGS) --> Uses GNU make’s job server (if available) OR falls back to autodetection of the number of CPU threads present in the system

!#LDFLAGS :: https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html
# -static --> This overrides -pie and prevents linking with the shared libraries 
#  Note: This sets -static as defaults, so for an example: static-libgcc is used instead of -shared-libgcc
# -static-pie --> Produce a static position independent executable on targets that support it
#  Note : -pie --> Produces Dynamically linked position independent executable, hence use -static-pie
#       : Also requires that we pass -fpie | -fPIE as CFLAGS
# ⚠️ -no-pie --> Don’t produce a dynamically linked position independent executable. [This disables pie for everything, only use if default doesn't work]
# -s --> Strips all symbol table and relocation information from the executable. 
# 
# -fuse-ld=mold --> Use mold as ld [https://github.com/rui314/mold/blob/main/docs/mold.md] 🦠
# Remove the opts if mold isn't installed or you don't want to use mold 
# -Wl --> Passes option to the linker, mold in this case
#  Note: Must use -Wl,$MOLD_OPTIONS for mold
# ⚠️⚠️ WARNING: pass these only if default LDFLAGS didn't work and mold has to be used specifically
#    Often these executables result in Segmentation Faults/Core Dumps
# ⚠️  -Wl,--pie --> Create a position-independent executable. (This is either Dynamic/Static based on other $OPTS)
#     -Wl,--Bstatic --> Do not link against shared libraries. (Similar to -no-pie)
#     -Wl,--static --> Do not link against shared libraries. (Similar to -static)
#     -Wl,-S --> Strips all symbol table and relocation information from the executable. (Similar to -s)
#     -Wl,--build-id --> Embeds (md5 | sha1 | sha256 | uuid | 0x${hexstring} | none), default is sha1. 
#     -Wl,--no-build-id --> same as -Wl,--build-id=none

❯ !# static-pie + mold 🦠
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
unset CFLAGS && export CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe ${CFLAGS}"
unset CXXFLAGS && export CXXFLAGS="${CFLAGS}"
unset LDFLAGS && export LDFLAGS="-static -static-pie -pie -s -fuse-ld=mold -Wl,--Bstatic -Wl,--pie -Wl,--static -Wl,-S -Wl,--build-id=none ${LDFLAGS}"

❯ !# static-pie + No mold
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
unset CFLAGS && export CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe ${CFLAGS}"
unset CXXFLAGS && export CXXFLAGS="${CFLAGS}"
unset LDFLAGS && export LDFLAGS="-static -static-pie -pie -s -Wl,-S -Wl,--build-id=none ${LDFLAGS}"

❯ !# static (no pie) + mold 🦠
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
unset CFLAGS && export CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe ${CFLAGS}"
unset CXXFLAGS && export CXXFLAGS="${CFLAGS}"
unset LDFLAGS && export LDFLAGS="-static -static-pie -no-pie -s -fuse-ld=mold -Wl,--Bstatic -Wl,--static -Wl,-S -Wl,--build-id=none ${LDFLAGS}"

❯ !# static (no pie) + No mold
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
unset CFLAGS && export CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe ${CFLAGS}"
unset CXXFLAGS && export CXXFLAGS="${CFLAGS}"
unset LDFLAGS && export LDFLAGS="-static -static-pie -no-pie -s -Wl,-S -Wl,--build-id=none ${LDFLAGS}"

❯ !# Make
# -B | --always-make --> Unconditionally make all targets. 
# -e | --environment-overrides --> Prefer environment variable over variables from makefiles.
# -f | --file=file | --makefile=FILE --> Path to makefile
# -j | --jobs="$(($(nproc)+1))" --> Fancy shell maths to auto specify maximum threads for make jobs
# -k | --keep-going --> Continue as much as possible after an error
# -n | --just-print | --dry-run | --recon --> Print the commands that would be executed, but do not execute them.
# -s | --silent | --quiet --> Silent operation; do not print the commands as they are executed.

# ${ADDITIONAL_ARGS} --> replace with yours, otherwise is silently ignored
# Run: make dest clean 2>/dev/null ; make clean 2>/dev/null --> To cleanup
# Run with `--dry-run` for sanity checks
make CFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" CXXFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" LDFLAGS="$LDFLAGS ${ADDITIONAL_ARGS}" --jobs="$(($(nproc)+1))" --keep-going
```

---
- #### [Go](https://pkg.go.dev/cmd/go)
```bash
!# REF :: https://pkg.go.dev/cmd/go
#      :: https://mt165.co.uk/blog/static-link-go/
#      :: https://www.arp242.net/static-go.html
#      :: https://dubo-dubon-duponey.medium.com/a-beginners-guide-to-cross-compiling-static-cgo-pie-binaries-golang-1-16-792eea92d5aa
## https://go.dev/doc/install/source#environment
# GOARCH | GOOS --> go tool dist list [Lists All Targets operating systems and compilation architectures]
# GOARCH="amd64" GOOS="linux" --> x86_64 Linux
# GOARCH="arm64" GOOS="linux" --> aarch64 Linux
# CGO_ENABLED=0 --> Disables Linking against C libraries
#   This needs to be enabled sometimes, such sql libs, in such cases, it is also recommended to use CGO_CFLAGS (Same as CFLAGS)
#   CGO_ENABLED="1" CGO_CFLAGS="-O2 -static -w -pipe"
#
## -buildmode --> kind of object file is to be built (Help: go help buildmode )
# -buildmode=default --> Default, doesn't need to be specified
#    Listed main packages are built into executables and listed non-main packages are built into .a files
# -buildmode=exe --> Build the listed main packages and everything they import into executables. Packages not named main are ignored.
# -buildmode=pie --> Same as -buildmode=exe but position independent executables (PIE) 
#
## -gcflags --> compiler flags that can be passed to the Go compiler (go build | go install).
# REF : https://copyprogramming.com/howto/what-s-go-cmd-option-gcflags-all-possible-values
# Help : go tool compile -help
# ☣️ -N --> Disables optimizations. This is for Debug Builds
# ☣️ -l --> Disable inlining (Disables optimizations), also for Debug Builds
#
## https://pkg.go.dev/cmd/link
# -ldflags --> options passed to the Go linker (ld) during the build process
#    -buildid= --> Strips all buildids from executables
#    -s --> Omit the symbol table and debug information.
#    -w --> Omits the DWARF symbol table.
#
## go build -ldflags="-help" (Must have a .go file)
# -linkmode --> External (Requires CGO_ENABLED="1")
# -extld --> use linker when linking in external mode
# -extldflags flags --> pass flags to external linker
# Use mold as ld [https://github.com/rui314/mold/blob/main/docs/mold.md] 🦠
#  -ldflags="-buildid= -s -w -linkmode external -extld clang -extldflags '-static -s -fuse-ld=mold -Wl,--Bstatic -Wl,--static -Wl,-S -Wl,--build-id=none'"
#  # Using mold as ld, means no zig-musl
#
# ☣️ -a --> forces rebuilding of packages that are already up-to-date.
#    # This just wastes resources for no reason. go clean cache already gets rid of cache
#    # https://gcc.gnu.org/onlinedocs/gcc/Code-Gen-Options.html#index-fpic
# ☣️ -Og --> completely disables a number of optimization passes, meant for DEBUG builds
# ☣️ -g --> This option includes debugging information in the compiled executable
# 
# trimpath --> Removes all file system paths from the resulting executable
#   This sometimes causes weird behaviours: https://github.com/golang/go/issues/57328#issuecomment-1353330403
#
## go clean :: https://pkg.go.dev/cmd/go/internal/clean
# -cache --> Removes the entire go build cache (This already purges testcache, modcache & fuzzcache. Others are for redundancy)
# -testcache --> Expire all test results in the go build cache.
# -modcache --> Removes the entire module download cache + unpacked source code of versioned dependencies.
# -fuzzcache --> Removes files stored in the Go build cache for fuzz testing

!#ENV
export GOARCH="amd64" #arm64 (To list: go tool dist list)
export GOOS="linux" # (To list: go tool dist list)
export CGO_ENABLED="1" # To link against musl libc using zig OR build in pie mode
export CGO_CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe" #https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#make
export ZIG_LIBC_TARGET="x86_64-linux-musl" #https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#zig-musl
export CC="zig cc -target $ZIG_LIBC_TARGET"
export CXX="zig c++ -target $ZIG_LIBC_TARGET"

❯ !# static-no-pie + stripped [Go Built-In] [RECOMMENDED]
# This produces smallest binaries & compiles the quickest
CGO_ENABLED="0" CC="" CXX="" go build -v -trimpath -ldflags="-buildid= -s -w -extldflags '-static'"

❯ !# static-pie + stripped [Go Built-In] [NOT-RECOMMENDED]
# This by default will link against shared libs from glibc (a bad idea) unless the Host is true musl only
# Binaries are larger in size & build/linking takes a long time
# Note: Multiple/Duplicatted -s -w -buildmode flags are specified as redundancy
CC="" CXX="" go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '-s -w -static-pie -Wl,--build-id=none'"

❯ !# static-pie + stripped [zig musl] [RECOMMENDED]
# This links against bundled musl libc with zig.
# Binaries are larger in size & build/linking takes a long time
# Note: Multiple/Duplicatted -s -w -build-id flags are specified as redundancy
go build -v -trimpath -buildmode="pie" -ldflags="-s -w -buildid= -linkmode=external -extldflags '-s -w -static-pie -Wl,--build-id=none'"


```

---
- #### [Nim](https://nim-lang.org/docs/nimc.html) **WIP**
```bash
!# REF :: https://scripter.co/nim-deploying-static-binaries/
#      :: https://hookrace.net/blog/nim-binary-size/
 nim --gcc.exe:musl-gcc --gcc.kinerexe:musl-gcc -d:release --opt:size --passL:-static c hello
```

---
- #### [Cargo/Cross (Rust)](https://doc.rust-lang.org/cargo/commands/cargo-build.html)
```bash
!# REF :: http://zderadicka.eu/static-build-of-rust-executables/
#      :: https://doc.rust-lang.org/rustc/codegen-options/index.html
#      :: https://msfjarvis.dev/posts/building-static-rust-binaries-for-linux/

❯ !# Check if there's feature tags 
# REF: https://doc.rust-lang.org/rustc/codegen-options/index.html#target-feature
rustc --print target-features

❯ !# Check for dependencies that dynamically link to libraries
# REF: https://msfjarvis.dev/posts/building-static-rust-binaries-for-linux/#other-potential-problems
cargo tree | grep -- -sys
# If the deps contain dynamic libs by default, using a custom Cargo.toml or build.rs sometimes work
# Cargo.toml :: https://msfjarvis.dev/g/androidx-release-watcher/b67a212106d8
# Build.rs   :: https://blog.davidvassallo.me/2021/06/10/lessons-learned-building-statically-linked-rust-binaries-openssl/
#            :: http://zderadicka.eu/static-build-of-rust-executables/

❯ !# List Targets
rustup target list

❯ !# Export Target
export RUST_TARGET="x86_64-unknown-linux-musl"
# Example: x86_64-unknown-linux-musl || aarch64-unknown-linux-musl

❯ !# Flags :: https://doc.rust-lang.org/cargo/reference/environment-variables.html
## So called codegen options are similar to CFLAGS/LDFLAGS, passed via -C as $RUSTFLAGS env 
# -C target-feature=+crt-static --> Statically Links the platform C library into the final binary
# -C default-linker-libraries=yes --> Linker Includes its default libraries. [Default is -nodefaultlibs | default-linker-libraries=no]
# -C link-self-contained=yes --> Uses only libraries/objects shipped with Rust [Max Protability]
# -C debuginfo=none --> no debug info at all [Turned on by default]
# -C strip=symbols --> strips debuginfo + symbols from the final binary
# -C prefer-dynamic=no --> use static linking (the default).
#
## Optimizations : https://doc.rust-lang.org/rustc/codegen-options/index.html#lto
# -C lto=yes --> uses link time optimizations, (Consumes Memory/RAM, also slower) [By default, set to thin]
#  This requires -C embed-bitcode=yes AND this will likely fail if RUST_TARGET="x86_64-unknown-linux-gnu"
# -C linker-plugin-lto=yes --> Enables linker plugin LTO. [Defers LTO optimizations to the linker]
# -C opt-level=3 --> Optimizes everything #https://doc.rust-lang.org/rustc/codegen-options/index.html#opt-level
#
## Linking :: https://doc.rust-lang.org/rustc/codegen-options/index.html#linker
#      REF :: https://github.com/rui314/mold?tab=readme-ov-file#how-to-use
# Uses mold as linker 🦠 , don't use this flags if default ld is preferred
# https://github.com/rui314/mold/blob/main/docs/mold.md
# -C linker=clang --> Clang instead of gcc/cc as otherwise -fuse-ld= would be treated as Unknown Arg
# -C link-arg=-fuse-ld=$(which mold) --> Uses Complete path to mold
# ⚠️⚠️ WARNING: pass these only if default LDFLAGS didn't work and mold has to be used specifically
#    Often these executables result in Segmentation Faults/Core Dumps
# ⚠️ -C link-arg=-Wl,--pie     --> Create a position-independent executable.
#    -C link-arg=-Wl,--Bstatic --> Do not link against shared libraries. (Similar to -no-pie)
#    -C link-arg=-Wl,--static  --> Do not link against shared libraries. (Similar to -static)
#    -C link-arg=-Wl,-S        --> Strips all symbol table and relocation information from the executable. (Similar to -s)
#    -C link-arg=-Wl,--build-id=none --> Embeds (md5 | sha1 | sha256 | uuid | 0x${hexstring} | none), default is sha1.
#
#   If mold is not used, then at least use:
#    -C link-args=-Wl,-S -C link-args=-Wl,--build-id=none --> Uses Default ld with Sane Opts

❯ !# static-pie + mold 🦠
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C link-self-contained=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=clang -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,--Bstatic -C link-arg=-Wl,--pie -C link-arg=-Wl,--static -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"

❯ !# static(?pie) + mold 🦠
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C link-self-contained=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C linker=clang -C link-arg=-fuse-ld=$(which mold) -C link-arg=-Wl,--Bstatic -C link-arg=-Wl,--static -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"

❯ !# static(?pie) + No mold
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
export RUSTFLAGS="-C target-feature=+crt-static -C default-linker-libraries=yes -C link-self-contained=yes -C prefer-dynamic=no -C embed-bitcode=yes -C lto=yes -C opt-level=3 -C debuginfo=none -C strip=symbols -C link-arg=-Wl,-S -C link-arg=-Wl,--build-id=none"

❯ !# Build :: https://doc.rust-lang.org/cargo/commands/cargo-build.html
rustup target add "$RUST_TARGET"
echo -e "\n[+]RUSTFLAGS: $RUSTFLAGS\n"
sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = 3\nlto = true' >> "./Cargo.toml"
cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going

#OUTPUT is usually in: "./target/$RUST_TARGET/release/"
# OR: cargo check --metadata-format="json" --quiet 
# --out-dir --> https://github.com/rust-lang/cargo/issues/6790


❯ !# NOTES on *unknown-linux-gnu $RUST_TARGET
# Remove/Turn off the following:
#  -C link-self-contained=yes --> REMOVED || -C link-self-contained=yes
#  -C lto=yes --> REMOVED

❯ !# NOTES on using cross-rs : https://github.com/cross-rs/cross
# ❯ !# static(?pie) + No mold will work, but as soon as there's additional dependencies on things like openssl, it will fail
# Also, mold can't be used as linker
# Rather than cross, Use https://github.com/BlackDex/rust-musl

❯ !# NOTES on using https://github.com/BlackDex/rust-musl
# --rm --> Automatically remove the container when it exits
# -it --> Keeps STDIN open even if not attached & Allocates a pseudo-TTY
# -v $(pwd):/home/rust/src --> Mounts the current working directory ($(pwd)) to the /home/rust/src directory inside the Container
!# Export $RUST_TARGET && $RUSTFLAGS and then run
# aarch64-unknown-linux-musl
docker run --rm -it -v "$(pwd):/home/rust/src" "docker.io/blackdex/rust-musl:aarch64-musl" cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going
# x86_64-unknown-linux-musl
docker run --rm -it -v "$(pwd):/home/rust/src" "docker.io/blackdex/rust-musl:x86_64-musl" cargo build --target "$RUST_TARGET" --release --jobs="$(($(nproc)+1))" --keep-going
```

---
- #### [zig-musl](https://ziglang.org/learn/overview/#zig-is-also-a-c-compiler)
```bash
!# REF :: https://andrewkelley.me/post/zig-cc-powerful-drop-in-replacement-gcc-clang.html
#      :: https://ziglang.org/learn/overview/#zig-is-also-a-c-compiler

❯ !# List Targets
zig targets | jq -r '.libc[]'

❯ !# Export Target
export ZIG_LIBC_TARGET="x86_64-linux-musl"
# Example: x86_64-linux-musl || aarch64-linux-musl

❯ !# Flags :: https://fig.io/manual/zig/cc
unset AR CC CFLAGS CXX CXXFLAGS DLLTOOL HOST_CC HOST_CXX LDFLAGS OBJCOPY RANLIB
unset CC && export CC="zig cc -target $ZIG_LIBC_TARGET"
unset CXX && export CXX="zig c++ -target $ZIG_LIBC_TARGET"
unset DLLTOOL && export DLLTOOL="zig dlltool"
unset HOST_CC && export HOST_CC="zig cc -target $ZIG_LIBC_TARGET"
unset HOST_CXX && export HOST_CXX="zig c++ -target $ZIG_LIBC_TARGET"
unset OBJCOPY && export OBJCOPY="zig objcopy"
unset RANLIB && export RANLIB="zig ranlib"
# https://github.com/Azathothas/Toolpacks/blob/main/BUILD_NOTES.md#make
unset CFLAGS && export CFLAGS="-O2 -flto=auto -fPIE -fpie -static -w -pipe ${CFLAGS}"
unset CXXFLAGS && export CXXFLAGS="${CFLAGS}"
unset LDFLAGS && export LDFLAGS="-static -static-pie -pie -s -Wl,-S -Wl,--build-id=none ${LDFLAGS}"

❯ !# Make
make CFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" CXXFLAGS="$CFLAGS ${ADDITIONAL_ARGS}" LDFLAGS="$LDFLAGS ${ADDITIONAL_ARGS}" --jobs="$(($(nproc)+1))" --keep-going
```
---
- #### Appendix
> - ##### **Tests**
> >
> > - [**File**](https://man7.org/linux/man-pages/man1/file.1.html)
> > ```bash
> > !# Note: This is NOT as reliable as readelf
> > file --print0 "$COMPILED_BINARY"
> > !# If this says anything other than `static*` `stripped*`, you F**Ked Up
> > ```
> > 
> > - [**ldd**](https://man7.org/linux/man-pages/man1/ldd.1.html)
> > ```bash
> > !# Note: This is NOT as reliable as readelf
> > # -d | --data-relocs --> Perform relocations and report any missing objects (ELF only).
> > # -r | --function-relocs --> Perform relocations for both data objects and functions, and report any missing objects or functions (ELF only).
> > 
> > ldd --data-relocs --function-relocs --verbose "$COMPILED_BINARY"
> > !# If this says anything other than `statically linked`, you F**Ked Up
> > !# If this says `not a dynamic executable`, it's probably for another $ARCH (Verify Using file )
> > 
> > !# For aarch64 ( binutils-aarch64-linux-gnu )
> > # -R | --dynamic-reloc --> Display the dynamic relocation entries in the file
> > # -T | --dynamic-syms --> Display the contents of the dynamic symbol table
> > aarch64-linux-gnu-objdump --dynamic-reloc --dynamic-syms "$COMPILED_BINARY" 
> > !# If this says anything other (Example lots of Output) than `not a dynamic object` `no symbols`, you F**Ked Up
> > ```
> > 
> > - [**Mold**](https://github.com/rui314/mold?tab=readme-ov-file#how-to-use)
> > ```bash
> > !# This checks if mold was used as ld linker
> > readelf -p ".comment" "$COMPILED_BINARY"
> > # Note, use aarch64-linux-gnu-readelf ( binutils-aarch64-linux-gnu ) for aarch64
> > ```
> > 
> > - [**QEMU**](https://www.unix.com/man-page/debian/1/qemu-user-static/)
> > ```bash
> > !# This tests that the binary runs without `Segmentation Fault` | `Core Dumped` | `Illegal Instructions`
> > !# A chroot/proot could also be used
> > qemu-aarch64-static "$COMPILED_BINARY"
> > qemu-x86_64-static "$COMPILED_BINARY"
> > ```
> >
> > - [**ReadELF**](https://man7.org/linux/man-pages/man1/readelf.1.html)
> > ```bash
> > !# Much more reliable than file/ldd
> > # -d | --dynamic  --> Checks Dynamic Section of the Binary [Look for NEEDED/Shared]
> > readelf --dynamic "$COMPILED_BINARY" | grep -i "NEEDED"
> > !# If this shows any `NEEDED` Section, you F**Ked Up
> >
> > # looks for the program interpreter section
> > # -p | --process-links '.interp' --> looks for the program interpreter section [Empty if it's really Static]
> > readelf -p '.interp' "$COMPILED_BINARY" 2>/dev/null
> > !# !# If this shows any `String dump` Section, you F**Ked Up
> > ```
