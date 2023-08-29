#!/usr/bin/env bash

# This should be able to be executed completely in userspace mode only & shouldn't require root access
# Only Dependency is 'curl' or 'wget' 
# Get wget: https://github.com/Azathothas/Static-Binaries/tree/main/wget
# Get Curl: https://github.com/Azathothas/Static-Binaries/tree/main/curl
# Once requirement is satisfied, simply:
# bash <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/scripts/eget_binaries_amd_x86_64.sh")
#-------------------------------------------------------#
#Get ENV:PATH
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
#Download eget
if ! command -v eget &> /dev/null; then
   curl -qfsSL "https://zyedidia.github.io/eget.sh" | bash
   if [ -f "./eget" ]; then
       mv "./eget" "$HOME/bin" && chmod +xwr "$HOME/bin/eget"
   else
      pushd $(mktemp -d)
      curl -qfLJO $(curl -qfsSL "https://api.github.com/repos/zyedidia/eget/releases/latest" | jq -r '.assets[].browser_download_url' | grep -i 'linux.*amd64')
      find . -type f -name '*.tar.gz' -exec tar -xzvf {} \;
      find . -type f -name 'eget*' -exec strip {} \; >/dev/null 2>&1
      find . -type f -name 'eget' -exec mv {} "$HOME/bin/eget" \;
      chmod +xwr "$HOME/bin/eget"
      popd
   fi
else
  cp "$(which eget)" "$HOME/bin/eget"
fi   
#-------------------------------------------------------#
#Sanity Checks
if [[ -n "$GITHUB_TOKEN" ]]; then
   # 5000 req/minute (80 req/minute) 
   echo "GITHUB_TOKEN is Exported"
   eget --rate
else
   # 60 req/hr
   echo "GITHUB_TOKEN is NOT Exported"
   echo -e "Export it to avoid ratelimits"
   eget --rate 
   exit 1
