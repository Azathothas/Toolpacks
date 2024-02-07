
---
- #### [make](https://wiki.gentoo.org/wiki/GCC_optimization)
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
