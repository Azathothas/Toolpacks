# Toolpacks
Packaged Tools &amp; Binaries all in one place
---
```bash
!# Install eget
!# As $USER
mkdir -p "$HOME/bin" ; export PATH="$HOME/bin:$PATH"
curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/eget" -o "$HOME/bin/eget" && chmod +xwr "$HOME/bin/eget"
wget -q "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/eget" -O "$HOME/bin/eget" && chmod +xwr "$HOME/bin/eget"

!# As ROOT
sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/eget" -o "/usr/local/bin/eget" && sudo chmod +xwr "/usr/local/bin/eget"
sudo wget -q "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/eget" -O "/usr/local/bin/eget" && sudo chmod +xwr "/usr/local/bin/eget"
```
---
```bash
!# tar.bz2
!# $USER
 eget "Azathothas/Toolpacks" --asset "toolpack_x86_64.tar.bz2" --all --to "$HOME/bin"
!# ROOT
 sudo eget "Azathothas/Toolpacks" --asset "toolpack_x86_64.tar.bz2" --all --to "/usr/local/bin" && sudo chmod +xwr /usr/local/bin/*

!# zip
!# $USER
 eget "Azathothas/Toolpacks" --asset "toolpack_x86_64.zip" --all --to "$HOME/bin"
!# ROOT
 sudo eget "Azathothas/Toolpacks" --asset "toolpack_x86_64.zip" --all --to "/usr/local/bin" && sudo chmod +xwr /usr/local/bin/*

!# 7z
 eget "Azathothas/Toolpacks" --asset "toolpack_x86_64.7z" --all --to "./toolpack_x86_64.7z"
!# $USER
!# ROOT
```