fi
#-------------------------------------------------------# 
#Tools (Binaries Only)
  #7z
  pushd $(mktemp -d) && curl -qfsSLJO "https://www.7-zip.org/$(curl -qfsSL "https://www.7-zip.org/download.html" | grep -o 'href="[^"]*"' | sed 's/href="//' | grep 'linux-x64.tar.xz' | sed 's/"$//' | sort | tail -n 1)"
  find . -type f -name '*.xz' -exec tar -xf {} \;
  find . -type f -name '7zzs' ! -name '*.xz' -exec cp {} "$HOME/bin/7z" \;
  popd
  go clean -cache -fuzzcache -modcache -testcache
  #airiXSS
  #eget "ferreiraklet/airixss" --to "$HOME/bin/airixss"
  pushd $(mktemp -d) && git clone "https://github.com/ferreiraklet/airixss" && cd airixss
  go mod init "github.com/ferreiraklet/airixss" ; go mod tidy
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./airixss" "$HOME/bin/airixss" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #aix
  eget "projectdiscovery/aix" --asset "amd64" --asset "linux" --to "$HOME/bin/aix"
  #alterx
  eget "projectdiscovery/alterx" --asset "amd64" --asset "linux" --to "$HOME/bin/alterx"
  #amass
  #eget "owasp-amass/amass" --asset "amd64" --asset "zip" --to "$HOME/bin/amass" && mkdir -p "$HOME/.config/amass"
  pushd $(mktemp -d) && git clone "https://github.com/owasp-amass/amass" && cd amass
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/amass" ; mv "./amass" "$HOME/bin/amass" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #analyticsrelationships
  pushd $(mktemp -d) && git clone "https://github.com/Josue87/AnalyticsRelationships" && cd AnalyticsRelationships
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./analyticsrelationships" "$HOME/bin/analyticsrelationships" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #anew
  eget "tomnomnom/anew" --asset "amd64" --asset "linux" --to "$HOME/bin/anew"
  #aria2c
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/aria2/aria2c_amd_x86_64_libressl_musl_latest_Linux" --to "$HOME/bin/aria2c"
  #assetfinder
  pushd $(mktemp -d) && git clone "https://github.com/tomnomnom/assetfinder" && cd assetfinder
  go mod init github.com/tomnomnom/assetfinder ; go mod tidy
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./assetfinder" "$HOME/bin/assetfinder" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #asn
  eget "https://raw.githubusercontent.com/nitefood/asn/master/asn" --to "$HOME/bin/asn" 
  #asnmap
  #eget "projectdiscovery/asnmap" --asset "amd64" --asset "linux" --to "$HOME/bin/asnmap"
  pushd $(mktemp -d) && git clone "https://github.com/projectdiscovery/asnmap" && cd asnmap
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/asnmap" ; mv "./asnmap" "$HOME/bin/asnmap" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #atuin: https://github.com/ellie/atuin
  eget "atuinsh/atuin" --asset "unknown-linux-musl" --to "$HOME/bin/atuin"
  #batcat
  eget "sharkdp/bat" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/bat" && ln -s "$HOME/bin/bat" "$HOME/bin/batcat"
  #bore
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/bore/bore_amd_x86_64_musl_Linux" --to "$HOME/bin/bore"
  #btop
  pushd $(mktemp -d) && curl -qfsSL $(curl -s "https://api.github.com/repos/aristocratos/btop/actions/artifacts" | jq -r '[.artifacts[] | select(.name == "btop-x86_64-linux-musl")] | sort_by(.created_at) | .[].archive_download_url') -H "Authorization: Bearer $GITHUB_TOKEN" -o "btop.zip" && unzip "./btop.zip" && find . -type f -name '*btop*' ! -name '*.zip*' -exec mv {} "$HOME/bin/btop" \; && popd
  go clean -cache -fuzzcache -modcache -testcache
  #busybox
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/busybox/busybox_amd_x86_64_musl_Linux" --to "$HOME/bin/busybox"
  #byp4xx
  pushd $(mktemp -d) && git clone "https://github.com/lobuhi/byp4xx" && cd byp4xx
  go mod init github.com/lobuhi/byp4xx ; go mod tidy
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./byp4xx" "$HOME/bin/byp4xx" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #cdncheck
  eget "projectdiscovery/cdncheck" --asset "amd64" --asset "linux" --to "$HOME/bin/cdncheck"
  #cent
  eget "xm1k3/cent" --asset "amd64" --asset "linux" --to "$HOME/bin/cent"
  #Chameleon 
  eget "iustin24/chameleon" --asset "linux" --to "$HOME/bin/chameleon" 
  #chaos
  eget "projectdiscovery/chaos-client" --asset "amd64" --asset "linux" --to "$HOME/bin/chaos-client"
  #Cloudfox
  #eget "BishopFox/cloudfox" --asset "amd64" --asset "linux" --to "$HOME/bin/cloudfox"
  pushd $(mktemp -d) && git clone "https://github.com/BishopFox/cloudfox" && cd cloudfox
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./cloudfox" "$HOME/bin/cloudfox" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #cloudlist
  eget "projectdiscovery/cloudlist" --asset "amd64" --asset "linux" --to "$HOME/bin/cloudlist"
  #crlfuzz
  pushd $(mktemp -d) && git clone "https://github.com/dwisiswant0/crlfuzz" && cd crlfuzz
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/crlfuzz" ; mv "./crlfuzz" "$HOME/bin/crlfuzz" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #croc
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/croc/croc_amd_x86_64_Linux" --to "$HOME/bin/croc"
  #crt
  #eget "cemulus/crt" --asset "x86_64" --to "$HOME/bin/crt"
  pushd $(mktemp -d) && git clone "https://github.com/cemulus/crt" && cd crt
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./crt" "$HOME/bin/crt" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #csprecon
  pushd $(mktemp -d) && git clone "https://github.com/edoardottt/csprecon" && cd csprecon
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/csprecon" ; mv "./csprecon" "$HOME/bin/csprecon" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #curl
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/curl/curl_amd_x86_64_Linux" --to "$HOME/bin/curl"
  #curlie
  eget "rs/curlie" --asset "linux_amd64.tar.gz" --to "$HOME/bin/curlie"
  #cut-cdn
  pushd $(mktemp -d) && git clone "https://github.com/ImAyrix/cut-cdn" && cd cut-cdn
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./cut-cdn" "$HOME/bin/cut-cdn" ; popd
  go clean -cache -fuzzcache -modcache -testcache 
  #dalfox
  eget "hahwul/dalfox" --asset "amd64" --to "$HOME/bin/dalfox"
  #dnstake
  pushd $(mktemp -d) && git clone "https://github.com/pwnesia/dnstake" && cd dnstake
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/dnstake" ; mv "./dnstake" "$HOME/bin/dnstake" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #dnsx
  eget "projectdiscovery/dnsx" --asset "amd64" --asset "linux" --to "$HOME/bin/dnsx"
  #dirstat-rs
  pushd $(mktemp -d) && git clone https://github.com/scullionw/dirstat-rs && cd dirstat-rs
  export TARGET="x86_64-unknown-linux-gnu"
  rustup target add "$TARGET"
  export RUSTFLAGS="-C target-feature=+crt-static" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release
  mv "./target/$TARGET/release/ds" "$HOMR/bin/ds"
  popd  
  #dsieve
  eget "trickest/dsieve" --asset "amd64" --to "$HOME/bin/dsieve"
  #duf
  eget "muesli/duf" --asset "linux_x86_64.tar.gz" --to "$HOME/bin/duf"
  #dust
  eget "bootandy/dust" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/dust"
  #dysk
  pushd $(mktemp -d) && curl -qfLJO $(curl -qfsSL "https://api.github.com/repos/Canop/dysk/releases/latest" | jq -r '.assets[].browser_download_url' | grep -i 'dysk' | grep -i 'zip')
  find . -type f -name '*.zip*' -exec unzip -o {} \;
  find . -type f -name '*.md' -exec rm {} \;
  #mv "$(find . -type d -name '*x86_64*' -name '*linux*' ! -name '*musl*')/dysk" "$HOME/bin/dysk_gcc"   
  mv "$(find . -type d -name '*x86_64*' -name '*linux*' -name '*musl*')/dysk" "$HOME/bin/dysk"
  popd
  #enumerepo
  eget "trickest/enumerepo" --asset "amd64" --to "$HOME/bin/enumerepo"
  #exa
  eget "ogham/exa" --asset "linux" --asset "musl" --asset "x86_64" --to "$HOME/bin/exa"
  #fd
  eget "sharkdp/fd" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/fd" && ln -s "$HOME/bin/fd" "$HOME/bin/fd-find"
  #feroxbuster
  eget "epi052/feroxbuster" --asset "linux" --asset "zip" --to "$HOME/bin/feroxbuster"
  #Findomain
  eget "Findomain/Findomain" --asset "findomain-linux.zip" --asset "^386" --to "$HOME/bin/findomain"
  #fingerprintx
  eget "praetorian-inc/fingerprintx" --asset "amd64" --asset "linux" --to "$HOME/bin/fingerprintx"
  #ffuf
  eget "ffuf/ffuf" --asset "amd64" --asset "linux" --to "$HOME/bin/ffuf"
  #fzf
  eget "junegunn/fzf" --asset "linux_amd64.tar.gz" --to "$HOME/bin/fzf"
  #gau
  #eget "lc/gau" --asset "amd64" --asset "linux" --to "$HOME/bin/gau"
  pushd $(mktemp -d) && git clone "https://github.com/lc/gau" && cd gau
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/gau" ; mv "./gau" "$HOME/bin/gau" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #gdu
  eget "dundee/gdu" --asset "gdu_linux_amd64_static.tgz" --to "$HOME/bin/gdu"
  #gf
  pushd $(mktemp -d) && git clone "https://github.com/tomnomnom/gf" && cd gf
  go mod init github.com/tomnomnom/gf ; go mod tidy
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./gf" "$HOME/bin/gf" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #gfx --> symlinked to gf
  #eget "dwisiswant0/gfx" --asset "amd64" --asset "linux" --to "$HOME/bin/gfx" && ln -s "$HOME/bin/gfx" "$HOME/bin/gf"
  pushd $(mktemp -d) && git clone "https://github.com/dwisiswant0/gfx" && cd gfx
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./gfx" "$HOME/bin/gfx" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #gh
  eget "cli/cli" --asset "linux_amd64.tar.gz" --to "$HOME/bin/gh"
  #git
  # requires additional binaries
  #eget "Azathothas/static-toolbox" --tag "git" --asset "git_amd_x86_64_Linux" --to "$HOME/bin/git"
  #gitdorks_go
  pushd $(mktemp -d) && git clone "https://github.com/damit5/gitdorks_go" && cd gitdorks_go
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./gitdorks_go" "$HOME/bin/gitdorks_go" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #github-endpoints
  pushd $(mktemp -d) && git clone "https://github.com/gwen001/github-endpoints" && cd github-endpoints
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./github-endpoints" "$HOME/bin/github-endpoints" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #github-regexp
  pushd $(mktemp -d) && git clone "https://github.com/gwen001/github-regexp" && cd github-regexp
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./github-regexp" "$HOME/bin/github-regexp" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #github-subdomains
  pushd $(mktemp -d) && git clone "https://github.com/gwen001/github-subdomains" && cd github-subdomains
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./github-subdomains" "$HOME/bin/github-subdomains" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #gitlab-subdomains
  pushd $(mktemp -d) && git clone "https://github.com/gwen001/gitlab-subdomains" && cd gitlab-subdomains
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./gitlab-subdomains" "$HOME/bin/gitlab-subdomains" ; popd ; go clean -cache -fuzzcache -modcache -testcache  
  #gitleaks
  eget "gitleaks/gitleaks" --asset "linux_x64.tar.gz" --to "$HOME/bin/gitleaks"
  #gitui
  eget "extrawurst/gitui" --asset "gitui-linux-musl.tar.gz" --to "$HOME/bin/gitui"
  #gobuster
  eget "OJ/gobuster" --asset "Linux_x86_64.tar.gz" --to "$HOME/bin/gobuster"
  #gofastld
  pushd $(mktemp -d) && git clone "https://github.com/elliotwutingfeng/go-fasttld" && cd go-fasttld
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" -o "./fasttld" "./cmd/main.go" ; mv "./fasttld" "$HOME/bin/fasttld" ; popd
  #gofireprox
  eget "mr-pmillz/gofireprox" --asset "amd64" --asset "linux" --to "$HOME/bin/gofireprox"
  #gost
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/gost/gost_amd_x86_64_Linux" --to "$HOME/bin/gost"
  #gotator
  pushd $(mktemp -d) && git clone "https://github.com/Josue87/gotator" && cd gotator
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./gotator" "$HOME/bin/gotator" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #gowitness
  #eget "sensepost/gowitness" --asset "amd64" --asset "linux" --to "$HOME/bin/gowitness"
  pushd $(mktemp -d) && git clone "https://github.com/sensepost/gowitness" && cd gowitness
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./gowitness" "$HOME/bin/gowitness" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #gping: https://github.com/orf/gping
  eget "orf/gping" --asset "unknown-linux-musl" --asset "linux" --to "$HOME/bin/gping"
  #Gxss
  pushd $(mktemp -d) && git clone "https://github.com/KathanP19/Gxss" && cd Gxss
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./Gxss" "$HOME/bin/Gxss" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #hacker-scoper
  pushd $(mktemp -d) && git clone "https://github.com/ItsIgnacioPortal/hacker-scoper" && cd hacker-scoper
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./hacker-scoper" "$HOME/bin/hacker-scoper" ; popd
  #hakip2host
  pushd $(mktemp -d) && git clone "https://github.com/hakluke/hakip2host" && cd hakip2host
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./hakip2host" "$HOME/bin/hakip2host" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #hakoriginfinder  
  pushd$(mktemp -d) && git clone https://github.com/hakluke/hakoriginfinder && cd hakoriginfinder 
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./hakoriginfinder" "$HOME/bin/hakoriginfinder" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #hakrawler
  pushd $(mktemp -d) && git clone https://github.com/hakluke/hakrawler && cd hakrawler
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./hakrawler" "$HOME/bin/hakrawler" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #hakrevdns
  pushd $(mktemp -d) && git clone https://github.com/hakluke/hakrevdns && cd hakrevdns
  go mod init github.com/hakluke/hakrevdns ; go mod tidy
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./hakrevdns" "$HOME/bin/hakrevdns" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #hrekt: https://github.com/ethicalhackingplayground/hrekt
  #eget "ethicalhackingplayground/hrekt" --asset "^exe" --to "$HOME/bin/hrekt"
  pushd $(mktemp -d) && git clone https://github.com/ethicalhackingplayground/hrekt && cd hrekt
  export TARGET="x86_64-unknown-linux-gnu"
  rustup target add "$TARGET"
  export RUSTFLAGS="-C target-feature=+crt-static" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release
  mv "./target/$TARGET/release/hrekt" "$HOMR/bin/hrekt"
  popd
  #hxn
  eget "pwnwriter/haylxon" --to "$HOME/bin/hxn" && ln -s "$HOME/bin/hxn" "$HOME/bin/haylxon"
  # attempt to build a static binary produces dynamic anyway
  # pushd $(mktemp -d) && git clone https://github.com/pwnwriter/haylxon && cd haylxon
  # export TARGET="x86_64-unknown-linux-gnu"
  # rustup target add "$TARGET"
  # export RUSTFLAGS="-C target-feature=+crt-static" 
  # sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  # echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  # cargo build --target "$TARGET" --release
  # file "./target/$TARGET/release/hxn" ; ldd "./target/$TARGET/release/hxn" ; ls "./target/$TARGET/release/hxn" -lah
  # mv "./target/$TARGET/release/hxn" "$HOMR/bin/hxn"
  # popd
  #htmlq
  #eget "mgdm/htmlq" --asset "x86_64-linux.tar.gz" --to "$HOME/bin/htmlq"
  pushd $(mktemp -d) && git clone https://github.com/mgdm/htmlq && cd htmlq
  export TARGET="x86_64-unknown-linux-gnu"
  rustup target add "$TARGET"
  export RUSTFLAGS="-C target-feature=+crt-static" 
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release
  file "./target/$TARGET/release/htmlq" ; ldd "./target/$TARGET/release/htmlq" ; ls "./target/$TARGET/release/htmlq" -lah
  mv "./target/$TARGET/release/htmlq" "$HOMR/bin/htmlq" ; popd
  #httprobe
  pushd $(mktemp -d) && git clone "https://github.com/tomnomnom/httprobe" && cd httprobe
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./httprobe" "$HOME/bin/httprobe" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #httpx
  eget "projectdiscovery/httpx" --asset "amd64" --asset "linux" --to "$HOME/bin/httpx"
  #inscope
  pushd $(mktemp -d) && mkdir inscope && cd inscope
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/inscope/main.go"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/inscope/go.mod"
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" -o "./inscope" ; mv "./inscope" "$HOME/bin/inscope" ; popd ; go clean -cache -fuzzcache -modcache -testcache  
  #interactsh-client
  eget "projectdiscovery/interactsh" --asset "amd64" --asset "linux" --asset "interactsh-client" --to "$HOME/bin/interactsh-client"
  #jaeles
  #eget "jaeles-project/jaeles" --asset "linux" --to "$HOME/bin/jaeles"
  pushd $(mktemp -d) && git clone "https://github.com/jaeles-project/jaeles" && cd jaeles
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./jaeles" "$HOME/bin/jaeles" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #jc
  eget "kellyjonbrazil/jc" --asset "linux-x86_64.tar.gz" --to "$HOME/bin/jc"
  staticx --loglevel DEBUG "$HOME/bin/jc" --strip "$HOME/bin/jc_staticx"
  #jless 
  pushd $(mktemp -d) && git clone https://github.com/PaulJuliusMartinez/jless && cd jless
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET"
  # Currenttly can't build static, flags get overidden, instead use staticX
  #export RUSTFLAGS="-C target-feature=+crt-static"  
  #echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  unset RUSTFLAGS ; cargo build --target "$TARGET" --release
  mv "./target/$TARGET/release/jless" "$HOME/bin/jless_dynamic"
  staticx --loglevel DEBUG "$HOME/bin/jless_dynamic" --strip "$HOME/bin/jless_staticx"
  popd
  #jq
  # this needs to be updated
  eget "jqlang/jq"  --pre-release --tag "jq-1.7rc1" --asset "jq-linux-amd64" --to "$HOME/bin/jq"
  #katana
  eget "projectdiscovery/katana" --asset "amd64" --asset "linux" --to "$HOME/bin/katana"
  staticx --loglevel DEBUG "$HOME/bin/katana" --strip "$HOME/bin/katana_staticx"
  #pushd $(mktemp -d) && git clone "https://github.com/projectdiscovery/katana" && cd katana
  #CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" -o "./katana" "./cmd/katana" ; mv "./katana" "$HOME/bin/katana" ; popd
  #ksubdomain
  eget "boy-hack/ksubdomain" --asset "linux.tar" --to "$HOME/bin/ksubdomain"
  staticx --loglevel DEBUG "$HOME/bin/ksubdomain" --strip "$HOME/bin/ksubdomain_staticx"
  #lit-bb-hack-tools
  pushd $(mktemp -d) && git clone https://github.com/edoardottt/lit-bb-hack-tools && cd lit-bb-hack-tools
  find . -type f -name '*.md' -exec rm {} \;
  find . -maxdepth 1 -type d ! -name '.git*' -exec sh -c 'CGO_ENABLED=0 go build -o "$1/$1_amd_x86_64_Linux" -v -a -gcflags=all="-l -B -wb=false" -ldflags="-s -w -extldflags '\''-static'\''" "$1/"*' _ {} \;
  find . -type f -name '*_Linux' -exec mv {} "$HOME/bin/" \;
  popd ; go clean -cache -fuzzcache -modcache -testcache
  #logtimer
  eget "Eun/logtimer" --asset "linux" --asset "x86_64.tar.gz" --to "$HOME/bin/logtimer"
  #mantra
  pushd $(mktemp -d) && git clone "https://github.com/MrEmpy/mantra" && cd mantra
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./Mantra" "$HOME/bin/mantra" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #mapcidr
  #eget "projectdiscovery/mapcidr" --asset "amd64" --asset "linux" --to "$HOME/bin/mapcidr"
  pushd $(mktemp -d) && git clone "https://github.com/projectdiscovery/mapcidr" && cd mapcidr
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/mapcidr" ; mv "./mapcidr" "$HOME/bin/mapcidr" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #massdns
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/massdns/massdns_linux_x86_64_gcc" --to "$HOME/bin/massdns"
  #masscan
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/masscan/masscan_linux_x86_64_gcc" --to "$HOME/bin/masscan"
  #mgwls
  eget "trickest/mgwls" --asset "amd64" --asset "linux" --to "$HOME/bin/mgwls"  
  #micro : https://github.com/zyedidia/micro/blob/master/runtime/help/keybindings.md
  eget "zyedidia/micro" --asset "linux64-static.tar.gz" --to "$HOME/bin/micro"
  #miniserve
  eget "svenstaro/miniserve" --asset "x86_64-unknown-linux-musl" --to "$HOME/bin/miniserve"
  #mksub
  eget "trickest/mksub" --asset "amd64" --asset "linux" --to "$HOME/bin/mksub"
  #mubeng
  #eget "kitabisa/mubeng" --asset "amd64" --asset "linux" --to "$HOME/bin/mubeng"
  pushd $(mktemp -d) && git clone "https://github.com/kitabisa/mubeng" && cd mubeng
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/mubeng" ; mv "./mubeng" "$HOME/bin/mubeng" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #naabu
  eget "projectdiscovery/naabu" --asset "amd64" --asset "linux" --to "$HOME/bin/naabu"
  staticx --loglevel DEBUG "$HOME/bin/naabu" --strip "$HOME/bin/naabu_staticx"
  #ncdu
  eget "https://dev.yorhel.nl$(curl -qfsSL https://dev.yorhel.nl/ncdu | awk -F '"' '/x86_64\.tar\.gz/ && /href=/{print $2}' | grep -v 'asc' | sort -u)" --to "$HOME/bin/ncdu"
  #ngrok
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/ngrok/ngrok_amd_x86_64_Linux" --to "$HOME/bin/ngrok"
  #nmap
  eget "Azathothas/static-toolbox" --tag "nmap" --asset "x86_64-portable.tar.gz" --all && mv "./ncat" "./nmap" "./nping" "$HOME/bin"
  #nmap-formatter
  #eget "vdjagilev/nmap-formatter" --asset "amd64" --asset "linux" --to "$HOME/bin/nmap-formatter"
  pushd $(mktemp -d) && git clone "https://github.com/vdjagilev/nmap-formatter" && cd nmap-formatter
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./nmap-formatter" "$HOME/bin/nmap-formatter" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #nnn
  eget "jarun/nnn" --asset "musl-static" --asset "x86_64" --to "$HOME/bin/nnn"
  #notify
  eget "projectdiscovery/notify" --asset "amd64" --asset "linux" --to "$HOME/bin/notify"
  #nrich
  eget "https://gitlab.com/api/v4/projects/33695681/packages/generic/nrich/0.4.1/nrich-linux-amd64" --to "$HOME/bin/nrich"
  #nuclei
  eget "projectdiscovery/nuclei" --asset "amd64" --asset "linux" --to "$HOME/bin/nuclei"
  #oha: https://github.com/hatoo/oha
  eget "hatoo/oha" --asset "amd64" --asset "linux" --to "$HOME/bin/oha"
  #openrisk
  #eget "projectdiscovery/openrisk" --asset "amd64" --asset "linux" --to "$HOME/bin/openrisk"
  pushd $(mktemp -d) && git clone "https://github.com/projectdiscovery/openrisk" && cd openrisk
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/openrisk" ; mv "./openrisk" "$HOME/bin/openrisk" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #osmedeus
  #eget "j3ssie/osmedeus" --asset "linux.zip" --to "$HOME/bin/osmedeus"
  pushd $(mktemp -d) && git clone "https://github.com/j3ssie/osmedeus" && cd osmedeus
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./osmedeus" "$HOME/bin/osmedeus" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #pathbuster
  eget "ethicalhackingplayground/pathbuster" --asset "^exe" --to "$HOME/bin/pathbuster"
  # attempt to build a static binary produces dynamic anyway
  # pushd $(mktemp -d) && git clone https://github.com/ethicalhackingplayground/pathbuster && cd pathbuster
  # export TARGET="x86_64-unknown-linux-gnu"
  # rustup target add "$TARGET"
  # export RUSTFLAGS="-C target-feature=+crt-static" 
  # sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  # echo -e '\n\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  # cargo build --target "$TARGET" --release
  # file "./target/$TARGET/release/pathbuster" ; ldd "./target/$TARGET/release/pathbuster" ; ls "./target/$TARGET/release/pathbuster" -lah
  # mv "./target/$TARGET/release/pathbuster" "$HOMR/bin/pathbuster"
  # popd  
  #ppfuzz
  pushd $(mktemp -d) && git clone https://github.com/dwisiswant0/ppfuzz && cd ppfuzz
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ;export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/ppfuzz" "$HOME/bin/ppfuzz" ; popd  
  #pping
  eget "wzv5/pping" --asset "Linux_x86_64.tar.gz" --to "$HOME/bin/pping"
  #procs
  eget "dalance/procs" --asset "x86_64-linux.zip" --to "$HOME/bin/procs"
  #proxify
  #eget "projectdiscovery/proxify" --asset "amd64" --asset "linux" --to "$HOME/bin/proxify"
  pushd $(mktemp -d) && git clone "https://github.com/projectdiscovery/proxify" && cd proxify
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/proxify" ; mv "./proxify" "$HOME/bin/proxify" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #puredns
  eget "d3mondev/puredns" --asset "amd64" --to "$HOME/bin/puredns"
  #qsreplace
  pushd $(mktemp -d) && git clone "https://github.com/tomnomnom/qsreplace" && cd qsreplace
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./qsreplace" "$HOME/bin/qsreplace" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #recollapse
  pushd $(mktemp -d) && git clone https://github.com/0xacb/recollapse && cd recollapse
  pip install --upgrade -r requirements.txt ; mv "./recollapse" "./recollapse.py"
  pyinstaller --clean "./recollapse.py" --noconfirm
  pyinstaller --strip --onefile "./recollapse.py" --noconfirm
  staticx --loglevel DEBUG "./dist/recollapse" --strip "$HOME/bin/recollapse_staticx"
  popd
  #rescope
  # Installton will require placing a /tmp/rescope/configs/avoid.txt
  # mkdir -p "/tmp/rescope/configs" ; curl -qfsSL "https://raw.githubusercontent.com/root4loot/rescope/master/configs/avoid.txt" -o "/tmp/rescope/configs/avoid.txt"
  cd /tmp && git clone https://github.com/root4loot/rescope && cd rescope
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./rescope" "$HOMR/bin/rescope" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #resDNS
  eget "https://raw.githubusercontent.com/Azathothas/Arsenal/main/resdns/resdns.sh" --to "$HOME/bin/resdns"  
  #ripgen
  pushd $(mktemp -d) && git clone https://github.com/resyncgg/ripgen && cd ripgen
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ;export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/ripgen" "$HOME/bin/ripgen" ; popd
  #ripgrep
  eget "BurntSushi/ripgrep" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/ripgrep" && ln -s "$HOME/bin/ripgrep" "$HOME/bin/rg"
  #roboxtractor
  pushd $(mktemp -d) && git clone "https://github.com/Josue87/roboxtractor" && cd roboxtractor
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./roboxtractor" "$HOME/bin/roboxtractor" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #rush
  eget "shenwei356/rush" --asset "rush_linux_amd64.tar.gz" --to "$HOME/bin/rush"
  #Rustscan --> build this, releases are outdated
  pushd $(mktemp -d) && git clone https://github.com/RustScan/RustScan && cd RustScan
  export TARGET="x86_64-unknown-linux-gnu" ; rustup target add "$TARGET" ;export RUSTFLAGS="-C target-feature=+crt-static"
  sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml" ; echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  cargo build --target "$TARGET" --release ; mv "./target/$TARGET/release/rustscan" "$HOME/bin/rustcan" ; popd
  #s3scanner
  eget "sa7mon/S3Scanner" --asset "Linux_x86_64.tar.gz" --to "$HOME/bin/s3scanner"
  #scilla
  pushd $(mktemp -d) && git clone "https://github.com/edoardottt/scilla" && cd scilla
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/scilla" ; mv "./scilla" "$HOME/bin/scilla" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #scopegen
  pushd $(mktemp -d) && mkdir scopegen && cd scopegen
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/scopegen/scopegen.go"
  curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Arsenal/main/scopegen/go.mod"
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" -o "scopegen" "./scopegen.go" ; mv "./scopegen" "$HOME/bin/scopegen" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #scopeview
  eget "https://raw.githubusercontent.com/Azathothas/Arsenal/main/scopeview/scopeview.sh" --to "$HOME/bin/scopeview"  
  #sftp
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/openssh/sftp_server_amd_x86_64_Linux" --to "$HOME/bin/sftp"
  #shfmt
  eget "mvdan/sh" --asset "linux_amd64" --to "$HOME/bin/shfmt"
  #shuffledns
  eget "projectdiscovery/shuffledns" --asset "amd64" --asset "linux" --to "$HOME/bin/shuffledns"
  #smap
  pushd $(mktemp -d) && git clone "https://github.com/s0md3v/Smap" && cd Smap
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/smap" ; mv "./smap" "$HOME/bin/smap" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #socat
  eget "Azathothas/static-toolbox" --tag "socat" --asset "x86_64" --to "$HOME/bin/socat"
  #speedtest-go
  eget "showwin/speedtest-go" --asset "Linux_x86_64.tar.gz" --to "$HOME/bin/speedtest-go"
  #spk
  pushd $(mktemp -d) && git clone https://github.com/dhn/spk && cd spk
  CGO_ENABLED=0 go build -o "spk_amd_x86_64_Linux" -v -ldflags="-s -w -extldflags '-static'"
  find . -type f -name '*_Linux' -exec mv {} "$HOME/bin/spk" \;
  go clean -cache -fuzzcache -modcache -testcache
  popd
  #sshd
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/openssh/sshd_amd_x86_64_Linux" --to "$HOME/bin/sshd"  
  #ssh-keys
  eget "Eun/sshkeys" --asset "linux_amd64.tar.gz" --to "$HOME/bin/sshkeys"  
  #starship
  eget "starship/starship" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/starship"  
  #strace
  eget "Azathothas/static-toolbox" --tag "strace" --asset "x86_64" --to "$HOME/bin/strace"
  #subfinder
  eget "projectdiscovery/subfinder" --asset "amd64" --asset "linux" --to "$HOME/bin/subfinder"
  #subjs
  pushd $(mktemp -d) && git clone "https://github.com/lc/subjs" && cd subjs
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./subjs" "$HOME/bin/subjs" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #subxtract
  eget "https://raw.githubusercontent.com/Azathothas/Arsenal/main/subxtract/subxtract.sh" --to "$HOME/bin/subxtract"
  #tailscale
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/tailscale/tailscale_amd_x86_64_Linux" --to "$HOME/bin/tailscale"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/tailscale/tailscale_merged_amd_x86_64_Linux" --to "$HOME/bin/tailscale_merged"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/tailscale/tailscaled_amd_x86_64_Linux" --to "$HOME/bin/tailscaled"
  #tcpdump
  eget "Azathothas/static-toolbox" --tag "tcpdump" --asset "x86_64" --to "$HOME/bin/tcpdump"
  #tere (Terminal Dir Navigator)
  eget "mgunyho/tere" --asset "x86_64-unknown-linux-musl.zip" --to "$HOME/bin/tere" 
  #tlsx
  eget "projectdiscovery/tlsx" --asset "amd64" --asset "linux" --to "$HOME/bin/tlsx"
  #tmux
  eget "Azathothas/static-toolbox" --tag "tmux" --asset "tmux_amd_x86_64_Linux" --asset "^gz" --asset "^bz2" --to "$HOME/bin/tmux"
  #tokei
  eget "XAMPPRocky/tokei" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/tokei"
  #toybox
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/toybox/toybox_amd_x86_64_Linux" --to "$HOME/bin/toybox"  
  #trufflehog
  eget "trufflesecurity/trufflehog" --asset "amd64" --asset "linux" --to "$HOME/bin/trufflehog"
  #twingate
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_client_amd_x86_64_staticx_Linux" --to "$HOME/bin/twingate-client"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_connector_amd_x86_64_dynamic_Linux" --to "$HOME/bin/twingate-connector"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_connector_amd_x86_64_staticx_Linux" --to "$HOME/bin/twingate-connector-staticx"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_connectorctl_amd_x86_64_staticx_Linux" --to "$HOME/bin/twingate-connectorctl"
  eget "https://github.com/Azathothas/Static-Binaries/raw/main/twingate/twingate_notifier_amd_x86_64_staticx_Linux" --to "$HOME/bin/twingate-notifier"
  #udpx
  pushd $(mktemp -d) && git clone "https://github.com/nullt3r/udpx" && cd udpx
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/udpx" ; mv "./udpx" "$HOME/bin/udpx" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #uncover
  eget "projectdiscovery/uncover" --asset "amd64" --asset "linux" --to "$HOME/bin/uncover"
  #unfurl
  #eget "tomnomnom/unfurl" --asset "amd64" --asset "linux" --to "$HOME/bin/unfurl"
  pushd $(mktemp -d) && git clone "https://github.com/tomnomnom/unfurl" && cd unfurl
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./unfurl" "$HOME/bin/unfurl" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #upx
  eget "https://github.com/borestad/static-binaries/raw/main/x86_64/upx" --to "$HOME/bin/upx"
  #viewgen
  pushd $(mktemp -d) && git clone https://github.com/0xacb/viewgen && cd viewgen
  pip install --upgrade -r requirements.txt ; mv "./viewgen" "./viewgen.py"
  pyinstaller --clean "./viewgen.py" --noconfirm
  pyinstaller --strip --onefile "./viewgen.py" --noconfirm
  staticx --loglevel DEBUG "./dist/viewgen" --strip "$HOME/bin/viewgen_staticx"
  popd
  #wappalyzergo (Just a library not cli)
  #eget "projectdiscovery/wappalyzergo" --asset "amd64" --asset "linux" --to "$HOME/bin/wappalyzergo"
  #watchexec
  eget "https://github.com/borestad/static-binaries/raw/main/x86_64/watchexec" --to "$HOME/bin/watchexec"
  #waybackurls
  # pre made is static
  #eget "tomnomnom/waybackurls" --asset "amd64" --asset "linux" --to "$HOME/bin/waybackurls"
  pushd $(mktemp -d) && git clone "https://github.com/tomnomnom/waybackurls" && cd waybackurls
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./waybackurls" "$HOME/bin/waybackurls"
  popd ; go clean -cache -fuzzcache -modcache -testcache
  #Web-Cache-Vulnerability-Scanner
  pushd $(mktemp -d) && git clone "https://github.com/Hackmanit/Web-Cache-Vulnerability-Scanner" && cd Web-Cache-Vulnerability-Scanner
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./Web-Cache-Vulnerability-Scanner" "$HOME/bin/Web-Cache-Vulnerability-Scanner" ; popd ; go clean -cache -fuzzcache -modcache -testcache
  #x8
  eget "Sh1Yo/x8" --asset "linux" --to "$HOME/bin/x8"
  # attempt to build a static binary produces dynamic anyway  
  # pushd $(mktemp -d) && git clone https://github.com/Sh1Yo/x8 && cd x8
  # export TARGET="x86_64-unknown-linux-gnu"
  # rustup target add "$TARGET"
  # export RUSTFLAGS="-C target-feature=+crt-static" 
  # sed '/^\[profile\.release\]/,/^$/d' -i "./Cargo.toml"  
  # echo -e '\n[profile.release]\nstrip = true\nopt-level = "z"\nlto = true' >> "./Cargo.toml"
  # cargo build --target "$TARGET" --release
  # file "./target/$TARGET/release/x8" ; ldd "./target/$TARGET/release/x8" ; ls "./target/$TARGET/release/x8" -lah
  # mv "./target/$TARGET/release/x8" "$HOMR/bin/x8"
  # popd  
  #xurls
  eget "mvdan/xurls" --asset "linux_amd64" --to "$HOME/bin/xurls" 
  #yataf
  pushd $(mktemp -d) && git clone https://github.com/Damian89/yataf && cd yataf
  CGO_ENABLED=0 go build -o "yataf_amd_x86_64_Linux" -v -ldflags="-s -w -extldflags '-static'"
  find . -type f -name '*_Linux' -exec mv {} "$HOME/bin/yataf" \;
  popd ; go clean -cache -fuzzcache -modcache -testcache
  #yq
  eget "mikefarah/yq" --asset "yq_linux_amd64" --asset "^.tar.gz" --to "$HOME/bin/yq"
  #zdns
  pushd $(mktemp -d) && git clone "https://github.com/zmap/zdns" && cd zdns
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" ; mv "./zdns" "$HOME/bin/zdns" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #zgrab2
  pushd $(mktemp -d) && git clone "https://github.com/zmap/zgrab2" && cd zgrab2
  CGO_ENABLED=0 go build -v -ldflags="-s -w -extldflags '-static'" "./cmd/zgrab2" ; mv "./zgrab2" "$HOME/bin/zgrab2" ; popd
  go clean -cache -fuzzcache -modcache -testcache
  #zoxide
  eget "ajeetdsouza/zoxide" --asset "x86_64-unknown-linux-musl.tar.gz" --to "$HOME/bin/zoxide" && ln -s "$HOME/bin/zoxide" "$HOME/bin/z"
  #zsh (best to install using conda)
  #eget "romkatv/zsh-bin" --asset "linux-x86_64.tar.gz" --asset "^.asc" --all
#-------------------------------------------------------#  
#EOF
