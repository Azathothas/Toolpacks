#!/usr/bin/env bash

##Requires ndk-pkg to be already installed + setup

##USAGE (from a dockerfile):
# curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/runners/alpine-builder-ndk.sh" -o "./setup_env.sh" && chmod +x "./setup_env.sh" && source "./setup_env.sh"
# curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/runners/alpine-builder-ndk.sh" -o "./setup_env.sh" && chmod +x "./setup_env.sh" && source "./setup_env.sh"

 ##Get NDK
  curl -qfsSL "https://bin.ajam.dev/$(uname -m)/ansi2txt" -o "/usr/bin/ansi2txt" && chmod +x "/usr/bin/ansi2txt"
  ndk-pkg install "android-29-arm64-v8a/dos2unix" --profile="release" --jobs="$(($(nproc)+1))" -v | ansi2txt | tee "./ndk.log"
  ndk-pkg uninstall "android-29-arm64-v8a/dos2unix" ; ndk-pkg cleanup
 ##ENV
  TOOLPACKS_NDK_HOME="$(grep ^ANDROID_NDK_HOME= ./ndk.log | awk -F '=' '{print $2}' | tr -d "'" | tr -d '[:space:]')" && export TOOLPACKS_NDK_HOME="${TOOLPACKS_NDK_HOME}"
  TOOLPACKS_NDK_ROOT="$(grep ^ANDROID_NDK_ROOT= ./ndk.log | awk -F '=' '{print $2}' | tr -d "'" | tr -d '[:space:]')" && export TOOLPACKS_NDK_ROOT="${TOOLPACKS_NDK_ROOT}"
  TOOLPACKS_NDK_TOOLCHAIN_ROOT="$(grep ^ANDROID_NDK_TOOLCHAIN_ROOT= ./ndk.log | awk -F '=' '{print $2}' | tr -d "'" | tr -d '[:space:]')" && export TOOLPACKS_NDK_TOOLCHAIN_ROOT="${TOOLPACKS_NDK_TOOLCHAIN_ROOT}"
 ##Set ENVs
 if [[ "${TOOLPACKS_NDK_HOME}" == *"android-ndk"* ]] && [[ "${TOOLPACKS_NDK_ROOT}" == *"android-ndk"* ]] && [[ "${TOOLPACKS_NDK_TOOLCHAIN_ROOT}" == *"android-ndk"* ]]; then
  echo -e "\n[+] Setting up NDK ENV Variables\n"
  export ANDROID_HOME="${TOOLPACKS_NDK_HOME}" && echo "export ANDROID_HOME=${TOOLPACKS_NDK_HOME}" >> "/etc/bash.bashrc"
  export ANDROID_NDK_HOME="${TOOLPACKS_NDK_HOME}" && echo "export ANDROID_NDK_HOME=${TOOLPACKS_NDK_HOME}" >> "/etc/bash.bashrc"
  export ANDROID_NDK_ROOT="${TOOLPACKS_NDK_ROOT}" && echo "export ANDROID_NDK_ROOT=${TOOLPACKS_NDK_ROOT}" >> "/etc/bash.bashrc"
  export ANDROID_NDK_TOOLCHAIN_ROOT="${TOOLPACKS_NDK_TOOLCHAIN_ROOT}" && echo "export ANDROID_NDK_TOOLCHAIN_ROOT=${TOOLPACKS_NDK_TOOLCHAIN_ROOT}" >> "/etc/bash.bashrc"
  export ANDROID_NDK_TOOLCHAIN_BIN="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin" && echo "export ANDROID_NDK_TOOLCHAIN_BIN=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin" >> "/etc/bash.bashrc"
  export ANDROID_NDK_SYSROOT="${ANDROID_NDK_TOOLCHAIN_ROOT}/sysroot" && echo "export ANDROID_NDK_SYSROOT=${ANDROID_NDK_TOOLCHAIN_ROOT}/sysroot" >> "/etc/bash.bashrc"
  export ANDROID_NDK_CC="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang" && echo "export ANDROID_NDK_CC=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang" >> "/etc/bash.bashrc"
  export ANDROID_NDK_CXX="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang++" && echo "export ANDROID_NDK_CXX=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang++" >> "/etc/bash.bashrc"
  export ANDROID_NDK_CPP="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang -E" && echo "export ANDROID_NDK_CPP=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/clang -E" >> "/etc/bash.bashrc"
  export ANDROID_NDK_LD="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/ld.lld" && echo "export ANDROID_NDK_LD=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/ld.lld" >> "/etc/bash.bashrc"
  export ANDROID_NDK_AS="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-as" && echo "export ANDROID_NDK_AS=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-as" >> "/etc/bash.bashrc"
  export ANDROID_NDK_AR="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-ar" && echo "export ANDROID_NDK_AR=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-ar" >> "/etc/bash.bashrc"
  export ANDROID_NDK_NM="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-nm" && echo "export ANDROID_NDK_NM=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-nm" >> "/etc/bash.bashrc"
  export ANDROID_NDK_SIZE="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-size" && echo "export ANDROID_NDK_SIZE=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-size" >> "/etc/bash.bashrc"
  export ANDROID_NDK_STRIP="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-strip" && echo "export ANDROID_NDK_STRIP=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-strip" >> "/etc/bash.bashrc"
  export ANDROID_NDK_RANLIB="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-ranlib" && echo "export ANDROID_NDK_RANLIB=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-ranlib" >> "/etc/bash.bashrc"
  export ANDROID_NDK_STRINGS="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-strings" && echo "export ANDROID_NDK_STRINGS=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-strings" >> "/etc/bash.bashrc"
  export ANDROID_NDK_OBJDUMP="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-objdump" && echo "export ANDROID_NDK_OBJDUMP=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-objdump" >> "/etc/bash.bashrc"
  export ANDROID_NDK_OBJCOPY="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-objcopy" && echo "export ANDROID_NDK_OBJCOPY=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-objcopy" >> "/etc/bash.bashrc"
  export ANDROID_NDK_READELF="${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-readelf" && echo "export ANDROID_NDK_READELF=${ANDROID_NDK_TOOLCHAIN_ROOT}/bin/llvm-readelf" >> "/etc/bash.bashrc"
 ##Symlink
  ln -s "${ANDROID_NDK_TOOLCHAIN_BIN}/aarch64-linux-${TOOLPACKS_ANDROID_APILEVEL_DYNAMIC}-clang" "/usr/bin/aarch64-linux-android-clang" 2>/dev/null
  ln -s "${ANDROID_NDK_TOOLCHAIN_BIN}/clang" "/usr/bin/clang" 2>/dev/null
  #llvm-ar
  ln -s "${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-ar" "/usr/bin/aarch64-linux-android-ar" 2>/dev/null
  chmod +x "/usr/bin/aarch64-linux-android-ar" 2>/dev/null
  #llvm-ranlib
  ln -s "${ANDROID_NDK_TOOLCHAIN_BIN}/llvm-ranlib" "/usr/bin/aarch64-linux-android-ranlib" 2>/dev/null
  chmod +x "/usr/bin/aarch64-linux-android-ranlib" 2>/dev/null
 ##Cleanup
  rm -rf "./ndk.log"
else
  echo -e "\n[-] FATAL: Failed to set NDK ENVs\n"
  cat "./ndk.log"
 exit 1
fi
##EOF
