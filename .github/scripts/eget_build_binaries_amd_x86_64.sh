#!/usr/bin/env bash

# This should be able to be executed completely in userspace mode only & shouldn't require root access
# Only Dependency is 'curl' or 'wget' [NOT-TESTED]
# Get wget: https://bin.ajam.dev/x86_64_Linux/wget
# Get Curl: https://bin.ajam.dev/x86_64_Linux/curl
# Once requirement is satisfied, simply:
# bash <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/scripts/eget_binaries_aarch64_arm64.sh")
#-------------------------------------------------------#
# If On Github Actions, remove bloat to get space (~ 30 GB) [DANGEROUS]
if [ "$USER" = "runner" ] || [ "$(whoami)" = "runner" ] && [ -s "/opt/runner/provisioner" ]; then
   echo -e "\n[+] Debloating GH Runner...\n"
     #12.0 GB
     sudo rm "/usr/local/lib/android" -rf 2>/dev/null
     #8.2 GB
     sudo rm "/opt/hostedtoolcache/CodeQL" -rf 2>/dev/null
     #5.0 GB
     sudo rm "/usr/local/.ghcup" -rf 2>/dev/null
     #2.0 GB
     sudo rm "/usr/share/dotnet" -rf 2>/dev/null
     #1.7 GB
     sudo rm "/usr/share/swift" -rf 2>/dev/null
     #1.1 GB
     #sudo rm "/usr/local/lib/node_modules" -rf 2>/dev/null
     #1.0 GB
     sudo rm "/usr/local/share/powershell" -rf 2>/dev/null
     #500 MB
     sudo rm "/usr/local/lib/heroku" -rf 2>/dev/null
fi
#-------------------------------------------------------#
##Get ENV:PATH
#TMPDIRS
 TMPDIRS="mktemp -d --tmpdir=/tmp/toolpacks XXXXXXX_linux_x86_64" && export TMPDIRS="$TMPDIRS"
 rm -rf "/tmp/toolpacks" 2>/dev/null ; mkdir -p "/tmp/toolpacks" 
#$HOME/bin
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
  if ! [ -d "$HOME/bin" ] ; then
    mkdir -p "$HOME/bin"
  fi
    export PATH="$HOME/bin:$PATH"
fi
#Get Dir Ready
if ! [ -d "$HOME/bin" ] ; then
    mkdir -p "$HOME/bin" 
fi
#-------------------------------------------------------#
##Download eget
if ! command -v eget &> /dev/null; then
   curl -qfsSL "https://zyedidia.github.io/eget.sh" | bash
   if [ -f "./eget" ]; then
       mv "./eget" "$HOME/bin" && chmod +xwr "$HOME/bin/eget"
   else
     #Use GH api
      pushd "$($TMPDIRS)" > /dev/null 2>&1
      curl -qfLJO $(curl -qfsSL "https://api.github.com/repos/zyedidia/eget/releases/latest" | jq -r '.assets[].browser_download_url' | grep -i 'linux.*amd64')
      find . -type f -name '*.tar.gz' -exec tar -xzvf {} \;
      find . -type f -name 'eget*' -exec strip {} \; >/dev/null 2>&1
      find . -type f -name 'eget' -exec mv {} "$HOME/bin/eget" \;
      chmod +xwr "$HOME/bin/eget"
      popd > /dev/null 2>&1
      #Use bin.ajam.dev
      if ! command -v eget &> /dev/null; then
         curl -qfSL "https://bin.ajam.dev/x86_64_Linux/eget" -o "/usr/local/bin/eget"
      fi
   fi
else
  cp "$(which eget)" "$HOME/bin/eget"
fi
#Checks
 if ! command -v eget &> /dev/null; then
    echo -e "\n[+] eget is NOT Installed\n"
  exit 1
 fi
#-------------------------------------------------------#
#Sanity Checks
if [[ -n "$GITHUB_TOKEN" ]]; then
   # 5000 req/minute (80 req/minute) 
   echo "GITHUB_TOKEN is Exported"
   eget --rate
else
   # 60 req/hr
   echo -e "\n[+] GITHUB_TOKEN is NOT Exported"
   echo -e "Export it to avoid ratelimits\n"
   eget --rate 
   exit 1
