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
     #lit-bb-hack-tools : misc bb tools  
     export BIN="bbscope" #Name of final binary/pkg/cli, sometimes differs from $REPO
     export SOURCE_URL="https://github.com/edoardottt/lit-bb-hack-tools" #github/gitlab/homepage/etc for $BIN
     echo -e "\n\n [+] (Building | Fetching) $BIN :: $SOURCE_URL\n"
      #Build
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
       pushd "$($TMPDIRS)" > /dev/null 2>&1 && git clone --quiet --filter "blob:none" "https://github.com/edoardottt/lit-bb-hack-tools" && cd "./lit-bb-hack-tools"
       find . -type f -name '*.md' -exec rm {} \;
       find . -maxdepth 1 -type d ! -name '.git*' -exec sh -c 'GOOS="linux" GOARCH="arm64" CGO_ENABLED="0" go build -o "$1/$1_aarch64_arm64_Linux" -v -a -gcflags=all="-l -B -wb=false" -ldflags="-s -w -extldflags '\''-static'\''" "$1/"*' _ {} \;
       find . -type f -name '*_Linux' -exec cp {} "$BINDIR/" \;
       popd > /dev/null 2>&1 ; go clean -cache -fuzzcache -modcache -testcache
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