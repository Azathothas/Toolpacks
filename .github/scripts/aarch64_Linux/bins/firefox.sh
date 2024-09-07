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
    #firefox : An open source web browser from Mozilla
     export BIN="firefox"
     export SOURCE_URL="https://github.com/firefox-player/firefox"
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      ##Build
       pushd "$($TMPDIRS)" >/dev/null 2>&1
       nix bundle --bundler "github:ralismark/nix-appimage" "nixpkgs#firefox" --log-format bar-with-logs
      ##Copy
       sudo rsync -av --copy-links "./firefox.AppImage" "./firefox.AppImage.tmp"
       sudo chown -R "$(whoami):$(whoami)" "./firefox.AppImage.tmp" && chmod -R 755 "./firefox.AppImage.tmp"
       du -sh "./firefox.AppImage.tmp" && file "./firefox.AppImage.tmp"
      ##Extract
       APPIMAGE="$(realpath .)/firefox.AppImage.tmp" && export APPIMAGE="${APPIMAGE}"
       OFFSET="$(${APPIMAGE} --appimage-offset)" && export OFFSET="${OFFSET}"
       tail -c +"$(($OFFSET + 1))" "${APPIMAGE}" > "./squash.tmp"
       #unsquashfs -force -dest "./squash_tmp/" "./squash.tmp"
       "${APPIMAGE}" --appimage-extract >/dev/null && rm -f "${APPIMAGE}"
       OWD="$(realpath .)" && export OWD="${OWD}"
       APPIMAGE_EXTRACT="$(realpath "./squashfs-root")" && export APPIMAGE_EXTRACT="${APPIMAGE_EXTRACT}"
      ##Patch
       if [ -d "${APPIMAGE_EXTRACT}" ] && [ "$(find "${APPIMAGE_EXTRACT}" -mindepth 1 -print -quit 2>/dev/null)" ]; then
          #Media
           cd "${APPIMAGE_EXTRACT}"
           mkdir -p "./usr/share/applications" && mkdir -p "./usr/share/metainfo"
           SHARE_DIR="$(find "." -path '*share/*firefox*' | awk '{ print length, $0 }' | sort -n | cut -d" " -f2- | head -n 1 | awk -F'/share/' '{print $1}')/share" && export SHARE_DIR="${SHARE_DIR}"
           #usr/{applications,bash-completion,icons,metainfo,firefox,zsh}
            rsync -av --copy-links \
                      --include="*/" \
                      --include="*.desktop" \
                      --include="*.png" \
                      --include="*.svg" \
                      --include="*.xml" \
                      --exclude="*" \
                     "${SHARE_DIR}/" "./usr/share/" && ls "./usr/share/"
           ##Appdata/AppStream
           # find "." -path '*share/*firefox*' | awk '{ print length, $0 }' | sort -n | cut -d" " -f2- | head -n 1 | xargs -I {} sh -c 'cp {} "./usr/share/metainfo/"' ; cp "./usr/share/metainfo/firefox.metainfo.xml" "./usr/share/metainfo/firefox.appdata.xml"
           #Icon
            find "." -path '*128x128/apps/*.png' | awk '{ print length, $0 }' | sort -n | cut -d" " -f2- | head -n 1 | xargs -I {} sh -c 'cp "{}" ./firefox.png'
            find "." -maxdepth 1 -type f -name '*.svg' -exec sh -c 'convert "$0" "${0%.svg}.png"' {} \; 2>/dev/null
            cp "./firefox.png" "./.DirIcon"
           ##Desktop
            find "." -path '*firefox*.desktop' | awk '{ print length, $0 }' | sort -n | cut -d" " -f2- | head -n 1 | xargs -I {} sh -c 'cp {} "./firefox.desktop"'
            sed 's/Icon=[^ ]*/Icon=firefox/' -i "./firefox.desktop" 2>/dev/null
           ##Purge Bloatware
           echo -e "\n[+] Purging Bloatware...\n"
            O_SIZE="$(du -sh "${APPIMAGE_EXTRACT}" 2>/dev/null | awk '{print $1}' 2>/dev/null)" && export "O_SIZE=${O_SIZE}"
            #Headers
            find "." -type d -path "*/include*" -print -exec rm -rf {} 2>/dev/null \; 2>/dev/null
            #docs & manpages
            find "." -type d -path "*doc/share*" ! -name "*firefox*" -print -exec rm -rf {} 2>/dev/null \; 2>/dev/null
            find "." -type d -path "*/share/docs*" ! -name "*firefox*" -print -exec rm -rf {} 2>/dev/null \; 2>/dev/null
            find "." -type d -path "*/share/man*" ! -name "*firefox*" -print -exec rm -rf {} 2>/dev/null \; 2>/dev/null
            #static libs
            find "." -type f -name "*.a" -print -exec rm -f {} 2>/dev/null \; 2>/dev/null
            #systemd (need .so)
            find "." -type d -name "*systemd*" -exec find {} -type f ! -name "*.so*" -delete \;
            #Strip (this breaks things)
            #find "." -type f -executable -exec file -i '{}' \; | grep "application/.*executable" | cut -d':' -f1 | xargs realpath | xargs sudo strip -R ".comment" -R ".gnu.version" --strip-unneeded 2>/dev/null
            P_SIZE="$(du -sh "${APPIMAGE_EXTRACT}" 2>/dev/null | awk '{print $1}' 2>/dev/null)" && export "P_SIZE=${P_SIZE}"
           echo -e "\n[+] Shaved off ${O_SIZE} --> ${P_SIZE}\n"
          #(Re)Pack
           cd "${OWD}"
           curl -qfsSL "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-$(uname -m).AppImage" -o "./appimagetool" && chmod +x "./appimagetool"
           ARCH="$(uname -m)" "./appimagetool" --comp "zstd" \
           --mksquashfs-opt -root-owned \
           --mksquashfs-opt -no-xattrs \
           --mksquashfs-opt -noappend \
           --mksquashfs-opt -b --mksquashfs-opt "1M" \
           --mksquashfs-opt -mkfs-time --mksquashfs-opt "0" \
           --mksquashfs-opt -Xcompression-level --mksquashfs-opt "22" \
           "${APPIMAGE_EXTRACT}" "$BINDIR/firefox.AppImage"
          #Meta
           du -sh "$BINDIR/firefox.AppImage" && file "$BINDIR/firefox.AppImage"
          #clean
           unset APPIMAGE APPIMAGE_EXTRACT OFFSET OWD SHARE_DIR
       fi
      #End
       nix-collect-garbage >/dev/null 2>&1 ; popd >/dev/null 2>&1
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