fi
#-------------------------------------------------------# 
#Tools (Binaries Only)
  #---------------#
  #7z : Unarchiver
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && curl -qfsSLJO "https://www.7-zip.org/$(curl -qfsSL "https://www.7-zip.org/download.html" | grep -o 'href="[^"]*"' | sed 's/href="//' | grep 'linux-x64.tar.xz' | sed 's/"$//' | sort | tail -n 1)"
  find . -type f -name '*.xz' -exec tar -xf {} \;
  find . -type f -name '7zzs' ! -name '*.xz' -exec cp {} "$HOME/bin/7z" \;
  popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #act : Run your GitHub Actions locally 🚀 
  eget "nektos/act" --asset "Linux" --asset "64" --asset "^arm" --asset "gz" --to "$HOME/bin/act"
  #---------------#
  #actionlint : :octocat: Static checker for GitHub Actions workflow files
  eget "rhysd/actionlint" --asset "linux"  --asset "64"  --asset "^arm"  --asset "gz" --to "$HOME/bin/actionlint"
  #---------------#
  #age: A simple, modern and secure encryption tool 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/FiloSottile/age" && cd "./age"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/age" 
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/age-keygen"
  mv "./age" "$HOME/bin/age" ; mv "./age-keygen" "$HOME/bin/age-keygen"
  popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #agg: asciinema gif generator 
  eget "asciinema/agg" --asset "linux"  --asset "x86_64"  --asset "musl" --to "$HOME/bin/agg"
  #---------------#
  #agrind (angle-grinder): Slice and dice logs on the command line 
  eget "rcoh/angle-grinder" --asset "linux" --asset "musl" --asset "x86_64" --to "$HOME/bin/agrind"
  #---------------#
  #airiXSS : xss automater
  #eget "ferreiraklet/airixss" --to "$HOME/bin/airixss"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/ferreiraklet/airixss" && cd "./airixss"
  go mod init "github.com/ferreiraklet/airixss" ; go mod tidy
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./airixss" "$HOME/bin/airixss" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #aix : AIx is a cli tool to interact with Large Language Models (LLM) APIs. 
  eget "projectdiscovery/aix" --asset "amd64" --asset "linux" --to "$HOME/bin/aix"
  #---------------#
  #albafetch : system-info-fetcher
  eget "alba4k/albafetch" --asset "linux" --asset "static" --asset "x64" --to "$HOME/bin/albafetch"
  #---------------#
  #algernon : Small self-contained pure-Go web server with Lua, Teal, Markdown, HTTP/2, QUIC, Redis and PostgreSQL support
  eget "xyproto/algernon" --asset "linux" --asset "x86" --asset "64" --asset "static" --asset "tar" --file "algernon" --to "$HOME/bin/algernon"
  #---------------#
  #alist : A file list/WebDAV program that supports multiple storages
  eget "alist-org/alist" --asset "amd64" --asset "linux" --asset "musl" --to "$HOME/bin/alist"
  #---------------#
  #allxfr: AXFR all the things! 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/lanrat/allxfr" && cd "./allxfr"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./allxfr" "$HOME/bin/allxfr" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #alterx : Fast and customizable subdomain wordlist generator using DSL 
  eget "projectdiscovery/alterx" --asset "amd64" --asset "linux" --to "$HOME/bin/alterx"
  #---------------#
  #amass : In-depth attack surface mapping and asset discovery 
  #eget "owasp-amass/amass" --asset "amd64" --asset "zip" --to "$HOME/bin/amass" && mkdir -p "$HOME/.config/amass"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/owasp-amass/amass" && cd "./amass"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/amass" ; mv "./amass" "$HOME/bin/amass" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #analyticsrelationships : Get related domains / subdomains by looking at Google Analytics IDs 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Josue87/AnalyticsRelationships" && cd "./AnalyticsRelationships"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./analyticsrelationships" "$HOME/bin/analyticsrelationships" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #anew : A tool for adding new lines to files, skipping duplicates 
  eget "tomnomnom/anew" --asset "amd64" --asset "linux" --to "$HOME/bin/anew"
  #---------------#
  #anewer: anewer appends lines from stdin to a file if they don't already exist in the file    
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/ysf/anewer" && cd "./anewer"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/anewer" "$HOME/bin/anewer" ; popd > /dev/null 2>&1
  #---------------#
  #apk.sh : apk.sh makes reverse engineering Android apps easier
  eget "https://raw.githubusercontent.com/ax/apk.sh/main/apk.sh" --to "$HOME/bin/apk.sh" && chmod +xwr "$HOME/bin/apk.sh"
  #---------------#
  #arduino-cli : Arduino command line tool 
  eget "arduino/arduino-cli" --asset "Linux" --asset "64bit" --asset "gz" --asset "^arm" --to "$HOME/bin/arduino-cli" 
  #---------------#
  #aretext: Minimalist text editor with vim-compatible key bindings. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/aretext/aretext" && cd "./aretext"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./aretext" ; mv "./aretext" "$HOME/bin/aretext" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #aria2c : aria2 is a multi-protocol (HTTP/HTTPS, FTP, SFTP, BitTorrent & Metalink) & multi-source command-line download utility
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/aria2/aria2c_amd_x86_64_libressl_musl_latest_Linux" --to "$HOME/bin/aria2c"
  #---------------#
  #asn : ASN / RPKI validity / BGP stats / IPv4v6 / Prefix / URL / ASPath / Organization / IP reputation / IP geolocation / IP fingerprinting / Network recon / lookup API server / Web traceroute server
  eget "https://raw.githubusercontent.com/nitefood/asn/master/asn" --to "$HOME/bin/asn"
  #---------------#
  #asnmap : Mapping organization network ranges using ASN information
  #eget "projectdiscovery/asnmap" --asset "amd64" --asset "linux" --to "$HOME/bin/asnmap"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/projectdiscovery/asnmap" && cd "./asnmap"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/asnmap" ; mv "./asnmap" "$HOME/bin/asnmap" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #assetfinder : Find domains and subdomains related to a given domain 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/tomnomnom/assetfinder" && cd "./assetfinder"
  go mod init "github.com/tomnomnom/assetfinder" ; go mod tidy
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./assetfinder" "$HOME/bin/assetfinder" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #assh : 💻 make your ssh client smarter 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/moul/assh" && cd "./assh"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./assh" "$HOME/bin/assh" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #atuin: Sync Shell History
  eget "atuinsh/atuin" --asset "unknown-linux-musl" --to "$HOME/bin/atuin"
  #---------------#
  #awk: updated awk
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/xplshn/awk" && cd "./awk"
  sudo apt-get install byacc make clang -y
  make -j"$(($(nproc)+1))"
  cp "./a.out" "$HOME/bin/awk"
  #---------------#
  #aws-nuke : Nuke a whole AWS account and delete all its resources.  
  eget "rebuy-de/aws-nuke" --asset "aws-nuke" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/aws-nuke"
  #---------------#
  #b3sum : the official Rust and C implementations of the BLAKE3 cryptographic hash function
  eget "BLAKE3-team/BLAKE3" --asset "b3sum" --asset "linux" --asset "64" --asset "^arm" --asset "^sha" --to "$HOME/bin/b3sum"
  #---------------#
  #Bandwhich : Terminal bandwidth utilization tool
  eget "imsnif/bandwhich" --asset "linux" --asset "64" --asset "musl" --asset "^arm" --asset "^sha" --to "$HOME/bin/bandwhich"
  #---------------#
  #batcat: cat with colors & syntax highlights 
  eget "sharkdp/bat" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/bat" 
  eget "sharkdp/bat" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/batcat"
  #---------------#
  #Bearer : Code security scanning tool (SAST) to discover, filter and prioritize security and privacy risks.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Bearer/bearer" && cd "./bearer"
  CGO_ENABLED="1" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/bearer"
  mv "./bearer" "$HOME/bin/bearer" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #bed : Binary editor written in Go 
  eget "itchyny/bed" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/bed"
  #---------------#
  #Berty : Secure peer-to-peer messaging app that works with or without internet access, cellular data or trust in the network
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/berty/berty" && cd "./berty"
  CGO_ENABLED="1" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./go/cmd/berty"
  mv "./berty" "$HOME/bin/berty" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #bin: Effortless binary manager 
  eget "marcosnils/bin" --asset "linux" --asset "amd64" --to "$HOME/bin/bin"
  #---------------#
  #binfetch : neofetch for binaries   
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Im-0xea/binfetch" && cd "./binfetch"
  #Install Deps
  sudo apt-get install libconfuse-common libconfuse-dev libelf-dev meson -y
  #https://mesonbuild.com/Builtin-options.html
  meson setup --buildtype="release" --default-library="static" --prefer-static -Ddebug="false" -Db_lto="true" -Db_pie="true" -Db_staticpic="true" --strip --reconfigure --wipe --clearcache "./build" "./"
  ninja -C "./build"
  file "./build/binfetch" && ldd "./build/binfetch" ; mv "./build/binfetch" "$HOME/bin/binfetch"
  #Requires cfg
  curl -qfsSL "https://raw.githubusercontent.com/Im-0xea/binfetch/main/cfg/binfetch.cfg" -o "$HOME/bin/binfetch.cfg"
  #mkdir -p "$HOME/.config/binfetch" && curl -qfsSL "https://raw.githubusercontent.com/Im-0xea/binfetch/main/cfg/binfetch.cfg" -o "$HOME/.config/binfetch/binfetch.cfg"
  #mkdir -p "$HOME/.config/binfetch" && curl -qfsSL "https://raw.githubusercontent.com/Im-0xea/binfetch/main/cfg/emby.cfg" -o "$HOME/.config/binfetch/binfetch.cfg"
  #mkdir -p "$HOME/.config/binfetch" && curl -qfsSL "https://raw.githubusercontent.com/Im-0xea/binfetch/main/cfg/rainbow.cfg" -o "$HOME/.config/binfetch/binfetch.cfg"
  #---------------#
  #BinGrep :  like ~~grep~~ UBER, but for binaries 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/m4b/bingrep" && cd "./bingrep"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/bingrep" "$HOME/bin/bingrep" 
  #---------------#
  #binocle : a graphical tool to visualize binary data 
  eget "sharkdp/binocle" --asset "linux" --asset "musl" --asset "x86_64" --to "$HOME/bin/binocle"
  #---------------#
  #bleve : A modern text indexing library for go 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/blevesearch/bleve" && cd "./bleve"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/bleve"
  mv "./bleve" "$HOME/bin/bleve" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #bluetuith :  A TUI bluetooth manager for Linux.
  eget "darkhz/bluetuith" --asset "Linux" --asset "x86_64" --asset "tar.gz" --file "bluetuith" --to "$HOME/bin/bluetuith"
  #---------------#
  #BoltConn : Transparent and flexible L4/L7 networking manager, supporting WireGuard, firewall and scripted MitM
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/XOR-op/BoltConn" && cd "./BoltConn"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/boltconn" "$HOME/bin/boltconn"
  #---------------#
  #bombadillo : Browser for gopher | gemini | finger | local (a user's file system)
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://tildegit.org/sloum/bombadillo" && cd "./bombadillo"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./bombadillo" "$HOME/bin/bombadillo" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #bore : ngrok alternative for making tunnels to localhost 
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/bore/bore_amd_x86_64_musl_Linux" --to "$HOME/bin/bore"
  #---------------#
  #boringtun-cli : Userspace WireGuard® Implementation in Rust
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/cloudflare/boringtun" && cd "./boringtun"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --bin "boringtun-cli" --target "$TARGET" --release ; mv "./target/$TARGET/release/boringtun-cli" "$HOME/bin/boringtun-cli"
  #---------------#
  #bottom : htop clone | graphical process/system monitor
  eget "ClementTsang/bottom" --asset "bottom_x86_64-unknown-linux-musl.tar.gz" --file "btm" --to "$HOME/bin/bottom"
  #"$HOME/bin/eget" "ClementTsang/bottom" --asset "bottom_x86_64-unknown-linux-musl.tar.gz" --file "btm" --to "$HOME/bin/bottom" && ln -s "$HOME/bin/bottom" "$HOME/bin/btm"
  #---------------#
  #boxxy : boxxy puts bad Linux applications in a box with only their files.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/queer/boxxy" && cd "./boxxy"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/boxxy" "$HOME/bin/boxxy" ; popd > /dev/null 2>&1
  #---------------#
  #brename : tool for safely batch renaming files/directories via regular expression 
  eget "shenwei356/brename" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/brename"
  #---------------#
  #broot : A new way to see and navigate directory trees
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Canop/broot" && cd "./broot"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/broot" "$HOME/bin/broot" ; popd > /dev/null 2>&1
  #---------------#
  #btop : htop clone | A monitor of resources 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && curl -qfsSL $(curl -qfsSL "https://api.github.com/repos/aristocratos/btop/actions/artifacts?per_page=100" -H "Authorization: Bearer $GITHUB_TOKEN" | jq -r '[.artifacts[] | select(.name == "btop-x86_64-linux-musl")] | sort_by(.created_at) | .[].archive_download_url') -H "Authorization: Bearer $GITHUB_TOKEN" -o "btop.zip" 
  unzip "./btop.zip" && find . -type f -name '*btop*' ! -name '*.zip*' -exec mv {} "$HOME/bin/btop" \; && popd > /dev/null 2>&1
  #---------------#
  #BucketLoot : Automated S3-compatible bucket inspector
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/redhuntlabs/BucketLoot" && cd "./BucketLoot"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./bucketloot" "$HOME/bin/bucketloot" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #busybox : several Unix utilities in a single executable file
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/busybox/busybox_amd_x86_64_musl_Linux" --to "$HOME/bin/busybox"
  #---------------#
  #byp4xx : 40X/HTTP bypasser in Go. Features: Verb tampering, headers, #bugbountytips, User-Agents, extensions, default credentials
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/lobuhi/byp4xx" && cd "./byp4xx"
  go mod init "github.com/lobuhi/byp4xx" ; go mod tidy
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./byp4xx" "$HOME/bin/byp4xx" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #caddy : Fast and extensible multi-platform HTTP/1-2-3 web server with automatic HTTPS
  eget "caddyserver/caddy" --asset "linux" --asset "64" --asset "tar.gz" --asset "^arm" --asset "^sig" --to "$HOME/bin/caddy"
  #---------------#
  #catatonit: A container init that is so simple it's effectively brain-dead. 
  eget "openSUSE/catatonit" --asset "x86_64" --asset "^.asc" --to "$HOME/bin/catatonit"
  #---------------#
  #catp: Print the output of a running process 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/rapiz1/catp" && cd "./catp"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/catp" "$HOME/bin/catp" ; popd > /dev/null 2>&1
  #---------------#
  #cdncheck : A utility to detect various technology for a given IP address. 
  eget "projectdiscovery/cdncheck" --asset "amd64" --asset "linux" --to "$HOME/bin/cdncheck"
  #---------------#
  #cent : Fetch & Organize all Nuclei Templates
  eget "xm1k3/cent" --asset "amd64" --asset "linux" --to "$HOME/bin/cent"
  #---------------#
  #certgraph: An open source intelligence tool to crawl the graph of certificate Alternate Names
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/lanrat/certgraph" && cd "./certgraph"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./certgraph" "$HOME/bin/certgraph" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #certspotter : Certificate Transparency Log Monitor
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/SSLMate/certspotter" && cd "./certspotter"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/certspotter"
  mv "./certspotter" "$HOME/bin/certspotter" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #certstream :  Cli for calidog's certstream
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && mkdir "./certstream" && cd "./certstream"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/certstream/main.go"
  go mod init "github.com/Azathothas/Arsenal/certstream" ; go mod tidy
  go get "github.com/Azathothas/Arsenal/certstream"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./certstream" ; mv "./certstream" "$HOME/bin/certstream" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #certwatcher : CertWatcher is a tool for capture and tracking certificate transparency logs, using YAML templates based DSL.   
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/drfabiocastro/certwatcher" && cd "./certwatcher"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/certwatcher"
  mv "./certwatcher" "$HOME/bin/certwatcher" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #certstream-server-go : drop-in replacement for Calidog's outdated server
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/d-Rickyy-b/certstream-server-go" && cd "./certstream-server-go"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./certstream-server-go" "./cmd/main.go"
  mv "./certstream-server-go" "$HOME/bin/certstream-server-go" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #cexec : Execute any command, cache its output and get cached output on subsequent execution
  eget "mrusme/cexec" --asset "cexec" --asset "linux" --asset "amd64" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/cexec"
  #---------------#
  #cfssl : Cloudflare's PKI and TLS toolkit
  eget "cloudflare/cfssl" --asset "cfssl" --asset "^cfssl-bundle" --asset "^cfssl-certinfo" --asset "^cfssl-newkey" --asset "^cfssl-scan" --asset "^cfssljson" --asset "linux" --asset "amd64" --to "$HOME/bin/cfssl" 
  eget "cloudflare/cfssl" --asset "cfssl-bundle" --asset "linux" --asset "amd64" --to "$HOME/bin/cfssl-bundle"
  eget "cloudflare/cfssl" --asset "cfssl-certinfo" --asset "linux" --asset "amd64" --to "$HOME/bin/cfssl-certinfo"
  eget "cloudflare/cfssl" --asset "cfssl-newkey" --asset "linux" --asset "amd64" --to "$HOME/bin/cfssl-newkey"
  eget "cloudflare/cfssl" --asset "cfssl-scan" --asset "linux" --asset "amd64" --to "$HOME/bin/cfssl-scan"
  eget "cloudflare/cfssl" --asset "cfssljson" --asset "linux" --asset "amd64" --to "$HOME/bin/cfssljson"
  eget "cloudflare/cfssl" --asset "mkbundle" --asset "linux" --asset "amd64" --to "$HOME/bin/mkbundle"
  eget "cloudflare/cfssl" --asset "multirootca" --asset "linux" --asset "amd64" --to "$HOME/bin/multirootca"
  #---------------#
  #Chameleon : Content Discovery using wappalyzer's set of technology fingerprints alongside custom wordlists tailored to each detected technologies.
  eget "iustin24/chameleon" --asset "linux" --to "$HOME/bin/chameleon"
  #---------------#
  #chaos-client : cli for Chaos DB API
  eget "projectdiscovery/chaos-client" --asset "amd64" --asset "linux" --to "$HOME/bin/chaos-client"
  #---------------#
  #cheat: create and view interactive cheatsheets on the command-line
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/cheat/cheat" && cd "./cheat"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/cheat" ; mv "./cheat" "$HOME/bin/cheat" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #cherrybomb : Validating and Testing APIs using an OpenAPI file
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/blst-security/cherrybomb" && cd "./cherrybomb"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/cherrybomb" "$HOME/bin/cherrybomb"
  #---------------#
  #chisel : A fast TCP/UDP tunnel over HTTP 
  eget "jpillora/chisel" --asset "amd64" --asset "linux" --asset "chisel" --asset "gz" --asset "^sha" --to "$HOME/bin/chisel"
  #---------------#
  #circumflex : 🌿 It's Hacker News in your terminal 
  eget "bensadeh/circumflex" --asset "linux" --asset "amd64" --asset "gz" --to "$HOME/bin/circumflex"
  #---------------#
  #cloudcash : Check your cloud spending from the CLI, from Waybar, and from the macOS menu bar!
  eget "mrusme/cloudcash" --asset "cloudcash" --asset "linux" --asset "amd64" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/cloudcash"
  #---------------#
  #Cloudfox : Automating situational awareness for cloud penetration tests
  #Binary size ~ 150 MB
  #eget "BishopFox/cloudfox" --asset "amd64" --asset "linux" --to "$HOME/bin/cloudfox"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/BishopFox/cloudfox" && cd "./cloudfox"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./cloudfox" "$HOME/bin/cloudfox" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #cloudlist : Cloudlist is a tool for listing Assets from multiple Cloud Providers.
  eget "projectdiscovery/cloudlist" --asset "amd64" --asset "linux" --to "$HOME/bin/cloudlist"
  #---------------#
  #cloudreve : Self-hosted file management and sharing system, supports multiple storage providers
  eget "cloudreve/Cloudreve" --asset "amd64" --asset "linux" --file "cloudreve" --to "$HOME/bin/cloudreve"
  #---------------#
  #cog : The Conventional Commits toolbox
  eget "cocogitto/cocogitto" --asset "cocogitto" --asset "linux" --asset "x86_64" --asset "musl" --asset "^sha" --file "cog" --to "$HOME/bin/cog"
  #---------------#
  #comb : Combine the lines from two files in every combination.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && mkdir comb && cd "./comb"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/comb/main.go"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/comb/go.mod"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./comb" ; mv "./comb" "$HOME/bin/comb" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #containerd : An open and reliable container runtime
  eget "containerd/containerd" --asset "linux" --asset "static" --asset "amd" --asset "64" --asset "^sha256sum" --to "$HOME/bin/containerd"
  #---------------#
  #coreutils : Cross-platform Rust rewrite of the GNU coreutils 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/uutils/coreutils" && cd "./coreutils"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --features unix --release ; mv "./target/$TARGET/release/coreutils" "$HOME/bin/coreutils"
  #---------------#
  #cotp : Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/replydev/cotp" && cd "./cotp"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/cotp" "$HOME/bin/cotp" ; popd > /dev/null 2>&1
  #---------------#
  #cowsay: complete rewrite of cowsay in Go 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://gitlab.com/nmyk/cowsay.git" && cd "./cowsay"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/cowsay" 
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/cowthink"
  mv "./cowsay" "$HOME/bin/cowsay" ; mv "./cowthink" "$HOME/bin/cowthink"
  popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #cowtiness : mimic an HTTP server and a DNS server, providing complete responses
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/stolenusername/cowitness" && cd "./cowitness"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./cowitness" "$HOME/bin/cowitness" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #cproxy: Easy per application transparent proxy built on cgroup.    
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/NOBLES5E/cproxy" && cd "./cproxy"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/cproxy" "$HOME/bin/cproxy" ; popd > /dev/null 2>&1
  #---------------#
  #cpufetch : fetch for cpu
  eget "Dr-Noob/cpufetch" --asset "linux" --asset "x86" --asset "64" --to "$HOME/bin/cpufetch"
  #---------------#
  #crawley : The unix-way web crawler 
  eget "s0rg/crawley" --asset "linux" --asset "x86_64" --asset "gz" --to "$HOME/bin/crawley"
  #---------------#
  #cri-tools : CLI and validation tools for Kubelet Container Runtime Interface (CRI)
  eget "kubernetes-sigs/cri-tools" --asset "crictl" --asset "linux" --asset "amd" --asset "^sha" --to "$HOME/bin/crictl"
  #---------------#
  #crlfuzz : A fast tool to scan CRLF vulnerability written in Go
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/dwisiswant0/crlfuzz" && cd "./crlfuzz"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/crlfuzz" ; mv "./crlfuzz" "$HOME/bin/crlfuzz" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #croc : Easily and securely send things from one computer to another
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/croc/croc_amd_x86_64_Linux" --to "$HOME/bin/croc"
  #---------------#
  #crt : A CLI tool to check Certificate Transparency logs of a domain name
  #eget "cemulus/crt" --asset "x86_64" --to "$HOME/bin/crt"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/cemulus/crt" && cd "./crt"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./crt" "$HOME/bin/crt" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #csprecon : Discover new target domains using Content Security Policy 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/edoardottt/csprecon" && cd csprecon
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/csprecon" ; mv "./csprecon" "$HOME/bin/csprecon" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #csview : 📠 Pretty and fast csv viewer for cli with cjk/emoji support.
  eget "wfxr/csview" --asset "linux" --asset "x86_64" --asset "musl" --asset "^sha" --to "$HOME/bin/csview"
  #---------------#
  #csvtk : A cross-platform, efficient and practical CSV/TSV toolkit
  eget "shenwei356/csvtk" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/csvtk"
  #---------------#
  #ct_monitor : Certificate Transparency log monitor 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/crtsh/ct_monitor" && cd "./ct_monitor"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./ct_monitor" "$HOME/bin/ct_monitor" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #ctlwatcher : Monitor Certificate Transparency logs for domains matching regexes. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Azathothas/ctlwatcher" && cd "./ctlwatcher"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/ctlwatcher" "$HOME/bin/ctlwatcher" ; popd > /dev/null 2>&1
  #---------------#
  #curl
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/curl/curl_amd_x86_64_Linux" --to "$HOME/bin/curl"
  #---------------#
  #curlie : The power of curl, the ease of use of httpie. 
  eget "rs/curlie" --asset "linux" --asset "amd64" --asset "tar.gz" --to "$HOME/bin/curlie"
  #---------------#
  #cut-cdn : ✂️ Removing CDN IPs from the list of IP addresses
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/ImAyrix/cut-cdn" && cd "./cut-cdn"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./cut-cdn" "$HOME/bin/cut-cdn" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #daktilo : Turn your keyboard into a typewriter! 📇 
  #   #Errors out :/usr/bin/ld: cannot find -lasound: No such file or directory
  #   pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/orhun/daktilo" && cd "./daktilo"
  #   sudo apt-get install libasound2-dev libxi-dev libxtst-dev -y 
  #   export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  #   sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  #   echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  #   cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/daktilo" "$HOME/bin/daktilo"
  #---------------#
  #dalfox : 🌙🦊 Dalfox is a powerful open-source XSS scanner and utility focused on automation. 
  eget "hahwul/dalfox" --asset "amd64" --to "$HOME/bin/dalfox"
  #---------------#
  #dasel : Select, put and delete data from JSON, TOML, YAML, XML and CSV files with a single tool
  eget "TomWright/dasel" --asset "linux" --asset "amd64" --asset "gz" --to "$HOME/bin/dasel"
  #---------------#
  #Datadash : Visualize and graph data in the terminal 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/keithknott26/datadash" && cd "./datadash"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./datadash" "./cmd/" ; mv "./datadash" "$HOME/bin/datadash" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #ddns-go : Simple and easy to use DDNS.
  eget "jeessy2/ddns-go" --asset "x86_64" --asset "linux" --asset "ddns-go" --asset "tar.gz" --asset "^sha" --to "$HOME/bin/ddns-go"
  #---------------#
  #delta : A syntax-highlighting pager for git, diff, and grep output
  eget "dandavison/delta" --asset "linux" --asset "64" --asset "musl" --asset "tar.gz" --asset "^arm" --asset "^deb" --asset "^rpm" --to "$HOME/bin/delta"
  #---------------#
  #DevBox : Instant, easy, and predictable development environments
  # Requires Nix : curl -qfsSL "https://nixos.org/nix/install" | bash -s -- --daemon
  #   Recommended: curl -qfsSL "https://install.determinate.systems/nix" | bash -s -- install
  eget "jetpack-io/devbox" --asset "linux" --asset "64" --asset "^arm" --asset "tar.gz" --to "$HOME/bin/devbox"
  #---------------#
  #devpod : Codespaces but open-source, client-only and unopinionated
  eget "loft-sh/devpod" --asset "devpod" --asset "linux" --asset "amd64" --asset "^sha" --asset "^AppImage" --to "$HOME/bin/devpod"
  #---------------#
  #diffoci : diff for Docker and OCI container images 
  eget "reproducible-containers/diffoci" --asset "diffoci" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/diffoci"
  #---------------#
  #direnv: unclutter your .profile 
  eget "direnv/direnv" --asset "linux" --asset "amd64" --to "$HOME/bin/direnv"
  #---------------#
  #dizi: Server-client music player written in Rust    
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/kamiyaa/dizi" && cd "./dizi"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release
  mv "./target/$TARGET/release/dizi" "$HOME/bin/dizi" && mv "./target/$TARGET/release/dizi-server" "$HOME/bin/dizi-server" ; popd > /dev/null 2>&1
  #---------------#
  #dns-doctor : Runs dig +trace and dig +norecurse , parses the output, and tries to diagnose some problems
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/jvns/dns-doctor" && cd "./dns-doctor"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./dns-doctor" "$HOME/bin/dns-doctor" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #dnslookup : Simple command line utility to make DNS lookups to the specified server
  eget "ameshkov/dnslookup" --asset "linux" --asset "amd64" --to "$HOME/bin/dnslookup"
  #---------------#
  #dnstake : Check missing hosted DNS zones that can lead to subdomain takeover 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/pwnesia/dnstake" && cd "./dnstake"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/dnstake" ; mv "./dnstake" "$HOME/bin/dnstake" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #dnsx : Multi-purpose DNS toolkit allow to run multiple DNS queries
  eget "projectdiscovery/dnsx" --asset "amd64" --asset "linux" --to "$HOME/bin/dnsx"
  #---------------#
  #doggo : 🐶 Command-line DNS Client for Humans
  eget "mr-karan/doggo" --asset "linux" --asset "amd64" --to "$HOME/bin/doggo"
  #---------------#
  #dotenv-linter: ⚡️Lightning-fast linter for .env files. Written in Rust 🦀 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/dotenv-linter/dotenv-linter" && cd "./dotenv-linter"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/dotenv-linter" "$HOME/bin/dotenv-linter" ; popd > /dev/null 2>&1
  #---------------#
  #Dropbear : A smallish SSH server and client
  eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dbclient_amd_x86_64_Linux" --to "$HOME/bin/dbclient"
  eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dropbear_amd_x86_64_Linux" --to "$HOME/bin/dropbear"
  eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dropbearconvert_amd_x86_64_Linux" --to "$HOME/bin/dropbearconvert"
  eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dropbearkey_amd_x86_64_Linux" --to "$HOME/bin/dropbearkey"
  eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dropbearmulti_amd_x86_64_Linux" --to "$HOME/bin/dropbearmulti"
  eget "Azathothas/static-toolbox" --tag "dropbear" --asset "dropbearscp_amd_x86_64_Linux" --to "$HOME/bin/dropbearscp"
  #---------------#
  #ds (dirstat-rs) : (fastest?) disk usage cli, similar to windirstat. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/scullionw/dirstat-rs" && cd "./dirstat-rs"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/ds" "$HOME/bin/ds" ; popd > /dev/null 2>&1
  #---------------#
  #dsieve : Filter and enrich a list of subdomains by level  
  eget "trickest/dsieve" --asset "amd64" --to "$HOME/bin/dsieve"
  #---------------#
  #duf : Disk Usage/Free Utility - a better 'df' alternative
  eget "muesli/duf" --asset "linux_x86_64.tar.gz" --to "$HOME/bin/duf"
  #---------------#
  #dufs : A file server that supports static serving, uploading, searching, accessing control, webdav
  eget "sigoden/dufs" --asset "x86_64" --asset "linux" --asset "musl" --asset "gz" --to "$HOME/bin/dufs"
  #---------------#
  #dura: Dura is a background process that watches your Git repositories and commits your uncommitted changes without impacting HEAD, the current branch, or the Git index (staged files)
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/tkellogg/dura" && cd "./dura"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/dura" "$HOME/bin/dura" ; popd > /dev/null 2>&1
  #---------------#
  #dust : A more intuitive version of du in rust 
  eget "bootandy/dust" --asset "linux" --asset "musl" --asset "x86" --asset "64" --asset "tar.gz" --to "$HOME/bin/dust"
  #---------------#
  #dysk : A linux utility to get information on filesystems, like df but better  
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && curl -qfLJO $(curl -qfsSL "https://api.github.com/repos/Canop/dysk/releases/latest" | jq -r '.assets[].browser_download_url' | grep -i 'dysk' | grep -i 'zip')
  find . -type f -name '*.zip*' -exec unzip -o {} \;
  find . -type f -name '*.md' -exec rm {} \;
  #mv "$(find . -type d -name '*x86_64*' -name '*linux*' ! -name '*musl*')/dysk" "$HOME/bin/dysk_gcc"   
  mv "$(find . -type d -name '*x86_64*' -name '*linux*' -name '*musl*')/dysk" "$HOME/bin/dysk" ; popd > /dev/null 2>&1
  #---------------#
  #edgevpn : ⛵ The immutable, decentralized, statically built p2p VPN without any central server and automatic discovery  
  eget "mudler/edgevpn" --asset "edgevpn" --asset "x86_64" --asset "Linux" --asset "^deb" --asset "^rpm" --asset "^sha" --asset "^sig" --to "$HOME/bin/edgevpn"
  #---------------#
  #elfcat: ELF visualizer. Generates HTML files from ELF binaries.    
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/ruslashev/elfcat" && cd "./elfcat"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/elfcat" "$HOME/bin/elfcat" ; popd > /dev/null 2>&1
  #---------------#
  #enc : 🔑🔒 A modern and friendly CLI alternative to GnuPG
  eget "life4/enc" --asset "linux" --asset "x86_64" --asset "gz" --file "enc" --to "$HOME/bin/enc"
  #---------------#
  #encode : Encode|Decode input from stdin
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Brum3ns/encode" && cd "./encode"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/encode" ; mv "./encode" "$HOME/bin/encode" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #enola : Hunt down social media accounts by username across social networks 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/TheYahya/enola" && cd "./enola"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/enola/"
  mv "./enola" "$HOME/bin/enola" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #enumerepo : List all public repositories for (valid) GitHub usernames
  eget "trickest/enumerepo" --asset "amd64" --to "$HOME/bin/enumerepo"
  #---------------#
  #etcd : Distributed reliable key-value store for the most critical data of a distributed system
  eget "etcd-io/etcd" --asset "amd64" --asset "linux" --asset "gz" --asset "^etcdutl" --asset "^etcdctl" --to "$HOME/bin/etcd"
  eget "etcd-io/etcd" --asset "amd64" --asset "linux" --asset "gz" --file "etcdctl" --to "$HOME/bin/etcdctl"
  eget "etcd-io/etcd" --asset "amd64" --asset "linux" --asset "gz" --file "etcdutl" --to "$HOME/bin/etcdutl"
  #---------------#
  #exifLooter : ExifLooter finds geolocation on all image urls and directories also integrates with OpenStreetMap 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/aydinnyunus/exifLooter" && cd "./exifLooter"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./exifLooter" "$HOME/bin/exiflooter" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #eza : A modern replacement for ‘ls’. (Fork of exa)
  eget "eza-community/eza" --asset "linux" --asset "musl" --asset "x86" --asset "64" --asset "gz" --to "$HOME/bin/eza"
  #---------------#
  #falconhound: FalconHound is a blue team multi-tool
  eget "FalconForceTeam/FalconHound" --asset "Linux" --asset "FalconHound" --asset "x86_64" --asset "^arm" --to "$HOME/bin/falconhound"
  #---------------#
  #fastfetch : Like neofetch, but much faster because written in C.
  #This is Dynamic
  eget "fastfetch-cli/fastfetch" --asset "Linux" --asset "tar.gz" --to "$HOME/bin/fastfetch"
  #---------------#
  #fastld : go-fasttld is a high performance effective top level domains (eTLD) extraction module
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/elliotwutingfeng/go-fasttld" && cd "./go-fasttld"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./fasttld" "./cmd/main.go" ; mv "./fasttld" "$HOME/bin/fasttld" ; popd > /dev/null 2>&1
  #---------------#
  #fblog : Small command-line JSON Log viewer
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/brocode/fblog" && cd "./fblog"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/fblog" "$HOME/bin/fblog"
  #---------------#
  #fclones : Efficient Duplicate File Finder 
  eget "pkolaczk/fclones" --asset "linux" --asset "musl" --asset "64" --asset "tar.gz" --asset "^arm" --asset "^sha" --to "$HOME/bin/fclones"
  #---------------#
  #fd : A simple, fast and user-friendly alternative to 'find'
  eget "sharkdp/fd" --asset "linux" --asset "musl" --asset "x86" --asset "64" --asset "tar.gz" --to "$HOME/bin/fd"
  #---------------#
  #feroxbuster : A fast, simple, recursive content discovery tool written in Rust.
  eget "epi052/feroxbuster" --asset "linux" --asset "zip" --to "$HOME/bin/feroxbuster"
  #---------------#
  #ffmpeg : Static build of ffmpeg
  eget "eugeneware/ffmpeg-static" --asset "ffmpeg" --asset "linux" --asset "x64" --asset ".gz" --to "$HOME/bin/ffmpeg"
  eget "eugeneware/ffmpeg-static" --asset "ffprobe" --asset "linux" --asset "x64" --asset ".gz" --to "$HOME/bin/ffprobe"
  #---------------#
  #ffuf :  Fast web fuzzer written in Go 
  eget "ffuf/ffuf" --asset "amd64" --asset "linux" --to "$HOME/bin/ffuf"
  #---------------#
  #ffufw: a wrapper around ffuf to make directory bruteforcing easier and more intelligent
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/puzzlepeaches/ffufw" && cd "./ffufw"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./ffufw" "$HOME/bin/ffufw" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #ffufPostprocessing : Filter ffuf results
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Damian89/ffufPostprocessing" && cd "./ffufPostprocessing"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./ffufPostprocessing" "$HOME/bin/ffufPostprocessing" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache  
  #---------------#
  #fget : Multithread download for a list of files.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && mkdir fget && cd "./fget"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/fget/main.go"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/fget/go.mod"
  go get "github.com/Azathothas/Arsenal/fget"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./fget" ; mv "./fget" "$HOME/bin/fget" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache
  #---------------#
  #filebrowser : 📂 Web File Browser
  eget "filebrowser/filebrowser" --asset "linux" --asset "amd" --asset "64" --to "$HOME/bin/filebrowser"
  #---------------#
  #findutils : Rust implementation of findutils 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/uutils/findutils" && cd "./findutils"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release
  mv "./target/$TARGET/release/find" "$HOME/bin/find-rs"
  mv "./target/$TARGET/release/xargs" "$HOME/bin/xargs-rs"
  #---------------#
  #Findomain : Subdomains Finder
  eget "Findomain/Findomain" --asset "findomain-linux.zip" --asset "^386" --to "$HOME/bin/findomain"
  #---------------#
  #fingerprintx : Standalone utility for service discovery on open ports! 
  eget "praetorian-inc/fingerprintx" --asset "amd64" --asset "linux" --to "$HOME/bin/fingerprintx"
  #---------------#
  #fnm : 🚀 Fast and simple Node.js version manager, built in Rust 
  eget "Schniz/fnm" --asset "linux" --asset "^arm" --asset "^mac" --asset "^windows" --to "$HOME/bin/fnm"
  #---------------#
  #fq : jq for binary formats - tool, language and decoders for working with binary and text formats 
  eget "wader/fq" --asset "linux" --asset "64" --asset "^arm" --file "fq" --to "$HOME/bin/fq"
  #---------------#
  #fscan : A comprehensive intranet scanning tool that facilitates one-click automated, all-round missed scanning. 
  eget "shadow1ng/fscan" --asset "fscan" --asset "^arm" --asset "^exe" --asset "^freebsd" --asset "^mac" --asset "^mips" --asset "^solaris" --asset "^sha" --asset "^txt" --to "$HOME/bin/fscan"
  #---------------#
  #fuse-overlayfs : FUSE implementation for overlayfs 
  eget "containers/fuse-overlayfs" --asset "x86_64" --asset "^arm" --to "$HOME/bin/fuse-overlayfs"
  #---------------#
  #fuzzuli : URL fuzzing tool that aims to find critical backup files by creating a dynamic wordlist based on the domain.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/musana/fuzzuli" && cd "./fuzzuli"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./fuzzuli" "$HOME/bin/fuzzuli" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #fwanalyzer : a tool to analyze filesystem images for security   
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/cruise-automation/fwanalyzer" && cd "./fwanalyzer"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/fwanalyzer"
  mv "./fwanalyzer" "$HOME/bin/fwanalyzer" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #fx: Terminal JSON viewer & processor
  eget "antonmedv/fx" --asset "linux" --asset "amd64" --asset "gz" --to "$HOME/bin/fx"
  #---------------#
  #fzf : 🌸 A command-line fuzzy finder 
  eget "junegunn/fzf" --asset "linux" --asset "amd64" --asset "gz" --to "$HOME/bin/fzf"
  #---------------#
  #gau : Fetch known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, and Common Crawl. 
  #eget "lc/gau" --asset "amd64" --asset "linux" --to "$HOME/bin/gau"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/lc/gau" && cd "./gau"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/gau" ; mv "./gau" "$HOME/bin/gau" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gdu : Fast disk usage analyzer with console interface written in Go 
  eget "dundee/gdu" --asset "gdu_linux_amd64_static.tgz" --to "$HOME/bin/gdu"
  #---------------#
  #getJS : A tool to fastly get all javascript sources/files 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && mkdir getJS && cd "./getJS"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/getJS/main.go"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/getJS/go.mod"
  go get "github.com/Azathothas/Arsenal/getJS"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./getJS" ; mv "./getJS" "$HOME/bin/getJS" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache
  #---------------#
  #getghrel(get github release) is a tool that fetches and installs the latest release assets from Github 
  eget "kavishgr/getghrel" --asset "linux" --asset "amd64" --asset "gz" --to "$HOME/bin/getghrel"
  #---------------#
  #gf : A wrapper around grep
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/tomnomnom/gf" && cd "./gf"
  go mod init github.com/tomnomnom/gf ; go mod tidy
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./gf" "$HOME/bin/gf" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gfx : Updated gf
  #gfx --> symlinked to gf
  #eget "dwisiswant0/gfx" --asset "amd64" --asset "linux" --to "$HOME/bin/gfx" && ln -s "$HOME/bin/gfx" "$HOME/bin/gf"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/dwisiswant0/gfx" && cd "./gfx"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./gfx" "$HOME/bin/gfx" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gh : GitHub’s official command line tool
  eget "cli/cli" --asset "linux_amd64.tar.gz" --to "$HOME/bin/gh"
  #---------------#
  #gh-dash : A beautiful CLI dashboard for GitHub 🚀 
  eget "dlvhdr/gh-dash" --asset "linux" --asset "amd64" --to "$HOME/bin/gh-dash"
  #---------------#
  #gip : command-line tool to get global IP address 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/dalance/gip" && cd "./gip"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/gip" "$HOME/bin/gip" ; popd > /dev/null 2>&1
  #---------------#
  #git
  ## Too much of a headache, a zillion binaries and all of them require custom config.
  # Use: jj git --> https://github.com/martinvonz/jj
  #    : gix --> https://github.com/Byron/gitoxide
  # eget "Azathothas/static-toolbox" --tag "git" --asset "git_amd_x86_64_Linux" --asset "^tar.gz" --to "$HOME/bin/git"
  # eget "Azathothas/static-toolbox" --tag "git" --asset "gitk_amd_x86_64_Linux" --asset "^tar.gz" --to "$HOME/bin/gitk"
  # eget "Azathothas/static-toolbox" --tag "git" --asset "git_cvsserver_amd_x86_64_Linux" --asset "^tar.gz" --to "$HOME/bin/git-cvsserver"
  # eget "Azathothas/static-toolbox" --tag "git" --asset "git_lfs_amd_x86_64_Linux" --asset "^tar.gz" --to "$HOME/bin/git-lfs"
  # eget "Azathothas/static-toolbox" --tag "git" --asset "git_receive_pack_amd_x86_64_Linux" --asset "^tar.gz" --to "$HOME/bin/git-receive-pack"
  # eget "Azathothas/static-toolbox" --tag "git" --asset "git_shell_amd_x86_64_Linux" --asset "^tar.gz" --to "$HOME/bin/git-shell"
  # eget "Azathothas/static-toolbox" --tag "git" --asset "git_upload_archive_amd_x86_64_Linux" --asset "^tar.gz" --to "$HOME/bin/git-upload-archive"
  # eget "Azathothas/static-toolbox" --tag "git" --asset "git_upload_pack_amd_x86_64_Linux" --asset "^tar.gz" --to "$HOME/bin/git-upload-pack"
  # eget "Azathothas/static-toolbox" --tag "git" --asset "scalar_amd_x86_64_Linux" --asset "^tar.gz" --to "$HOME/bin/scalar"
  #---------------#
  #git-cliff : A highly customizable Changelog Generator that follows Conventional Commit specifications ⛰️
  eget "orhun/git-cliff" --asset "linux" --asset "64" --asset "musl" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --file "git-cliff" --to "$HOME/bin/git-cliff"
  #---------------#
  #git-lfs : Git extension for versioning large files 
  eget "git-lfs/git-lfs" --asset "linux" --asset "64" --asset "^arm" --file "git-lfs" --to "$HOME/bin/git-lfs"
  #---------------#
  #git-sizer : Compute various size metrics for a Git repository  
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/github/git-sizer" && cd "./git-sizer"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./git-sizer" "$HOME/bin/git-sizer" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gitea : Git with a cup of tea!
  # Bin ~ 100 MB
  eget "go-gitea/gitea" --asset "amd64" --asset "linux" --asset "xz" --asset "^asc" --asset "^sig" --asset "^sha" --to "$HOME/bin/gitea"
  #---------------#
  #go-git : A highly extensible Git implementation in pure Go. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/go-git/go-git" && cd "./go-git"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "git-clone" "./_examples/clone" ; mv "./git-clone" "$HOME/bin/git-clone"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "git-checkout" "./_examples/checkout" ; mv "./git-checkout" "$HOME/bin/git-checkout"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "git-pull" "./_examples/pull" ; mv "./git-pull" "$HOME/bin/git-pull"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "git-log" "./_examples/log" ; mv "./git-log" "$HOME/bin/git-log"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "git-tag" "./_examples/tag" ; mv "./git-tag" "$HOME/bin/git-tag"
  popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gitdorks_go : An automated collection tool for discovering sensitive information on GitHub
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/damit5/gitdorks_go" && cd "./gitdorks_go"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./gitdorks_go" "$HOME/bin/gitdorks_go" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #github-endpoints : Find endpoints on GitHub
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/gwen001/github-endpoints" && cd "./github-endpoints"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./github-endpoints" "$HOME/bin/github-endpoints" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #github-regexp : Basically a regexp over a GitHub search
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/gwen001/github-regexp" && cd "./github-regexp"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./github-regexp" "$HOME/bin/github-regexp" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #github-subdomains : Find subdomains on GitHub
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/gwen001/github-subdomains" && cd "./github-subdomains"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./github-subdomains" "$HOME/bin/github-subdomains" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gitlab-subdomains : Find subdomains on Gitlab
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/gwen001/gitlab-subdomains" && cd "./gitlab-subdomains"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./gitlab-subdomains" "$HOME/bin/gitlab-subdomains" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gitleaks : Protect and discover secrets using Gitleaks 🔑
  eget "gitleaks/gitleaks" --asset "linux" --asset "x64" --asset "tar.gz" --to "$HOME/bin/gitleaks"
  #---------------#
  #gitql : 💊 A git query language 
  eget "filhodanuvem/gitql" --asset "Linux" --asset "x86_64" --asset "tar.gz" --to "$HOME/bin/gitql"
  #---------------#
  #gitui : Blazing 💥 fast terminal-ui for git written in rust 🦀
  eget "extrawurst/gitui" --asset "gitui-linux-musl.tar.gz" --to "$HOME/bin/gitui"
  #---------------#
  #gix : An idiomatic, lean, fast & safe pure Rust implementation of Git
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Byron/gitoxide" && cd "./gitoxide"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release
  mv "./target/$TARGET/release/ein" "$HOME/bin/ein"
  mv "./target/$TARGET/release/gix" "$HOME/bin/gix"
  #---------------#
  #glow : Render markdown on the CLI
  eget "charmbracelet/glow" --asset "Linux" --asset "x86_64" --asset "^sbom" --to "$HOME/bin/glow"
  #---------------#
  #go-simplehttpserver : Go alternative of python SimpleHTTPServer
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/projectdiscovery/simplehttpserver" && cd "./simplehttpserver"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/simplehttpserver" ; mv "./simplehttpserver" "$HOME/bin/go-simplehttpserver" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #goawk : A POSIX-compliant AWK interpreter written in Go, with CSV support 
  eget "benhoyt/goawk" --asset "goawk" --asset "amd64" --asset "linux" --asset "^deb" --asset "^rpm" --asset "^sha" --asset "^sig" --to "$HOME/bin/goawk"
  #---------------#
  #gobuster : Directory/File, DNS and VHost busting tool written in Go
  eget "OJ/gobuster" --asset "Linux_x86_64.tar.gz" --to "$HOME/bin/gobuster"
  #---------------#
  #gocurl : Simplified version of curl written in pure Go 
  eget "ameshkov/gocurl" --asset "linux" --asset "amd64" --to "$HOME/bin/gocurl"
  #---------------#
  #godns : A dynamic DNS client tool supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS & DreamHost, etc
  eget "TimothyYe/godns" --asset "linux_amd64.tar.gz" --to "$HOME/bin/godns"
  #---------------#
  #godnsbench : Simple DNS bench util that supports encrypted protocols. 
  eget "ameshkov/godnsbench" --asset "linux" --asset "amd64" --to "$HOME/bin/godnsbench"
  #---------------#
  #gofireprox : FireProx written in Go 
  eget "mr-pmillz/gofireprox" --asset "amd64" --asset "linux" --to "$HOME/bin/gofireprox"
  #---------------#
  #gojq : Pure Go implementation of jq 
  eget "itchyny/gojq" --asset "amd64" --asset "linux" --to "$HOME/bin/gojq"
  #---------------#
  #goop : Dump a git repository from a website, focused on as-complete-as-possible dumps and handling weird edge-cases
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/nyancrimew/goop" && cd "./goop"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./goop" "$HOME/bin/goop" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #https://github.com/nyancrimew/goop/pull/22
  #pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/lavafroth/goop" && cd "./goop"
  #CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./goop" "$HOME/bin/goop" ; popd > /dev/null 2>&1
  #go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gorilla : Tool for generating wordlists or extending an existing one using mutations
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/d4rckh/gorilla" && cd "./gorilla"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/gorilla" "$HOME/bin/gorilla" ; popd > /dev/null 2>&1
  #---------------#
  #gosec : Go security checker
  eget "securego/gosec" --asset "linux" --asset "amd64" --asset "tar.gz" --asset "^sha" --asset "^sig" --to "$HOME/bin/gosec"
  #---------------#
  #gost : GO Simple Tunnel - a simple tunnel written in golang
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/gost/gost_amd_x86_64_Linux" --to "$HOME/bin/gost"
  #---------------#
  #gosu : Simple Go-based setuid+setgid+setgroups+exec 
  eget "tianon/gosu" --asset "amd64" --asset "^arm" --asset "^asc" --to "$HOME/bin/gosu"
  #---------------#
  #gotator : Generate DNS wordlists through permutations
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Josue87/gotator" && cd "./gotator"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./gotator" "$HOME/bin/gotator" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gotty : Share your terminal as a web application 
  eget "sorenisanerd/gotty" --asset "linux" --asset "amd64" --asset "tar.gz" --asset "^sha" --asset "^sig" --to "$HOME/bin/gotty"
  #---------------#
  #gowitness : 🔍 gowitness - a golang, web screenshot utility using Chrome Headless
  #eget "sensepost/gowitness" --asset "amd64" --asset "linux" --to "$HOME/bin/gowitness"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/sensepost/gowitness" && cd "./gowitness"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./gowitness" "$HOME/bin/gowitness" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gpg-tui : Manage your GnuPG keys with ease! 🔐
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/orhun/gpg-tui" && cd "./gpg-tui"
  sudo apt-get install libgpgme-dev libx11-dev libxcb-shape0-dev libxcb-xfixes0-dev libxkbcommon-dev -y
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/gpg-tui" "$HOME/bin/gpg-tui"
  #---------------#
  #gping : Ping, but with a graph
  eget "orf/gping" --asset "unknown-linux-musl" --asset "linux" --to "$HOME/bin/gping"
  #---------------#
  #gron : Make JSON greppable! 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/tomnomnom/gron" && cd "./gron"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./gron" "$HOME/bin/gron" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #GRPCurl : Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/fullstorydev/grpcurl" && cd "./grpcurl"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/grpcurl" ; mv "./grpcurl" "$HOME/bin/grpcurl" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gsocket : Connect like there is no firewall. Securely.
  eget "hackerschoice/gsocket" --asset "gsocket" --asset "linux" --asset "x86_64" --asset "^rpm" --asset "^deb" --to "$HOME/bin/gsocket"
  eget "hackerschoice/gsocket" --asset "gs-netcat" --asset "linux" --asset "x86_64" --asset "^rpm" --asset "^deb" --to "$HOME/bin/gs-netcat"
  #---------------#
  #gum : A tool for glamorous shell scripts. That can be used as a replacement for dialog(7) and other TUI tools.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/charmbracelet/gum" && cd "./gum"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./gum" "$HOME/bin/gum" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #gup : Update binaries installed by "go install" with goroutines.
  eget "nao1215/gup" --asset "linux" --asset "amd64" --asset "gz" --to "$HOME/bin/gup"
  #---------------#
  #Gxss : A tool to check a bunch of URLs that contain reflecting params
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/KathanP19/Gxss" && cd Gxss
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./Gxss" "$HOME/bin/gxss" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #hacker-scoper : Automagically filter URLs with Bug Bounty program scope rules scraped from the internet
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/ItsIgnacioPortal/hacker-scoper" && cd "./hacker-scoper"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./hacker-scoper" "$HOME/bin/hacker-scoper" ; popd > /dev/null 2>&1
  #---------------#
  #hakip2host : takes a list of IP addresses via stdin, then does a series of checks to return associated domain names
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/hakluke/hakip2host" && cd "./hakip2host"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./hakip2host" "$HOME/bin/hakip2host" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #hakoriginfinder : Tool for discovering the origin host behind a reverse proxy
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/hakluke/hakoriginfinder" && cd "./hakoriginfinder" 
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./hakoriginfinder" "$HOME/bin/hakoriginfinder" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #hakrawler : Simple, fast web crawler designed for easy, quick discovery of endpoints and assets within a web application
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/hakluke/hakrawler" && cd "hakrawler"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./hakrawler" "$HOME/bin/hakrawler" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #hakrevdns : Small, fast tool for performing reverse DNS lookups en masse.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/hakluke/hakrevdns" && cd "./hakrevdns"
  go mod init "github.com/hakluke/hakrevdns" ; go mod tidy
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./hakrevdns" "$HOME/bin/hakrevdns" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #halp : A CLI tool to get help with CLI tools 🐙 
  eget "orhun/halp" --asset "linux" --asset "64" --asset "musl" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --file "halp" --to "$HOME/bin/halp"
  #---------------#
  #HEDnsExtractor : Raw html extractor from Hurricane Electric portal
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/HuntDownProject/HEDnsExtractor" && cd HEDnsExtractor
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/hednsextractor" ; mv "./hednsextractor" "$HOME/bin/hednsextractor" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #Hexyl: A command-line hex viewer 
  eget "sharkdp/hexyl" --asset "linux" --asset "musl" --asset "x86_64" --to "$HOME/bin/hexyl"
  #---------------#
  #Horust: Horust is a supervisor / init system written in rust and designed to run inside containers. 
  eget "FedericoPonzi/Horust" --asset "linux" --asset "64" --asset "musl" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --to "$HOME/bin/horust"
  #---------------#
  #hostctl : dev tool to manage /etc/hosts like a pro! 
  eget "guumaster/hostctl" --asset "linux" --asset "64" --asset "tar.gz" --asset "^arm" --asset "^86" --asset "^sha" --asset "^sig" --asset "^deb" --asset "^rpm" --file "hostctl" --to "$HOME/bin/hostctl"
  #---------------#
  #hrekt: A really fast http prober.
  #eget "ethicalhackingplayground/hrekt" --asset "^exe" --to "$HOME/bin/hrekt"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/ethicalhackingplayground/hrekt" && cd "./hrekt"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET"
  export RUSTFLAGS="-C target-feature=+crt-static" ; sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/hrekt" "$HOME/bin/hrekt" ; popd > /dev/null 2>&1
  #---------------#
  #htmlq : Like jq, but for HTML
  #eget "mgdm/htmlq" --asset "x86_64-linux.tar.gz" --to "$HOME/bin/htmlq"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/mgdm/htmlq" && cd "./htmlq"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release
  file "./target/$TARGET/release/htmlq" ; ldd "./target/$TARGET/release/htmlq" ; ls "./target/$TARGET/release/htmlq" -lah
  mv "./target/$TARGET/release/htmlq" "$HOME/bin/htmlq" ; popd > /dev/null 2>&1
  #---------------#
  #httprobe : Take a list of domains and probe for working HTTP and HTTPS servers
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/tomnomnom/httprobe" && cd "./httprobe"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./httprobe" "$HOME/bin/httprobe" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #httpx : httpx is a fast and multi-purpose HTTP toolkit that allows running multiple probes
  eget "projectdiscovery/httpx" --asset "amd64" --asset "linux" --to "$HOME/bin/httpx"
  #---------------#
  #Hub : A command-line tool that makes git easier to use with GitHub.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/mislav/hub" && cd "./hub"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./hub" "$HOME/bin/hub" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #hugo: The world’s fastest framework for building websites. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/gohugoio/hugo" && cd "./hugo"
  CGO_ENABLED="1" go build -tags "extended" -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./hugo" "$HOME/bin/hugo" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #hex (hx): 🔮 Futuristic take on hexdump, made in Rust.    
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/sitkevij/hex" && cd "./hex"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/hx" "$HOME/bin/hx" ; popd > /dev/null 2>&1
  #---------------#
  #hxn : ⚡ Blazing-fast tool to grab screenshots of your domain list right from terminal
  eget "pwnwriter/haylxon" --asset "linux" --asset "musl" --asset "^.sha512" --to "$HOME/bin/hxn" && ln -s "$HOME/bin/hxn" "$HOME/bin/haylxon"
  #---------------#
  #hyperfine : A command-line benchmarking tool
  eget "sharkdp/hyperfine" --asset "linux" --asset "musl" --asset "x86_64" --to "$HOME/bin/hyperfine"
  #---------------#
  #hysp : 📦 An independent package manager that every hacker deserves.
  #eget "pwnwriter/hysp" --asset "linux" --asset "64" --asset "musl" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --file "hysp" --to "$HOME/bin/hysp"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/pwnwriter/hysp" && cd "./hysp"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/hysp" "$HOME/bin/hysp" ; popd > /dev/null 2>&1
  #---------------#
  #inscope : filtering URLs and domains supplied on stdin to make sure they meet one of a set of regular expressions
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && mkdir inscope && cd "./inscope"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/inscope/main.go"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/inscope/go.mod"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./inscope" ; mv "./inscope" "$HOME/bin/inscope" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache 
  #---------------#
  #interactsh : An OOB interaction gathering server and client library 
  eget "projectdiscovery/interactsh" --asset "amd64" --asset "linux" --asset "interactsh-client" --to "$HOME/bin/interactsh-client"
  eget "projectdiscovery/interactsh" --asset "amd64" --asset "linux" --asset "interactsh-server" --to "$HOME/bin/interactsh-server"
  #---------------#
  #invidtui : A TUI based Invidious client
  eget "darkhz/invidtui" --asset "x86_64" --asset "Linux" --asset "gz" --asset "^arm" --to "$HOME/bin/invidtui"
  #---------------#
  #iperf3 : A tool for network performance measurement and tuning
  eget "userdocs/iperf3-static" --asset "iperf3-amd64" --to "$HOME/bin/iperf3"
  #---------------#
  #ipt2socks : convert iptables/nftables transparent proxy traffic to socks5
  eget "zfl9/ipt2socks" --asset "x86_64" --asset "ipt2socks" --asset "^x32" --to "$HOME/bin/ipt2socks"
  #---------------#
  #istioctl : Connect, secure, control, and observe services.
  eget "istio/istio" --asset "amd64" --asset "linux" --asset "istioctl" --asset "tar.gz" --asset "^sha" --to "$HOME/bin/istioctl"
  #---------------#
  #jaeles : The Swiss Army knife for automated Web Application Testing
  #eget "jaeles-project/jaeles" --asset "linux" --to "$HOME/bin/jaeles"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/jaeles-project/jaeles" && cd "./jaeles"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./jaeles" "$HOME/bin/jaeles" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #jaq : A jq clone focussed on correctness, speed, and simplicity 
  eget "01mf02/jaq" --asset "jaq" --asset "linux" --asset "x86_64" --asset "musl" --asset "^sha" --to "$HOME/bin/jaq"
  #---------------#
  #jc : converts the output of popular command-line tools, file-types, and common strings to JSON, YAML, or Dictionaries
  eget "kellyjonbrazil/jc" --asset "linux" --asset "x86" --asset "64" --asset "tar.gz" --to "$HOME/bin/jc"
  staticx --loglevel DEBUG "$HOME/bin/jc" --strip "$HOME/bin/jc_staticx"
  #---------------#
  #jira : 🔥 Feature-rich interactive Jira command line. 
  eget "ankitpokhrel/jira-cli" --asset "linux" --asset "x86_64" --asset "gz" --to "$HOME/bin/jira"
  #---------------#
  #jj : A Git-compatible DVCS that is both simple and powerful
  eget "martinvonz/jj" --asset "linux" --asset "x86" --asset "64" --asset "musl" --asset "gz" --to "$HOME/bin/jj"
  #---------------#
  #jless : jless is a command-line JSON viewer designed for reading, exploring, and searching through JSON data
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/PaulJuliusMartinez/jless" && cd "./jless"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET"
  # Currenttly can't build static, flags get overidden, instead use staticX
  #export RUSTFLAGS="-C target-feature=+crt-static"  
  #echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  unset RUSTFLAGS ; cargo build --target "$TARGET" --release
  mv "./target/$TARGET/release/jless" "$HOME/bin/jless"
  staticx --loglevel DEBUG "$HOME/bin/jless" --strip "$HOME/bin/jless_staticx" ; popd > /dev/null 2>&1
  #---------------#
  #jq : Command-line JSON processor 
  eget "jqlang/jq" --asset "linux" --asset "amd64" --to "$HOME/bin/jq"
  #eget "jqlang/jq" --pre-release --tag "jq-1.7rc1" --asset "jq-linux-amd64" --to "$HOME/bin/jq"
  #---------------#
  #jql : A JSON Query Language CLI tool 
  eget "yamafaktory/jql" --asset "linux" --asset "musl" --asset "x86_64" --asset "^sha" --to "$HOME/bin/jql"
  #---------------#
  #jqp : TUI for jq
  eget "noahgorstein/jqp" --asset "Linux" --asset "x86_64" --file "jqp" --to "$HOME/bin/jqp"
  #---------------#
  #just : A handy way to save and run project-specific commands.
  eget "casey/just" --asset "linux" --asset "64" --asset "musl" --asset "^arm" --asset "^sha" --to "$HOME/bin/just"
  #---------------#
  #jwthack : 🔩 jwt-hack is tool for hacking / security testing to JWT
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/hahwul/jwt-hack" && cd "./jwt-hack"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./jwt-hack" "$HOME/bin/jwt-hack" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #k9s : 🐶 Kubernetes CLI To Manage Your Clusters In Style! 
  eget "derailed/k9s" --asset "k9s" --asset "Linux" --asset "amd64" --asset "gz" --to "$HOME/bin/k9s" 
  #---------------#
  #Kadeesh : A general-purpose, extensible, modular, memory-safe SSH server
  eget "kadeessh/kadeessh" --asset "linux" --asset "64" --asset "tar.gz" --asset "^arm" --to "$HOME/bin/kadeessh"
  #---------------#
  #kalker : calculator with math syntax that supports user-defined variables and functions, complex numbers, and estimation of derivatives and integrals 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/PaddiM8/kalker" && cd "./kalker"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/kalker" "$HOME/bin/kalker" ; popd > /dev/null 2>&1
  #---------------#
  #kanha : 🦚 A web-app pentesting suite written in rust
  eget "pwnwriter/kanha" --asset "linux" --asset "musl" --asset "^.sha512" --to "$HOME/bin/kanha"
  #---------------#
  #katana : A next-generation crawling and spidering framework
  eget "projectdiscovery/katana" --asset "amd64" --asset "linux" --to "$HOME/bin/katana"
  staticx --loglevel DEBUG "$HOME/bin/katana" --strip "$HOME/bin/katana_staticx"
  #pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/projectdiscovery/katana" && cd katana
  #CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./katana" "./cmd/katana" ; mv "./katana" "$HOME/bin/katana" ; popd > /dev/null 2>&1
  #---------------#
  #killport : A command-line tool to easily kill processes running on a specified port. 
  eget "jkfran/killport" --asset "linux" --asset "x86" --asset "64" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --to "$HOME/bin/killport"
  #---------------#
  #kmon : Linux Kernel Manager and Activity Monitor 🐧💻 
  eget "orhun/kmon" --asset "linux" --asset "64" --asset "musl" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --file "kmon" --to "$HOME/bin/kmon"  
  #---------------#
  #kondo : Cleans dependencies and build artifacts from your projects.
  eget "tbillington/kondo" --asset "linux" --asset "musl" --asset "x86" --asset "64" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --to "$HOME/bin/kondo"
  #---------------#
  #kopia : Backup tool with fast, incremental backups, client-side end-to-end encryption, compression and data deduplication
  eget "kopia/kopia" --asset "linux" --asset "64" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --asset "^deb" --asset "^rpm" --to "$HOME/bin/kopia"
  #---------------#
  #ksubdomain : Subdomain enumeration tool, asynchronous dns packets, use pcap to scan 1600,000 subdomains in 1 second
  eget "boy-hack/ksubdomain" --asset "linux.tar" --to "$HOME/bin/ksubdomain"
  staticx --loglevel DEBUG "$HOME/bin/ksubdomain" --strip "$HOME/bin/ksubdomain_staticx"
  #---------------#
  #ladder : Selfhosted alternative to 12ft.io. and 1ft.io   
  eget "everywall/ladder" --asset "ladder" --asset "amd64" --asset "linux" --asset "^deb" --asset "^rpm" --asset "^sha" --asset "^sig" --to "$HOME/bin/ladder"
  #---------------#
  #lazydocker : The lazier way to manage everything docker 
  eget "jesseduffield/lazydocker" --asset "Linux" --asset "x86_64" --to "$HOME/bin/lazydocker"
  #---------------#
  #lazygit : simple terminal UI for git commands
  eget "jesseduffield/lazygit" --asset "Linux" --asset "64" --asset "^arm" --file "lazygit" --to "$HOME/bin/lazygit"
  #---------------#
  #legba: A multiprotocol credentials bruteforcer / password sprayer and enumerator. 🥷     
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/evilsocket/legba" && cd "./legba"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/legba" "$HOME/bin/legba" ; popd > /dev/null 2>&1 
  #---------------#
  #lf : Terminal file manager
  eget "gokcehan/lf" --asset "linux" --asset "amd64" --asset "^arm" --to "$HOME/bin/lf"
  #---------------#
  #linuxwave : Generate music from the entropy of Linux 🐧🎵
  eget "orhun/linuxwave" --asset "linux" --asset "64" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --asset "^mac" --file "linuxwave" --to "$HOME/bin/linuxwave"
  #---------------#
  #listmonk : High performance, self-hosted, newsletter and mailing list manager with a modern dashboard  
  eget "knadh/listmonk" --asset "listmonk" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/listmonk"
  #---------------#
  #lit-bb-hack-tools : misc bb tools
  #bbscope Take as input on stdin a list of urls or subdomains and a BurpSuite Configuration file and print on stdout all in scope items.
  #bbtargets Produce as output on stdout all the bug bounty targets found on Chaos list by Project Discovery.
  #chainredir Take as input a URL and print on stdout all the redirects.
  #checkbypass Take as input on stdin a payload and print on stdout all the successful WAF bypasses.
  #cleanpath Take as input on stdin a list of urls/paths and print on stdout all the unique paths (at any level).
  #doomxss Take as input on stdin a list of html/js file urls and print on stdout all the possible DOM XSS sinks found.
  #eae Take as input on stdin a list of urls and print on stdout all the extensions sorted.
  #eah Take as input on stdin a list of urls and print on stdout all the hosts sorted.
  #eaparam Take as input on stdin a list of urls and print on stdout all the unique parameters.
  #eapath Take as input on stdin a list of urls and print on stdout all the unique urls without queries.
  #eap Take as input on stdin a list of urls and print on stdout all the protocols sorted.
  #earh Take as input on stdin a list of urls and print on stdout all the unique root hosts.
  #eefjsf Take as input on stdin a list of js file urls and print on stdout all the unique endpoints found.
  #genscope Take as input a file containing a list of (sub)domains (wildcards allowed) and produce a BurpSuite Configuration file.
  #gitdump It prints all the matches in a git repository with a specified pattern.
  #heacoll Take as input on stdin a list of urls and print on stdout all the unique headers found.
  #knoxssme Take as input on stdin a list of urls and print on stdout the results from Knoxss.me API.
  #kubemetrics Take as input on stdin a list of urls and print on stdout all the unique paths and urls found in the /metrics endpoint.
  #nrp Take as input on stdin a list of domains and print on stdout all the unique domains without redirects.
  #rapwp Take as input on stdin a list of urls and a payload and print on stdout all the unique urls with ready to use payloads.
  #removehost Take as input on stdin a list of urls and print on stdout all the unique queries without protocol and host.
  #removepro Take as input on stdin a list of urls and print on stdout all the unique urls without protocols.
  #robotstxt Take as input on stdin a list of urls and print on stdout all the unique paths found in the robots.txt file.
  #rpfu Take as input on stdin a list of urls and print on stdout all the unique urls without ports (if 80 or 443).
  #subtake Take as input on stdin a list of urls and print on stdout CNAME records found with dig.
  #tahm Take as input on stdin a list of urls and print on stdout all the status codes and body sizes for HTTP methods.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" https://github.com/edoardottt/lit-bb-hack-tools && cd "./lit-bb-hack-tools"
  find . -type f -name '*.md' -exec rm {} \;
  find . -maxdepth 1 -type d ! -name '.git*' -exec sh -c 'CGO_ENABLED="0" go build -o "$1/$1_amd_x86_64_Linux" -v -a -gcflags=all="-l -B -wb=false" -ldflags="-s -w -extldflags '\''-static'\''" "$1/"*' _ {} \;
  find . -type f -name '*_Linux' -exec mv {} "$HOME/bin/" \;
  popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #lnav : Log file navigator 
  eget "tstack/lnav" --asset "linux" --asset "musl" --asset "x86_64" --to "$HOME/bin/lnav"
  #---------------#
  #logtimer : Enhance your output with a timer / date 
  eget "Eun/logtimer" --asset "linux" --asset "x86_64.tar.gz" --to "$HOME/bin/logtimer"
  #---------------#
  #loki : Like Prometheus, but for logs. 
  eget "grafana/loki" --asset "logcli" --asset "linux" --asset "amd64" --asset "zip" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/logcli"
  eget "grafana/loki" --asset "loki" --asset "^loki-canary" --asset "linux" --asset "amd64" --asset "zip" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/loki"
  eget "grafana/loki" --asset "loki-canary" --asset "linux" --asset "amd64" --asset "zip" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/loki-canary"
  eget "grafana/loki" --asset "promtail" --asset "linux" --asset "amd64" --asset "zip" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/promtail"
  #---------------#
  #lsd : The next gen ls command
  eget "lsd-rs/lsd" --asset "linux" --asset "musl" --asset "x86_64" --asset "gz" --to "$HOME/bin/lsd"
  #---------------#
  #luet: 📦 🐳 0-dependency Container-based Package Manager 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/mudler/luet" && cd "./luet"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./luet" "$HOME/bin/luet" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #lux: 👾 Fast and simple video download library and CLI tool written in Go 
  eget "iawia002/lux" --asset "Linux" --asset "x86_64" --asset "tar.gz" --to "$HOME/bin/lux"
  #---------------#
  #mabel : A fancy BitTorrent client for the terminal. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/smmr-software/mabel" && cd "./mabel"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./mabel" "$HOME/bin/mabel" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #macchina : system-info-fetch
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Macchina-CLI/macchina" && cd "./macchina"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/macchina" "$HOME/bin/macchina" ; popd > /dev/null 2>&1
  #---------------#
  #maddy : ✉️ Composable all-in-one mail server. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/foxcpp/maddy" && cd "./maddy"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/maddy" ; mv "./maddy" "$HOME/bin/maddy" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #mailpit : An email and SMTP testing tool with API for developers 
  eget "axllent/mailpit" --asset "linux" --asset "amd64" --asset "tar.gz" --to "$HOME/bin/mailpit"
  #---------------#
  #mani : CLI tool that helps you manage multiple repositories
  eget "alajmo/mani" --asset "linux" --asset "64" --asset "tar.gz" --asset "^arm" --to "$HOME/bin/mani"
  #---------------#
  #mantra :「🔑」A tool used to hunt down API key leaks in JS files and pages 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/MrEmpy/mantra" && cd "./mantra"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./Mantra" "$HOME/bin/mantra" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #mapcidr : Utility program to perform multiple operations for a given subnet/CIDR ranges
  #eget "projectdiscovery/mapcidr" --asset "amd64" --asset "linux" --to "$HOME/bin/mapcidr"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/projectdiscovery/mapcidr" && cd "./mapcidr"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/mapcidr" ; mv "./mapcidr" "$HOME/bin/mapcidr" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #massdns : A high-performance DNS stub resolver for bulk lookups and reconnaissance (subdomain enumeration) 
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/massdns/massdns_linux_x86_64_gcc" --to "$HOME/bin/massdns"
  #---------------#
  #masscan
  #Doesn't work
  #eget "https://github.com/Azathothas/Static-Binaries/raw/main/masscan/masscan_linux_x86_64_gcc" --to "$HOME/bin/masscan"
  #---------------#
  #matterbridge : A simple chat bridge 
  eget "42wim/matterbridge" --asset "matterbridge" --asset "64" --asset "linux" --asset "^arm" --asset "^deb" --asset "^rpm" --asset "^sha" --asset "^sig" --to "$HOME/bin/matterbridge"
  #---------------#
  #mcfly : Fly through your shell history. Great Scott! 
  eget "cantino/mcfly" --asset "x86_64" --asset "linux" --asset "musl" --to "$HOME/bin/mcfly"
  #---------------#
  #mdcat : cat for markdown 
  eget "swsnr/mdcat" --asset "x86_64-unknown-linux-musl" --to "$HOME/bin/mdcat"
  #---------------#
  #mdsh : `$ mdsh` # a markdown shell pre-processor 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/zimbatm/mdsh" && cd "./mdsh"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/mdsh" "$HOME/bin/mdsh" ; popd > /dev/null 2>&1
  #---------------#
  #melange : build APKs from source code
  eget "chainguard-dev/melange" --asset "melange" --asset "linux" --asset "amd64" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/melange"
  #---------------#
  #menyoki : Screen{shot,cast} and perform ImageOps on the command line 🌱 🏞️ 
  #Also fails
  #pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/orhun/menyoki" && cd "./menyoki"
  #sudo apt-get install libx11-dev librust-x11-dev libxrandr-dev -y
  #export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  #sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  #echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  #cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/menyoki" "$HOME/bin/menyoki"
  #---------------#
  #mergerfs : A featureful union filesystem 
  eget "trapexit/mergerfs" --asset "amd64" --asset "static" --to "$HOME/bin/mergerfs"
  #---------------#
  #mgwls : Combine words from two wordlist files and concatenate them with an optional delimiter
  eget "trickest/mgwls" --asset "amd64" --asset "linux" --to "$HOME/bin/mgwls"
  #---------------#
  #micro : A modern and intuitive terminal-based text editor
  # Learn : https://github.com/zyedidia/micro/blob/master/runtime/help/keybindings.md
  eget "zyedidia/micro" --asset "linux64-static.tar.gz" --to "$HOME/bin/micro"
  #---------------#
  #miniflux : Minimalist and opinionated feed reader 
  eget "miniflux/v2" --asset "miniflux" --asset "amd64" --asset "linux" --asset "^deb" --asset "^rpm" --to "$HOME/bin/miniflux"
  #---------------#
  #miniserve : CLI tool to serve files and dirs over HTTP
  eget "svenstaro/miniserve" --asset "x86_64-unknown-linux-musl" --to "$HOME/bin/miniserve"
  #---------------#
  #minisign: A dead simple tool to sign files and verify digital signatures. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && eget "jedisct1/minisign" --asset "linux" --asset "^tar.gz.minisig" --asset "^arm" --asset "^aarch" --file "x86_64" 
  find . -type f -name "minisign" -exec mv {} "$HOME/bin/minisign" \; && popd > /dev/null 2>&1 
  #---------------#
  #mksub : Generate tens of thousands of subdomain combinations in a matter of seconds 
  eget "trickest/mksub" --asset "amd64" --asset "linux" --to "$HOME/bin/mksub"
  #---------------#
  #mlr (miller) : Miller is like awk, sed, cut, join, and sort for name-indexed data such as CSV, TSV, and tabular JSON 
  eget "johnkerl/miller" --asset "linux" --asset "64" --asset "tar.gz" --asset "^arm" --asset "^86" --asset "^sha" --asset "^sig" --asset "^deb" --asset "^rpm" --file "mlr" --to "$HOME/bin/mlr"
  #---------------#
  #mmv : rename multiple files with editor 
  eget "itchyny/mmv" --asset "amd64" --asset "linux" --to "$HOME/bin/mmv"
  #---------------#
  #mqttui : Subscribe to a MQTT Topic or publish something quickly from the terminal 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/EdJoPaTo/mqttui" && cd "./mqttui"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/mqttui" "$HOME/bin/mqttui" ; popd > /dev/null 2>&1
  #---------------#
  #mubeng : An incredibly fast proxy checker & IP rotator with ease
  #eget "kitabisa/mubeng" --asset "amd64" --asset "linux" --to "$HOME/bin/mubeng"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/kitabisa/mubeng" && cd "./mubeng"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/mubeng" ; mv "./mubeng" "$HOME/bin/mubeng" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #naabu : A fast port scanner written in go with a focus on reliability and simplicity
  eget "projectdiscovery/naabu" --asset "amd64" --asset "linux" --to "$HOME/bin/naabu"
  staticx --loglevel DEBUG "$HOME/bin/naabu" --strip "$HOME/bin/naabu_staticx"
  #---------------#
  #navi : An interactive cheatsheet tool for the command-line 
  eget "denisidoro/navi" --asset "x86_64" --asset "linux" --asset "musl" --asset "gz" --to "$HOME/bin/navi"
  #---------------#
  #ncdu : disk usage analyzer
  eget "https://dev.yorhel.nl$(curl -qfsSL https://dev.yorhel.nl/ncdu | awk -F '"' '/x86_64\.tar\.gz/ && /href=/{print $2}' | grep -v 'asc' | sort -u)" --to "$HOME/bin/ncdu"
  #---------------#
  #neofetch : Updated Fork
  eget "https://raw.githubusercontent.com/hykilpikonna/hyfetch/master/neofetch" --to "$HOME/bin/neofetch" ; chmod +xwr "$HOME/bin/neofetch"
  #---------------#
  #nerdctl : Docker-compatible CLI for containerd, with support for Compose, Rootless, eStargz, OCIcrypt, IPFS
  eget "containerd/nerdctl" --asset "linux" --asset "amd" --asset "64" --asset "^full" --asset "nerdctl" --to "$HOME/bin/nerdctl"
  #---------------#
  #NetBird : Connects Devices into a single secure private WireGuard®-based mesh network with SSO/MFA and simple access controls
  eget "netbirdio/netbird" --asset "linux" --asset "amd" --asset "64" --asset "tar.gz" --asset "^ui" --file "netbird" --to "$HOME/bin/netbird"
  #---------------#
  #NetMaker : makes networks with WireGuard
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/gravitl/netmaker" && cd "./netmaker"
  #Requires CGO for sqlite
  CGO_ENABLED="1" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; echo -e "\n" && file "./netmaker" && echo -e "\n"
  mv "./netmaker" "$HOME/bin/netmaker"
  CGO_ENABLED="1" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./nmctl" "./cli" ; echo -e "\n" && file "./nmctl" && echo -e "\n"
  mv "./nmctl" "$HOME/bin/nmctl" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #nginx : Static Nginx and njs binaries for Linux
  # https://github.com/jirutka/nginx-binaries --> binaries branch
  eget "$(curl -qfsSL "https://api.github.com/repos/jirutka/nginx-binaries/contents/?ref=binaries" -H "Accept: application/vnd.github.v3+json" | jq -r '.[].download_url' | grep -i "x86_64-linux$" | grep -iv "njs\|debug" | sort -u | tail -n 1)" --to "$HOME/bin/nginx"
  eget "$(curl -qfsSL "https://api.github.com/repos/jirutka/nginx-binaries/contents/?ref=binaries" -H "Accept: application/vnd.github.v3+json" | jq -r '.[].download_url' | grep -i "x86_64-linux$" | grep -iv "debug" | sort -u | tail -n 1)" --to "$HOME/bin/njs"
  #---------------#
  #ngocok: ngrok Collaborator Link — yet another Burp Collaborator alternative for free with ngrok. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/dwisiswant0/ngocok" && cd "./ngocok"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./ngocok" "$HOME/bin/ngocok" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #ngrok : External Tunnel to Internal Assets
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/ngrok/ngrok_amd_x86_64_Linux" --to "$HOME/bin/ngrok"
  #---------------#
  #niltalk : Instant, disposable, single-binary web based live chat server
  eget "knadh/niltalk" --asset "niltalk" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/niltalk"
  #---------------#
  #nmap : port scanner
  eget "Azathothas/static-toolbox" --tag "nmap" --asset "x86_64-portable.tar.gz" --all && mv "./ncat" "./nmap" "./nping" "$HOME/bin"
  #---------------#
  #nmap-formatter : A tool to convert NMAP results to html, csv, json, markdown, graphviz (dot) or sqlite
  #eget "vdjagilev/nmap-formatter" --asset "amd64" --asset "linux" --to "$HOME/bin/nmap-formatter"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/vdjagilev/nmap-formatter" && cd "./nmap-formatter"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./nmap-formatter" "$HOME/bin/nmap-formatter" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #nnn :  n³ The unorthodox terminal file manager 
  eget "jarun/nnn" --asset "musl-static" --asset "x86_64" --to "$HOME/bin/nnn"
  #---------------#
  #noir : ♠️ Noir is an attack surface detector that identifies endpoints by static analysis
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/hahwul/noir" && cd "./noir"
  shards build --release --no-debug --production --static ; mv "./bin/noir" "$HOME/bin/noir" ; popd > /dev/null 2>&1
  #staticx --loglevel DEBUG "$HOME/bin/noir" --strip "$HOME/bin/noir_staticx"
  #---------------#
  #notify : stream the output of several tools (or read from a file) and send notifications
  eget "projectdiscovery/notify" --asset "amd64" --asset "linux" --to "$HOME/bin/notify"
  #---------------#
  #nrich : A command-line tool to quickly analyze all IPs in a file and see which ones have open ports/ vulnerabilities
  # https://gitlab.com/shodan-public/nrich/-/releases
  eget "https://gitlab.com/api/v4/projects/33695681/packages/generic/nrich/0.4.1/nrich-linux-amd64" --to "$HOME/bin/nrich"
  #---------------#
  #nuclei : Fast and customizable vulnerability scanner based on simple YAML based DSL
  eget "projectdiscovery/nuclei" --asset "amd64" --asset "linux" --to "$HOME/bin/nuclei"
  #---------------#
  #nushell : A new type of shell 
  eget "nushell/nushell" --asset "x86_64" --asset "linux" --asset "musl" --asset "full" --asset "gz" --file "nu" --to "$HOME/bin/nu" 
  #---------------#
  #oha: HTTP load generator
  eget "hatoo/oha" --asset "amd64" --asset "linux" --to "$HOME/bin/oha"
  #---------------#
  #OneTun: User space WireGuard proxy in Rust
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/aramperes/onetun" && cd "./onetun"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/onetun" "$HOME/bin/onetun"
  #---------------#
  #openrisk : Generates a risk score based on the results of a Nuclei scan
  #eget "projectdiscovery/openrisk" --asset "amd64" --asset "linux" --to "$HOME/bin/openrisk"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/projectdiscovery/openrisk" && cd "./openrisk"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/openrisk" ; mv "./openrisk" "$HOME/bin/openrisk" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #orbiton : Fast and config-free text editor and IDE limited to VT100
  eget "xyproto/orbiton" --asset "linux" --asset "x86" --asset "64" --asset "static" --asset "tar" --file "o"  --to "$HOME/bin/orbiton"
  #---------------#
  #osmedeus : A Workflow Engine for Offensive Security
  #eget "j3ssie/osmedeus" --asset "linux.zip" --to "$HOME/bin/osmedeus"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/j3ssie/osmedeus" && cd osmedeus
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./osmedeus" "$HOME/bin/osmedeus" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #overmind : Process manager for Procfile-based applications and tmux
  eget "DarthSim/overmind" --asset "overmind" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/overmind"
  #---------------#
  #ouch : Painless compression and decompression in the terminal
  eget "ouch-org/ouch" --asset "linux" --asset "musl" --asset "x86" --asset "64" --asset "tar.gz" --asset "^arm" --file "ouch" --to "$HOME/bin/ouch"
  #---------------#
  #ov : 🎑Feature-rich terminal-based text viewer. It is a so-called terminal pager. 
  eget "noborus/ov" --asset "linux" --asset "amd64" --asset "zip" --asset "^deb" --asset "^rpm" --file "ov" --to "$HOME/bin/ov"
  #---------------#
  #PassDetective : PassDetective is a command-line tool that scans shell command history to detect mistakenly written passwords, API keys, and secrets 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/aydinnyunus/PassDetective" && cd "./PassDetective"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./PassDetective" "$HOME/bin/passdetective" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #pathbuster : A path-normalization pentesting tool
  eget "ethicalhackingplayground/pathbuster" --asset "^exe" --to "$HOME/bin/pathbuster"
  #---------------#
  #pdfcpu : A PDF processor written in Go. 
  eget "pdfcpu/pdfcpu" --asset "Linux" --asset "x86_64" --asset "tar" --to "$HOME/bin/pdfcpu"
  #---------------#
  #pfetch-rs : A rewrite of the pfetch system information tool in Rust  
  eget "Gobidev/pfetch-rs" --asset "linux" --asset "musl" --asset "x86_64" --asset "gz" --to "$HOME/bin/pfetch-rs"
  #---------------#
  #pgweb : Cross-platform client for PostgreSQL databases
  eget "sosedoff/pgweb" --asset "linux" --asset "amd64" --to "$HOME/bin/pgweb"
  #---------------#
  #phantun: Easy per application transparent proxy built on cgroup.    
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/dndx/phantun" && cd "./phantun"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release 
  mv "./target/$TARGET/release/client" "$HOME/bin/phantun-client"
  mv "./target/$TARGET/release/server" "$HOME/bin/phantun-server" ; popd > /dev/null 2>&1
  #---------------#
  #pkgtop : Interactive package manager and resource monitor designed for the GNU/Linux.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/orhun/pkgtop" && cd "./pkgtop"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/pkgtop.go"
  mv "./pkgtop" "$HOME/bin/pkgtop" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #planor : TUI client for cloud services (AWS, Vultr, Heroku, Render.com, Fleek, ...)
  eget "mrusme/planor" --asset "planor" --asset "linux" --asset "amd64" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/planor"
  #---------------#
  #podman : A tool for managing OCI containers and pods.
  eget "containers/podman" --asset "podman" --asset "remote" --asset "static" --asset "linux" --asset "amd64" --to "$HOME/bin/podman"
  #---------------#
  #podsync: Turn YouTube or Vimeo channels, users, or playlists into podcast feeds 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/mxpv/podsync" && cd "./podsync"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/podsync" ; mv "./podsync" "$HOME/bin/podsync" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #ppath : Pretty Print your system's PATH environment variable. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/marwanhawari/ppath" && cd "./ppath"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./ppath" "$HOME/bin/ppath" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache 
  #---------------#
  #ppfuzz : A fast tool to scan client-side prototype pollution vulnerability
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/dwisiswant0/ppfuzz" && cd "./ppfuzz"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/ppfuzz" "$HOME/bin/ppfuzz" ; popd > /dev/null 2>&1
  #---------------#
  #pping : tcp ping, tls ping, http ping, icmp ping, dns ping, quic ping
  eget "wzv5/pping" --asset "Linux" --asset "x86" --asset "64" --asset "tar.gz" --to "$HOME/bin/pping"
  #---------------#
  #presenterm:  A terminal slideshow tool 
  eget "mfontanini/presenterm" --asset "linux" --asset "x86_64" --asset "musl" --asset "^sha" --asset "^sig" --to "$HOME/bin/presenterm"
  #---------------#
  #prettyping: Ping prettier, more colorful, more compact, and easier to read
  eget "https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping" --to "$HOME/bin/prettyping" && chmod +xwr "$HOME/bin/prettyping"
  #---------------#
  #procs : A modern replacement for ps written in Rust
  eget "dalance/procs" --asset "linux" --asset "x86" --asset "64" --asset "zip" --to "$HOME/bin/procs"
  #---------------#
  #proxify : A versatile and portable proxy for capturing, manipulating, and replaying HTTP/HTTPS traffic on the go
  #eget "projectdiscovery/proxify" --asset "amd64" --asset "linux" --to "$HOME/bin/proxify"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/projectdiscovery/proxify" && cd "./proxify"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/proxify" ; mv "./proxify" "$HOME/bin/proxify" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #pspy : Monitor linux processes without root permissions 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/DominicBreuker/pspy" && cd "./pspy"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" 
  mv "./pspy" "$HOME/bin/pspy" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #pueue : task management tool for sequential and parallel execution of long-running tasks
  eget "Nukesor/pueue" --asset "linux" --asset "x86_64" --asset "^pueued" --to "$HOME/bin/pueue"
  eget "Nukesor/pueue" --asset "linux" --asset "x86_64" --asset "pueued" --to "$HOME/bin/pueued"
  #---------------#
  #puredns : fast domain resolver and subdomain bruteforcing tool that can accurately filter out wildcard subdomains and DNS poisoned entries
  eget "d3mondev/puredns" --asset "amd64" --to "$HOME/bin/puredns"
  #---------------#
  #pwninit: automate starting binary exploit challenges    
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/io12/pwninit" && cd "./pwninit"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/pwninit" "$HOME/bin/pwninit" ; popd > /dev/null 2>&1
  #---------------#
  #Qbittorent-nox : static Single binary for qbittorent
  eget "userdocs/qbittorrent-nox-static" --asset "x86_64-qbittorrent-nox" --to "$HOME/bin/qbittorrent-nox"
  #---------------#
  #qsreplace : Accept URLs on stdin, replace all query string values with a user-supplied value 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/tomnomnom/qsreplace" && cd "./qsreplace"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./qsreplace" "$HOME/bin/qsreplace" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #qsv : CSVs sliced, diced & analyzed.
  eget "jqnatividad/qsv" --asset "linux" --asset "64" --asset "musl" --asset "^arm" --asset "^sha" --asset "^sig" --file "qsv" --to "$HOME/bin/qsv"
  #runst : A dead simple notification daemon 🦡 
  ##Fails
  #pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/orhun/runst" && cd "./runst"
  #sudo apt-get install 'libdbus*' 'libpango*' '*librust-pango*' '*pango*' -y
  #export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  #sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  #echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  #cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/runst" "$HOME/bin/runst"
  #---------------#
  #quickcert : Query crtsh via pgsl server --> postgres://guest@crt.sh:5432/certwatch?sslmode=disable&default_query_exec_mode=simple_protocol
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/c3l3si4n/quickcert" && cd "./quickcert"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./quickcert" "$HOME/bin/quickcert" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #rate-limit-checker : Check whether the domain has a rate limit enabled
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && mkdir rate-limit-checker && cd "./rate-limit-checker"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/rate-limit-checker/main.go"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/rate-limit-checker/go.mod"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./rate-limit-checker" ; mv "./rate-limit-checker" "$HOME/bin/rate-limit-checker" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache
  #---------------#
  #rathole : A lightweight and high-performance reverse proxy for NAT traversal, written in Rust. An alternative to frp and ngrok.
  eget "rapiz1/rathole" --asset "x86_64" --asset "linux" --asset "rathole" --asset "gnu" --asset "^sha" --to "$HOME/bin/rathole"
  #---------------#
  #rclone : rsync for cloud storage
  eget "rclone/rclone" --asset "linux-amd64.zip" --to "$HOME/bin/rclone"
  #---------------#
  #reader : A lightweight tool offering better readability of web pages on the CLI
  eget "mrusme/reader" --asset "linux" --asset "amd64" --asset "gz" --to "$HOME/bin/reader"
  #---------------#
  #realm : A network relay tool 
  eget "zhboner/realm" --asset "x86_64" --asset "linux" --asset "realm" --asset "musl" --asset "^sha" --to "$HOME/bin/realm"
  #---------------#
  #rebuilderd: Independent verification of binary packages - reproducible builds 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/kpcyrd/rebuilderd" && cd "./rebuilderd"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release 
  mv "./target/$TARGET/release/rebuildctl" "$HOME/bin/rebuildctl"
  mv "./target/$TARGET/release/rebuilderd" "$HOME/bin/rebuilderd" 
  mv "./target/$TARGET/release/rebuilderd-worker" "$HOME/bin/rebuilderd-worker" ; popd > /dev/null 2>&1
  #---------------#
  #recollapse : Helper tool for black-box regex fuzzing to bypass validations and discover normalizations in web applications
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/0xacb/recollapse" && cd "./recollapse"
  pip install --upgrade -r requirements.txt ; mv "./recollapse" "./recollapse.py"
  pyinstaller --clean "./recollapse.py" --noconfirm ; pyinstaller --strip --onefile "./recollapse.py" --noconfirm
  staticx --loglevel DEBUG "./dist/recollapse" --strip "$HOME/bin/recollapse_staticx" ; popd > /dev/null 2>&1
  #---------------#
  #redguard : RedGuard is a C2 front flow control tool,Can avoid Blue Teams,AVs,EDRs check. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/wikiZ/RedGuard" && cd "./RedGuard"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./RedGuard" "$HOME/bin/redguard" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #redive : Trace URL redirections in the terminal.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/neelkarma/redive" && cd "./redive"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/redive" "$HOME/bin/redive" ; popd > /dev/null 2>&1
  #---------------#
  #rekor : Software Supply Chain Transparency Log 
  eget "sigstore/rekor" --asset "rekor" --asset "linux" --asset "cli" --asset "amd64" --asset "^sbom" --asset "^sig" --asset "^crt" --asset "^pem" --asset "^sha" --to "$HOME/bin/rekor"
  eget "sigstore/rekor" --asset "rekor" --asset "linux" --asset "server" --asset "amd64" --asset "^sbom" --asset "^sig" --asset "^crt" --asset "^pem" --asset "^sha" --to "$HOME/bin/rekor"
  #---------------#
  #relic : a tool for adding digital signatures to operating system packages for Linux and Windows   
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/sassoftware/relic" && cd "./relic"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./relic" "$HOME/bin/relic" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #reptyr : Reparent a running program to a new terminal 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/nelhage/reptyr" && cd "./reptyr"
  make CFLAGS="-MD -Wall -Werror -D_GNU_SOURCE -g -static $CFLAGS" LDFLAGS="-static $LDFLAGS" all
  strip "./reptyr" ; mv "./reptyr" "$HOME/bin/reptyr" ; popd > /dev/null 2>&1
  #---------------#
  #rescope : A scope generation tool for Burp Suite & ZAP
  # Installton will require placing a /tmp/rescope/configs/avoid.txt
  # mkdir -p "/tmp/rescope/configs" ; curl -qfsSL "https://raw.githubusercontent.com/root4loot/rescope/master/configs/avoid.txt" -o "/tmp/rescope/configs/avoid.txt"
  cd /tmp && git clone --filter "blob:none" "https://github.com/root4loot/rescope" && cd "./rescope"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./rescope" "$HOME/bin/rescope" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #resDNS : Wrapper around [dnsx + puredns + shuffledns] for Efficient DNS Resolution
  eget "https://raw.githubusercontent.com/Azathothas/Arsenal/main/resdns/resdns.sh" --to "$HOME/bin/resdns"
  #---------------#
  #restic : Fast, secure, efficient backup program 
  eget "restic/restic" --asset "linux" --asset "amd64" --to "$HOME/bin/restic"
  #---------------#
  #resto : 🔗 Send pretty HTTP & API requests with TUI.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/abdfnx/resto" && cd "./resto"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./resto" "$HOME/bin/resto" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #revit : A command-line utility for performing reverse DNS lookups
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/devanshbatham/revit" && cd "./revit"
  rm go.mod ; rm go.sum ; go mod init github.com/devanshbatham/revit ; go mod tidy
  go get github.com/devanshbatham/revit/cmd/revit
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/revit" ; mv "./revit" "$HOME/bin/revit" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #rg (ripgrep)
  eget "BurntSushi/ripgrep" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/rg"
  eget "BurntSushi/ripgrep" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/ripgrep"
  #---------------#
  #rga (ripgrep-all) : ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc
  eget "phiresky/ripgrep-all" --asset "linux" --asset "musl" --asset "x86_64" --file "rga" --to "$HOME/bin/rga"
  #---------------#
  #ripgen : Rust-based high performance domain permutation generator
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/resyncgg/ripgen" && cd "./ripgen"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/ripgen" "$HOME/bin/ripgen" ; popd > /dev/null 2>&1
  #---------------#
  #rnr : A command-line tool to batch rename files and directories 
  eget "ismaelgv/rnr" --asset "linux" --asset "musl" --asset "x86_64" --to "$HOME/bin/rnr"
  #---------------#
  #roboxtractor : Extract endpoints marked as disallow in robots files to generate wordlists
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Josue87/roboxtractor" && cd "./roboxtractor"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./roboxtractor" "$HOME/bin/roboxtractor" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #rootlesskit : Linux-native "fake root" for implementing rootless containers 
  eget "rootless-containers/rootlesskit" --asset "x86_64" --asset "^sig" --asset "^aarch" --asset "^arm" --file "rootlesskit" --to "$HOME/bin/rootlesskit"
  #---------------#
  #ropr: A blazing fast™ multithreaded ROP Gadget finder. ropper / ropgadget alternative  
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Ben-Lichtman/ropr" && cd "./ropr"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/ropr" "$HOME/bin/ropr" ; popd > /dev/null 2>&1
  #---------------#
  #rospo : 🐸 Simple, reliable, persistent ssh tunnels with embedded ssh server
  eget "ferama/rospo" --asset "linux" --asset "64" --asset "^arm" --asset "^sig" --to "$HOME/bin/rospo"
  #---------------#
  #rpaste (rustypaste-cli) : A CLI tool for rustypaste  
  eget "orhun/rustypaste-cli" --asset "linux" --asset "64" --asset "musl" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --to "$HOME/bin/rpaste"
  #---------------#
  #rqbit : A bittorrent client in Rust 
  eget "ikatson/rqbit" --asset "linux" --asset "static" --asset "x86_64" --asset "^sig" --asset "^sha" --to "$HOME/bin/rqbit"
  #---------------#
  #rshijack: tcp connection hijacker, rust rewrite of shijack 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/kpcyrd/rshijack" && cd "./rshijack"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/rshijack" "$HOME/bin/rshijack" ; popd > /dev/null 2>&1
  #---------------#
  #ruff : An extremely fast Python linter and code formatter, written in Rust.
  eget "astral-sh/ruff" --asset "linux" --asset "64" --asset "musl" --asset "^arm" --asset "^sha" --to "$HOME/bin/ruff"
  #---------------#
  #runc : CLI tool for spawning and running containers according to the OCI specification
  eget "opencontainers/runc" --asset "amd" --asset "64" --asset "^asc" --to "$HOME/bin/runc"
  #---------------#
  #runme : Execute your runbooks, docs, and READMEs.
  eget "stateful/runme" --asset "linux" --asset "x86_64" --asset "tar.gz" --file "runme" --to "$HOME/bin/runme"
  #---------------#
  #rush : A cross-platform command-line tool for executing jobs in parallel
  eget "shenwei356/rush" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/rush"
  #---------------#
  #Rustscan : 🤖 The Modern Port Scanner 🤖  
  #GH Releases are outdated
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/RustScan/RustScan" && cd "./RustScan"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/rustscan" "$HOME/bin/rustcan" ; popd > /dev/null 2>&1
  #---------------#
  #rustypaste : A minimal file upload/pastebin service. 
  eget "orhun/rustypaste" --asset "linux" --asset "64" --asset "musl" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --file "rustypaste" --to "$HOME/bin/rustypaste"
  #---------------#
  #s3scanner : Scan for misconfigured S3 buckets across S3-compatible APIs
  eget "sa7mon/S3Scanner" --asset "Linux" --asset "x86" --asset "64" --asset "tar.gz" --to "$HOME/bin/s3scanner"
  #---------------#
  #s3sync : Really fast sync tool for S3
  eget "larrabee/s3sync" --asset "x86_64" --asset "Linux" --asset "s3sync" --asset "tar.gz" --asset "^sha" --to "$HOME/bin/s3sync"
  #---------------#
  #s5cmd : Parallel S3 and local filesystem execution tool. 
  eget "peak/s5cmd" --asset "Linux" --asset "64bit" --asset "tar.gz" --asset "^arm" --to "$HOME/bin/s5cmd"
  #---------------#
  #sake : 🤖 Task runner for local and remote hosts via ssh & more
  eget "alajmo/sake" --asset "linux" --asset "64" --asset "tar.gz" --asset "^arm" --to "$HOME/bin/sake"
  #---------------#
  #sbctl : 💻 🔒 🔑 Secure Boot key manager
  eget "Foxboron/sbctl" --asset "sbctl" --asset "linux" --asset "amd64" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/sbctl"
  #---------------#
  #scilla : Information Gathering tool - DNS / Subdomains / Ports / Directories enumeration 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/edoardottt/scilla" && cd "./scilla"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/scilla" ; mv "./scilla" "$HOME/bin/scilla" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #scopegen : Generates .scope compatible format for ScopeView (based on TomNomNom's Inscope)
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && mkdir scopegen && cd "./scopegen"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/scopegen/scopegen.go"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/scopegen/go.mod"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "scopegen" "./scopegen.go" ; mv "./scopegen" "$HOME/bin/scopegen" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #scopeview : Slightly revamped vesion of TomNomNom's Inscope that allows custom .scope to be defined using -s or --scope options
  eget "https://raw.githubusercontent.com/Azathothas/Arsenal/main/scopeview/scopeview.sh" --to "$HOME/bin/scopeview"
  #---------------#
  #scp : copies files between hosts on a network using SFTP protocol over ssh
  eget "https://files.serverless.industries/bin/scp.amd64" --to "$HOME/bin/scp"
  #eget "Azathothas/static-toolbox" --tag "openssh" --asset "scp_amd_x86_64_Linux" --to "$HOME/bin/scp"
  #---------------#
  #screenfetch : bash neofetch alt
  eget "https://raw.githubusercontent.com/KittyKatt/screenFetch/master/screenfetch-dev" --to "$HOME/bin/screenfetch" ; chmod +xwr "$HOME/bin/screenfetch"
  #---------------#
  #sd : Intuitive find & replace CLI (sed alternative) 
  eget "chmln/sd" --asset "linux" --asset "x86_64" --asset "musl" --asset "tar.gz" --to "$HOME/bin/sd"
  #---------------#
  #sessionprobe : evaluates user privileges in web applications by taking a session token and checking access across a list of URLs
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/dub-flow/sessionprobe" && cd "./sessionprobe"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./sessionprobe" "$HOME/bin/sessionprobe" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #sftp : Dependency for sshd
  eget "Azathothas/static-toolbox" --tag "openssh" --asset "sftp_amd_x86_64_Linux" --to "$HOME/bin/sftp"
  eget "Azathothas/static-toolbox" --tag "openssh" --asset "sftp_server_amd_x86_64_Linux" --to "$HOME/bin/sftp-server"
  #eget "https://github.com/Azathothas/Static-Binaries/raw/main/openssh/sftp_server_amd_x86_64_Linux" --to "$HOME/bin/sftp"
  #---------------#
  #shellharden : The corrective bash syntax highlighter 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/anordal/shellharden" && cd "./shellharden"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/shellharden" "$HOME/bin/shellharden" ; popd > /dev/null 2>&1
  #---------------#
  #shellz : a small utility to manage your ssh, telnet, kubernetes, winrm, web or any custom shell in a single place.   
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/evilsocket/shellz" && cd "./shellz"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/shellz"
  mv "./shellz" "$HOME/bin/shellz" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #shfmt : A shell parser, formatter, and interpreter with bash support; includes shfmt 
  eget "mvdan/sh" --asset "linux_amd64" --to "$HOME/bin/shfmt"
  #---------------#
  #shortscan : An IIS short filename enumeration tool 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/bitquark/shortscan" && cd "./shortscan"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/shortscan" ; mv "./shortscan" "$HOME/bin/shortscan" 
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/shortutil" ; mv "./shortutil" "$HOME/bin/shortutil"
  popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #shuffledns : MassDNS wrapper written in go
  eget "projectdiscovery/shuffledns" --asset "amd64" --asset "linux" --to "$HOME/bin/shuffledns"
  #---------------#
  #sish : HTTP(S)/WS(S)/TCP Tunnels to localhost using only SSH.  
  eget "antoniomika/sish" --asset "sish" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/sish"
  #---------------#
  #sj : A tool for auditing endpoints defined in exposed (Swagger/OpenAPI) definition files.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/BishopFox/sj" && cd "./sj"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./sj" "$HOME/bin/sj" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #skim : Fuzzy Finder in rust! 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/lotabout/skim" && cd "./skim"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/sk" "$HOME/bin/sk" ; popd > /dev/null 2>&1
  eget "https://raw.githubusercontent.com/lotabout/skim/master/bin/sk-tmux" --to "$HOME/bin/sk-tmux" && chmod +xwr "$HOME/bin/sk-tmux"
  #---------------#
  #sliver : Adversary Emulation Framework 
  eget "BishopFox/sliver" --asset "sliver-client" --asset "linux" --asset "^sig" --asset "^sha" --to "$HOME/bin/sliver-client"
  eget "BishopFox/sliver" --asset "sliver-server" --asset "linux" --asset "^sig" --asset "^sha" --to "$HOME/bin/sliver-server"
  #---------------#
  #smap : a drop-in replacement for Nmap powered by shodan.io
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/s0md3v/Smap" && cd "./Smap"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/smap" ; mv "./smap" "$HOME/bin/smap" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #smenu : a powerful and versatile CLI selection tool for interactive or scripting use
  eget "p-gen/smenu" --asset "86_64" --asset "static" --asset "xz" --asset "^asc" --asset "linux" --to "$HOME/bin/smenu"
  #---------------#
  #sn0int: Semi-automatic OSINT framework and package manager  
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/kpcyrd/sn0int" && cd "./sn0int"
  sudo apt-get install librust-libsodium-sys-dev librust-memsec-dev libsodium-dev -y
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/sn0int" "$HOME/bin/sn0int" ; popd > /dev/null 2>&1  
  #---------------#
  #sns : IIS shortname scanner written in Go 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/sw33tLie/sns" && cd "./sns"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./sns" "$HOME/bin/sns" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #socat : successor to netcat
  eget "Azathothas/static-toolbox" --tag "socat" --asset "x86_64" --to "$HOME/bin/socat"
  #---------------#
  #speedtest-go : CLI and Go API to Test Internet Speed using multiple-servers
  eget "showwin/speedtest-go" --asset "Linux_x86_64.tar.gz" --to "$HOME/bin/speedtest-go"
  #---------------#
  #spk : A small OSINT/Recon tool to find CIDRs that belong to a specific organization
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/dhn/spk" && cd "./spk"
  CGO_ENABLED="0" go build -o "spk_amd_x86_64_Linux" -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  find . -type f -name '*_Linux' -exec mv {} "$HOME/bin/spk" \;
  go clean -cache -fuzzcache -modcache -testcache ; popd > /dev/null 2>&1
  #---------------#
  #spoof-dpi : A simple and fast anti-censorship tool written in Go
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/xvzc/SpoofDPI" && cd "./SpoofDPI"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/spoof-dpi"
  mv "./spoof-dpi" "$HOME/bin/spoof-dpi" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #sq : jq for sql
  eget "neilotoole/sq" --asset "linux" --asset "amd64" --asset "tar" --to "$HOME/bin/sq"
  #---------------#
  #sqlc : Universal DBMS/SQL client with exfiltration features :)  
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/kost/sqlc" && cd "./sqlc"
  CGO_ENABLED="1" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./sqlc" "$HOME/bin/sqlc" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #ssh
  eget "https://files.serverless.industries/bin/ssh.amd64" --to "$HOME/bin/ssh"
  #eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh_amd_x86_64_Linux" --to "$HOME/bin/ssh"
  #---------------#
  #ssh-add : adds RSA or DSA identities to the authentication agent ssh-agent
  eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh-add_amd_x86_64_Linux" --to "$HOME/bin/ssh-add"
  #---------------#
  #ssh-agent : OpenSSH authentication agent
  eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh-agent_amd_x86_64_Linux" --to "$HOME/bin/ssh-agent"
  #---------------#
  #ssh-keygen : OpenSSH authentication key utility
  eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh-keygen_amd_x86_64_Linux" --to "$HOME/bin/ssh-keygen"
  #---------------#
  #ssh-keyscan : gather SSH public keys from servers
  eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh-keyscan_amd_x86_64_Linux" --to "$HOME/bin/ssh-keyscan"
  #---------------#
  #ssh-keysign : OpenSSH helper for host-based authentication
  eget "Azathothas/static-toolbox" --tag "openssh" --asset "ssh-keysign_amd_x86_64_Linux" --to "$HOME/bin/ssh-keysign"
  #---------------#
  #sshd
  eget "Azathothas/static-toolbox" --tag "openssh" --asset "sshd_amd_x86_64_Linux" --to "$HOME/bin/sshd"
  #eget "https://github.com/Azathothas/Static-Binaries/raw/main/openssh/sshd_amd_x86_64_Linux" --to "$HOME/bin/sshd"
  #---------------#
  #sshd_config
  eget "Azathothas/static-toolbox" --tag "openssh" --asset "sshd_config_amd_x86_64_Linux" --to "$HOME/bin/sshd_config"
  #eget "https://raw.githubusercontent.com/Azathothas/Static-Binaries/main/openssh/sshd_config_amd_x86_64_Linux" --to "$HOME/bin/sshd_config"
  #---------------#
  #sshesame : SSH honeypot, a fake SSH server that lets anyone in and logs their activity
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/jaksi/sshesame" && cd "./sshesame"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./sshesame" "$HOME/bin/sshesame" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #sshkeys : Get all ssh public keys of a ssh server
  eget "Eun/sshkeys" --asset "linux_amd64.tar.gz" --to "$HOME/bin/sshkeys"
  #---------------#
  #sshportal : Embedded SSH Server & Client meant for temp ssh access using invite codes
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/moul/sshportal" && cd "./sshportal"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./sshportal" "$HOME/bin/sshportal" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #sshx : Fast, collaborative live terminal sharing over the web
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/ekzhang/sshx" && cd "./sshx"
  sudo apt-get install protobuf-compiler -y
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/sshx" "$HOME/bin/sshx" ; mv "./target/$TARGET/release/sshx-server" "$HOME/bin/sshx-server" ; popd > /dev/null 2>&1
  #---------------#
  #starship : ☄🌌️ The minimal, blazing-fast, and infinitely customizable prompt for any shell! 
  eget "starship/starship" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/starship"
  #---------------#
  #stew : 🥘 An independent package manager for compiled binaries.  
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/marwanhawari/stew" && cd "./stew"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./stew" "$HOME/bin/stew" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #strace : diagnostic, debugging and instructional userspace utility for Linux 
  eget "Azathothas/static-toolbox" --tag "strace" --asset "x86_64" --to "$HOME/bin/strace"
  #---------------#
  #sttr : cli app to perform various operations on string
  eget "abhimanyu003/sttr" --asset "amd" --asset "64" --asset "tar.gz" --to "$HOME/bin/sttr"
  #---------------#
  #stuffbin : Compress and embed static files and assets into Go binaries and access them with a virtual file system in production 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/knadh/stuffbin" && cd "./stuffbin"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "/tmp/stuffbin" "./stuffbin"
  mv "/tmp/stuffbin" "$HOME/bin/stuffbin" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #subfinder : Fast passive subdomain enumeration tool
  eget "projectdiscovery/subfinder" --asset "amd64" --asset "linux" --to "$HOME/bin/subfinder"
  #---------------#
  #subjs : Fetches javascript file from a list of URLS or subdomains
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/lc/subjs" && cd "./subjs"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./subjs" "$HOME/bin/subjs" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #subxtract : Public-Suffix based TLDs (Top-Level-Domains) & Root Domain Extractor
  eget "https://raw.githubusercontent.com/Azathothas/Arsenal/main/subxtract/subxtract.sh" --to "$HOME/bin/subxtract"
  #---------------#
  #sunbeam: a general purpose command-line launcher
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/pomdtr/sunbeam" && cd "./sunbeam"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./sunbeam" "$HOME/bin/sunbeam" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #supervisord : a go-lang supervisor implementation 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/ochinchina/supervisord" && cd "./supervisord"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./supervisord" "$HOME/bin/supervisord" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #surf : filter a list of hosts, returning a list of viable SSRF candidates
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/assetnote/surf" && cd "./surf"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/surf" ; mv "./surf" "$HOME/bin/surf" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #svg-hush: Make it safe to serve untrusted SVG files   
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/cloudflare/svg-hush" && cd "./svg-hush"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/svg-hush" "$HOME/bin/svg-hush" ; popd > /dev/null 2>&1
  #---------------#
  #Syncthing : Open Source Continuous File Synchronization
  eget "syncthing/syncthing" --asset "linux" --asset "amd64" --asset "gz" --to "$HOME/bin/syncthing"
  #---------------#
  #systemctl-tui : A fast, simple TUI for interacting with systemd services and their logs
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/rgwood/systemctl-tui" && cd "./systemctl-tui"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/systemctl-tui" "$HOME/bin/systemctl-tui"
  #---------------#
  #systeroid : A more powerful alternative to sysctl(8) with a terminal user interface 🐧 
  eget "orhun/systeroid" --asset "linux" --asset "64" --asset "musl" --asset "all" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --file "systeroid" --to "$HOME/bin/systeroid"
  #---------------#
  #t-rec : terminal recorder that generates animated gif images for the web
  eget "sassman/t-rec-rs" --asset "x86_64" --asset "linux" --asset "musl" --asset "gz" --file "t-rec" --to "$HOME/bin/t-rec"
  #---------------#
  #tailscale : The easiest, most secure way to use WireGuard and 2FA
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/tailscale/tailscale_amd_x86_64_Linux" --to "$HOME/bin/tailscale"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/tailscale/tailscale_merged_amd_x86_64_Linux" --to "$HOME/bin/tailscale_merged"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/tailscale/tailscaled_amd_x86_64_Linux" --to "$HOME/bin/tailscaled"
  #---------------#
  #tailspin : 🌀 A log file highlighter 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/bensadeh/tailspin" && cd "./tailspin"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/tspin" "$HOME/bin/tailspin" ; popd > /dev/null 2>&1
  #---------------#
  #taplo: A TOML toolkit written in Rust 
  eget "tamasfe/taplo" --asset "full" --asset "linux" --asset "x86_64" --asset "gz" --to "$HOME/bin/taplo"
  #---------------#
  #tcpdump : data-network packet analyzer
  eget "Azathothas/static-toolbox" --tag "tcpdump" --asset "x86_64" --to "$HOME/bin/tcpdump"
  #---------------#
  #tdl : 📥 A Telegram downloader/tools written in Golang 
  eget "iyear/tdl" --asset "Linux" --asset "64bit" --asset "tar.gz" --to "$HOME/bin/tdl"
  #---------------#
  #tere : Terminal Dir Navigator
  eget "mgunyho/tere" --asset "x86_64-unknown-linux-musl.zip" --to "$HOME/bin/tere"
  #---------------#
  #termshark : A terminal UI for tshark, inspired by Wireshark  
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone "https://github.com/gcla/termshark" && cd "./termshark"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/termshark"
  mv "./termshark" "$HOME/bin/termshark" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #tgpt: Access ChatGPT from the comfort of your terminal. No API or config files are needed.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/aandrew-me/tgpt" && cd "./tgpt"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./tgpt" "$HOME/bin/tgpt" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #tidy-viewer (tv) :📺(tv) Tidy Viewer is a cross-platform CLI csv pretty printer that uses column styling to maximize viewer enjoyment.
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/alexhallam/tv" && cd "./tv"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/tidy-viewer" "$HOME/bin/tidy-viewer" ; popd > /dev/null 2>&1
  #---------------#
  #tldr : Simplified and community-driven man pages 
  eget "https://raw.githubusercontent.com/raylee/tldr-sh-client/main/tldr" --to "$HOME/bin/tldr" && chmod +xwr "$HOME/bin/tldr"
  #---------------#
  #tlrc : A tldr client written in Rust
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/tldr-pages/tlrc" && cd "./tlrc"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/tldr" "$HOME/bin/tlrc" ; popd > /dev/null 2>&1
  #---------------#
  #tlsx : Fast and configurable TLS grabber focused on TLS based data collection
  eget "projectdiscovery/tlsx" --asset "amd64" --asset "linux" --to "$HOME/bin/tlsx"
  #---------------#
  #tmate : Instant Terminal Sharing
  eget "tmate-io/tmate" --asset "linux" --asset "amd" --asset "64" --asset "^symbol" --to "$HOME/bin/tmate"
  #---------------#
  #tmux : terminal multiplexer
  eget "Azathothas/static-toolbox" --tag "tmux" --asset "tmux_amd_x86_64_Linux" --asset "^gz" --asset "^bz2" --to "$HOME/bin/tmux"
  #---------------#
  #tok : word string splitter
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && mkdir tok && cd "./tok"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/tok/main.go" ; curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/tok/go.mod"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./tok" ; mv "./tok" "$HOME/bin/tok" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache 
  #---------------#
  #tokei : displays statistics & number of files for code files/dirs
  eget "XAMPPRocky/tokei" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/tokei"
  #---------------#
  #toybox : minimal busybox
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/toybox/toybox_amd_x86_64_Linux" --to "$HOME/bin/toybox"
  #---------------#
  #traefik : The Cloud Native Application Proxy 
  eget "traefik/traefik" --asset "linux" --asset "amd64" --asset "gz" --to "$HOME/bin/traefik"
  #---------------#
  #trufflehog : Find and verify credentials
  eget "trufflesecurity/trufflehog" --asset "amd64" --asset "linux" --to "$HOME/bin/trufflehog"
  #---------------#
  #try : Inspect a command's effects before modifying your live system 
  eget "https://raw.githubusercontent.com/binpash/try/main/try" --to "$HOME/bin/try" && chmod +xwr "$HOME/bin/try"
  #---------------#
  #tty2web : Share your terminal as a web application in bind/reverse mode 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/kost/tty2web" && cd "./tty2web"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./tty2web" "$HOME/bin/tty2web" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #ttyd : Share your terminal over the web  
  eget "tsl0922/ttyd" --asset "x86_64" --asset "^win" --asset "^i686" --asset "^sha" --asset "^sig" --to "$HOME/bin/ttyd"
  #---------------#
  #tuiarchiver : terminal application to list / manage archives
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://codeberg.org/dnalor/tuiarchiver" && cd "./tuiarchiver"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./tuiarchiver" "$HOME/bin/tuiarchiver" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #tut: TUI for Mastodon with vim inspired keys
  eget "RasmusLindroth/tut" --asset "amd64" --asset "static" --to "$HOME/bin/tut"
  #---------------#
  #twingate : programmatically deploy and maintain a zero trust approach to infrastructures
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_client_amd_x86_64_staticx_Linux" --to "$HOME/bin/twingate-client"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_connector_amd_x86_64_dynamic_Linux" --to "$HOME/bin/twingate-connector"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_connector_amd_x86_64_staticx_Linux" --to "$HOME/bin/twingate-connector-staticx"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_connectorctl_amd_x86_64_staticx_Linux" --to "$HOME/bin/twingate-connectorctl"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_notifier_amd_x86_64_staticx_Linux" --to "$HOME/bin/twingate-notifier"
  #---------------#
  #txeh : CLI utility for /etc/hosts management. 
  eget "txn2/txeh" --asset "Linux" --asset "64" --asset "tar.gz" --asset "^arm" --asset "^sha" --asset "^sig" --asset "^deb" --asset "^rpm" --to "$HOME/bin/txeh"
  #---------------#
  #tz : 🌐 A time zone helper 
  eget "oz/tz" --asset "linux" --asset "amd64" --asset "^sha" --to "$HOME/bin/tz"
  #---------------#
  #u-root : create a one-binary root file system (initramfs) containing a busybox-like set of tools
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/u-root/u-root" && cd "./u-root"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./u-root" "$HOME/bin/u-root" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #udpx : a single-packet UDP port scanner
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/nullt3r/udpx" && cd "./udpx"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/udpx" ; mv "./udpx" "$HOME/bin/udpx" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #uip : A tool to obtain your public IP address with the help of STUN servers 
  eget "dndx/uip" --asset "uip" --asset "linux" --asset "x86_64" --asset "musl" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/uip"
  #---------------#
  #uncover : Quickly discover exposed hosts on the internet using multiple search engines
  eget "projectdiscovery/uncover" --asset "amd64" --asset "linux" --to "$HOME/bin/uncover"
  #---------------#
  #unf: UNixize Filename -- replace annoying anti-unix characters in filenames  
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/io12/unf" && cd "./unf"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/unf" "$HOME/bin/unf" ; popd > /dev/null 2>&1
  #---------------#
  #unfurl : Pull out bits of URLs provided on stdin 
  #eget "tomnomnom/unfurl" --asset "amd64" --asset "linux" --to "$HOME/bin/unfurl"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/tomnomnom/unfurl" && cd "./unfurl"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./unfurl" "$HOME/bin/unfurl" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #upx : Ultimate Packer for eXecutables
  eget "https://github.com/borestad/static-binaries/raw/main/x86_64/upx" --to "$HOME/bin/upx"
  #---------------#
  #usql: Universal command-line interface for SQL databases 
  eget "xo/usql" --asset "linux" --asset "amd64" --asset "tar" --asset "static" --file "usql_static" --to "$HOME/bin/usql"
  #---------------#
  #v2raya : A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan, Tuic and Juicity protocols. 🚀  
  eget "v2rayA/v2rayA" --asset "v2raya_linux_x64" --asset "^installer" --asset "^sha" --to "$HOME/bin/v2raya"
  #---------------#
  #V6-unix: Old Unix programs running on modern computers. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/rsc/unix" && cd "./unix" ; mkdir -p "./bin"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./bin/v6disk" "./v6disk"
  #CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./bin/pdp11" "./pdp11"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./bin/v6run" "./v6run"
  #CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./bin/v6web" "./v6web"
  mv "./bin"/* "$HOME/bin" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #validtoml : simple toml validitor
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/martinlindhe/validtoml" && cd "./validtoml"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  mv "./validtoml" "$HOME/bin/validtoml" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #vegeta : HTTP load testing tool and library
  eget "tsenart/vegeta" --asset "linux" --asset "64" --asset "tar.gz" --asset "^arm" --to "$HOME/bin/vegeta"
  #---------------#
  #vhs: CLI home video recorder 📼 
  eget "charmbracelet/vhs" --asset "Linux" --asset "x86_64" --asset "^sbom" --asset "vhs" --to "$HOME/bin/vhs"
  #---------------#
  #viddy : 👀 A modern watch command. Time machine and pager etc. 
  eget "sachaos/viddy" --asset "Linux" --asset "x86_64" --to "$HOME/bin/viddy"
  #---------------#
  #viewgen : ViewState tool capable of generating both signed and encrypted payloads with leaked validation keys
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/0xacb/viewgen" && cd "./viewgen"
  pip install --upgrade -r requirements.txt ; mv "./viewgen" "./viewgen.py"
  pyinstaller --clean "./viewgen.py" --noconfirm ; pyinstaller --strip --onefile "./viewgen.py" --noconfirm
  staticx --loglevel DEBUG "./dist/viewgen" --strip "$HOME/bin/viewgen_staticx" ; popd > /dev/null 2>&1
  #---------------#
  #viu : Terminal image viewer with native support for iTerm and Kitty 
  eget "atanunq/viu" --asset "viu" --asset "linux" --asset "x86_64" --asset "musl" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/viu"
  #---------------#
  #volta : JS Toolchains as Code. ⚡ 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/volta-cli/volta" && cd "./volta"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/volta" "$HOME/bin/volta" ; popd > /dev/null 2>&1
  #---------------#
  #vopono : Run applications through VPN tunnels with temporary network namespaces
  eget "jamesmcm/vopono" --asset "linux" --asset "x86" --asset "64" --asset "musl" --asset "^deb" --asset "^rpm" --to "$HOME/bin/vopono"
  #---------------#
  #vtm : virtual terminal multiplexer
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && curl -qfLJO $(curl -qfsSL "https://api.github.com/repos/directvt/vtm/releases/latest" | jq -r '.assets[].browser_download_url' | grep -i 'linux_x86_64.zip')
  find . -type f -name '*.zip' -exec unzip {} \;
  find . -type f -name '*.tar' -exec tar -xvf {} \; && rm *.tar *.zip 2>/dev/null
  find . -type f -name 'vtm' -exec mv {} "$HOME/bin/vtm" \; && popd > /dev/null 2>&1
  #---------------#
  #vultr-cli : Official command line tool for Vultr services
  eget "vultr/vultr-cli" --asset "vultr-cli" --asset "linux" --asset "amd64" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/vultr-cli"
  #---------------#
  #wadl-dumper : Dump all available paths and/or endpoints on WADL file
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/dwisiswant0/wadl-dumper" && cd "./wadl-dumper"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./wadl-dumper" "$HOME/bin/wadl-dumper" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #walk: Terminal file manager 
  eget "antonmedv/walk" --asset "linux" --asset "amd64" --asset "gz" --to "$HOME/bin/walk"
  #---------------#
  #wasminspect: An interactive debugger for WebAssembly   
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/kateinoigakukun/wasminspect" && cd "./wasminspect"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/wasminspect" "$HOME/bin/wasminspect" ; popd > /dev/null 2>&1
  #---------------#
  #watchexec : Executes commands in response to file modifications 
  #https://github.com/watchexec/watchexec
  eget "https://github.com/borestad/static-binaries/raw/main/x86_64/watchexec" --to "$HOME/bin/watchexec"
  #---------------#
  #waybackrobots : Enumerate old versions of robots.txt paths using Wayback Machine for content discovery
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/mhmdiaa/waybackrobots" && cd "./waybackrobots"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./waybackrobots" "$HOME/bin/waybackrobots" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #waybackurls : Fetch all the URLs that the Wayback Machine knows about for a domain
  # pre made is static
  #eget "tomnomnom/waybackurls" --asset "amd64" --asset "linux" --to "$HOME/bin/waybackurls"
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/tomnomnom/waybackurls" && cd "./waybackurls"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./waybackurls" "$HOME/bin/waybackurls"
  popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #Web-Cache-Vulnerability-Scanner : CLI tool for testing for web cache poisoning
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Hackmanit/Web-Cache-Vulnerability-Scanner" && cd "./Web-Cache-Vulnerability-Scanner"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./Web-Cache-Vulnerability-Scanner" "$HOME/bin/web-cache-vulnerability-scanner" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #WebSocat : netcat (or curl) for ws:// with advanced socat-like functions
  eget "vi/websocat" --asset "x86_64-unknown-linux-musl" --asset "max" --to "$HOME/bin/websocat"
  #---------------#
  #wego: weather app for the terminal  
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/schachmat/wego" && cd "./wego"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./wego" "$HOME/bin/wego" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #WireGuard-go : Go Implementation of WireGuard
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://git.zx2c4.com/wireguard-go" && cd "./wireguard-go"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" -o "./wireguard-go"
  mv "./wireguard-go" "$HOME/bin/wireguard-go" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #WireGuard-rs : Rust Implementation of WireGuard
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://git.zx2c4.com/wireguard-rs" && cd "./wireguard-rs"
  export TARGET="x86_64-unknown-linux-gnu" ; export RUSTFLAGS="-C target-feature=+crt-static" ; rustup target add "$TARGET" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/wireguard-rs" "$HOME/bin/wireguard-rs"
  #---------------#
  #WireProxy : Wireguard client that exposes itself as a socks5 proxy
  eget "pufferffish/wireproxy" --asset "linux" --asset "^arm" --asset "64" --asset "tar.gz" --to "$HOME/bin/wireproxy"
  #---------------#
  #WireTap: ransparent, VPN-like proxy server that tunnels traffic via WireGuard and requires no special privileges to run
  eget "sandialabs/wiretap" --asset "linux" --asset "amd" --asset "64" --asset "tar.gz" --to "$HOME/bin/wiretap"
  #---------------#
  #wormhole-rs : Rust implementation of Magic Wormhole, with new features and enhancements
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/magic-wormhole/magic-wormhole.rs" && cd "./magic-wormhole.rs"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/wormhole-rs" "$HOME/bin/wormhole-rs" ; popd > /dev/null 2>&1
  #---------------#
  #wstunnel : Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI
  eget "erebe/wstunnel" --asset "wstunnel" --asset "linux" --asset "amd64" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/wstunnel"
  #---------------#
  #wtfutil : The personal information dashboard for your terminal 
  eget "wtfutil/wtf" --asset "linux" --asset "amd64" --file "wtfutil" --to "$HOME/bin/wtfutil"
  #---------------#
  #wth : What The Heck: The better personal information dashboard for your terminal
  eget "mrusme/wth" --asset "wth" --asset "linux" --asset "amd64" --asset "^sig" --asset "^crt" --asset "^sha" --to "$HOME/bin/wth"
  #---------------#
  #x8 : Hidden parameters discovery suite 
  eget "Sh1Yo/x8" --asset "linux" --to "$HOME/bin/x8"
  # attempt to build a static binary produces dynamic anyway  
  # pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" https://github.com/Sh1Yo/x8 && cd x8
  # export TARGET="x86_64-unknown-linux-gnu"
  # rustup target add "$TARGET"
  # export RUSTFLAGS="-C target-feature=+crt-static" 
  # sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  # echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  # cargo build --target "$TARGET" --release
  # file "./target/$TARGET/release/x8" ; ldd "./target/$TARGET/release/x8" ; ls "./target/$TARGET/release/x8" -lah
  # mv "./target/$TARGET/release/x8" "$HOME/bin/x8"
  # popd > /dev/null 2>&1
  #---------------#
  #xcp : An extended `cp` 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/tarka/xcp" && cd "./xcp"
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/xcp" "$HOME/bin/xcp" ; popd > /dev/null 2>&1
  #---------------#
  #xh : Friendly and fast tool for sending HTTP requests 
  eget "ducaale/xh" --asset "linux" --asset "musl" --asset "x86_64" --asset "gz" --to "$HOME/bin/xh"
  #---------------#
  #xplr : A hackable, minimal, fast TUI file explorer 
  eget "sayanarijit/xplr" --asset "linux" --asset "musl" --asset "^arm" --asset "^aarch" --asset "^asc" --asset "^sha" --to "$HOME/bin/xplr"
  #---------------#
  #xurls : Extract urls from text 
  eget "mvdan/xurls" --asset "linux_amd64" --to "$HOME/bin/xurls"
  #---------------#
  #yalis : Yet Another LinkedIn Scraper 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/EatonChips/yalis" && cd "./yalis"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./yalis" "$HOME/bin/yalis" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #yataf : yataf extracts secrets and paths from files or urls - its best used against javascript files 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/Damian89/yataf" && cd "./yataf"
  CGO_ENABLED="0" go build -o "yataf_amd_x86_64_Linux" -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'"
  find . -type f -name '*_Linux' -exec mv {} "$HOME/bin/yataf" \;
  popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #yazi :💥 Blazing fast terminal file manager written in Rust, based on async I/O. 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/sxyazi/yazi" && cd "./yazi"
  export TARGET="x86_64-unknown-linux-musl" ; rustup target add "$TARGET" ; export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cross build --target "$TARGET" --release ; mv "./target/$TARGET/release/yazi" "$HOME/bin/yazi" ; popd > /dev/null 2>&1
  #---------------#
  #yip : 📌 Yaml Instructions Processor - Simply applies a cloud-init style yaml file to the system  
  eget "mudler/yip" --asset "yip" --asset "amd64" --asset "linux" --asset "^deb" --asset "^rpm" --asset "^sha" --asset "^sig" --to "$HOME/bin/yip"
  #---------------#
  #yj: Convert between YAML, TOML, JSON, and HCL
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/sclevine/yj" && cd "./yj"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ;  mv "./yj" "$HOME/bin/yj" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #yq : portable command-line YAML, JSON, XML, CSV, TOML and properties processor
  eget "mikefarah/yq" --asset "yq_linux_amd64" --asset "^.tar.gz" --to "$HOME/bin/yq"
  #---------------#
  #zdns : Fast CLI DNS Lookup Tool 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/zmap/zdns" && cd "./zdns"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" ; mv "./zdns" "$HOME/bin/zdns" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #zellij : A terminal workspace with batteries included
  eget "zellij-org/zellij" --asset "linux" --asset "musl" --asset "x86_64" --asset "^sha256sum" --to "$HOME/bin/zellij"
  #---------------#
  #zenith : sort of like top or htop but with zoom-able charts, CPU, GPU, network, and disk usage
  eget "bvaisvil/zenith" --asset "linux" --asset "musl" --asset "^sha256" --to "$HOME/bin/zenith"
  #---------------#
  #zfxtop : fetch top for gen Z with X written by bubbletea enjoyer  
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/ssleert/zfxtop" && cd "./zfxtop"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/zfxtop"
  mv "./zfxtop" "$HOME/bin/zfxtop" ; popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #zgrab2 : Fast Go Application Scanner 
  pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --filter "blob:none" "https://github.com/zmap/zgrab2" && cd "./zgrab2"
  CGO_ENABLED="0" go build -v -ldflags="-buildid=bin.ajam.dev/x86_64_Linux/ -s -w -extldflags '-static'" "./cmd/zgrab2" ; mv "./zgrab2" "$HOME/bin/zgrab2" ; popd > /dev/null 2>&1
  go clean -cache -fuzzcache -modcache -testcache
  #---------------#
  #zoxide : A smarter cd command.
  eget "ajeetdsouza/zoxide" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/zoxide" && ln -s "$HOME/bin/zoxide" "$HOME/bin/z"
  #---------------#
  #zsh (best to install using conda)
  #eget "romkatv/zsh-bin" --asset "linux-x86_64.tar.gz" --asset "^.asc" --all
  #---------------#
  #zstd : Zstandard - Fast real-time compression algorithm
  eget "VHSgunzo/zstd-static" --asset "x86_64" --asset "^arm" --file "zstd" --to "$HOME/bin/zstd"
#-------------------------------------------------------#  
#EOF
