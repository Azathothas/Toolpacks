#!/usr/bin/env bash
# DO NOT RUN DIRECTLY
# export GITHUB_TOKEN="NON_PRIVS_READ_ONLY_TOKEN"
# bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/scripts/scrape_pub_issues.sh")
# bash <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/refs/heads/main/.github/scripts/scrape_pub_issues.sh")
#-------------------------------------------------------#

#-------------------------------------------------------#
##Sanity Checks
if [[ -z "${OUTDIR// }" ]]; then
 export OUTDIR="${GITHUB_WORKSPACE}/main/.github"
 #mkdir -p "${OUTDIR}"
 if [ ! -d "${OUTDIR}" ]; then
    echo -e "\n[-] FATAL: Are you sure ${OUTDIR} Exists...? (Maybe not inside Github CI...?)\n"
   exit 1
 fi
else
 OUTDIR="$(realpath ${OUTDIR})" ; export OUTDIR
 mkdir -pv "${OUTDIR}"
fi
#-------------------------------------------------------#


#-------------------------------------------------------#
##ENV
#https://docs.github.com/en/rest/issues/issues
export DATE_CUTOFF="2024-00-00T00:00:00Z"
#export GH_APIURL="api.gh.pkgforge.dev"
export GH_APIURL="api.github.com"
TEMP_ISSUES="$(mktemp -d)" && export TEMP_ISSUES="${TEMP_ISSUES}"
USER_AGENT="$(curl -qfsSL 'https://pub.ajam.dev/repos/Azathothas/Wordlists/Misc/User-Agents/ua_chrome_macos_latest.txt')" && export USER_AGENT="${USER_AGENT}"
echo -e "\n[+] Using Temp Dir : ${TEMP_ISSUES}"
#-------------------------------------------------------#

#-------------------------------------------------------#
#Fetch: `static binary`
(for page in {1..10}; do
    echo -e "\n[+] GH API: Static Binary ($page/10)\n"
     curl -qfsSL -A "${USER_AGENT}" "https://${GH_APIURL}/search/issues?q=static+binary+state:open+is:issue&filter=all&since=${DATE_CUTOFF}&sort=created&direction=desc&per_page=100&page=$page" -H "Authorization: Bearer ${GITHUB_TOKEN}" | jq -r '.items | sort_by(.created_at)[] | "\(.created_at // "NA") \(.title // "NA") --> \(.html_url // "NA") (\(.user.login // "NA"))"' | tee -a "${TEMP_ISSUES}/$(openssl rand -hex 3).txt"
     sleep 2
done) &
#Fetch: `static build`
(for page in {1..10}; do
    echo -e "\n[+] GH API: Static Build ($page/10)\n"
     curl -qfsSL -A "${USER_AGENT}" "https://${GH_APIURL}/search/issues?q=static+build+state:open+is:issue&filter=all&since=${DATE_CUTOFF}&sort=created&direction=desc&per_page=100&page=$page" -H "Authorization: Bearer ${GITHUB_TOKEN}" | jq -r '.items | sort_by(.created_at)[] | "\(.created_at // "NA") \(.title // "NA") --> \(.html_url // "NA") (\(.user.login // "NA"))"' | tee -a "${TEMP_ISSUES}/$(openssl rand -hex 3).txt"
     sleep 2
done) &
wait ; echo
#Fetch: `static compile`
(for page in {1..10}; do
    echo -e "\n[+] GH API: Static Compile ($page/10)\n"
     curl -qfsSL -A "${USER_AGENT}" "https://${GH_APIURL}/search/issues?q=static+compile+state:open+is:issue&filter=all&since=${DATE_CUTOFF}&sort=created&direction=desc&per_page=100&page=$page" -H "Authorization: Bearer ${GITHUB_TOKEN}" | jq -r '.items | sort_by(.created_at)[] | "\(.created_at // "NA") \(.title // "NA") --> \(.html_url // "NA") (\(.user.login // "NA"))"' | tee -a "${TEMP_ISSUES}/$(openssl rand -hex 3).txt"
     sleep 2
done) &
#Fetch: `musl binary`
(for page in {1..10}; do
    echo -e "\n[+] GH API: MUSL Binary ($page/10)\n"
     curl -qfsSL -A "${USER_AGENT}" "https://${GH_APIURL}/search/issues?q=musl+binary+state:open+is:issue&filter=all&since=${DATE_CUTOFF}&sort=created&direction=desc&per_page=100&page=$page" -H "Authorization: Bearer ${GITHUB_TOKEN}" | jq -r '.items | sort_by(.created_at)[] | "\(.created_at // "NA") \(.title // "NA") --> \(.html_url // "NA") (\(.user.login // "NA"))"' | tee -a "${TEMP_ISSUES}/$(openssl rand -hex 3).txt"
     sleep 2
done) &
wait ; echo
#Fetch: `musl build`
(for page in {1..10}; do
    echo -e "\n[+] GH API: MUSL Build ($page/10)\n"
     curl -qfsSL -A "${USER_AGENT}" "https://${GH_APIURL}/search/issues?q=musl+build+state:open+is:issue&filter=all&since=${DATE_CUTOFF}&sort=created&direction=desc&per_page=100&page=$page" -H "Authorization: Bearer ${GITHUB_TOKEN}" | jq -r '.items | sort_by(.created_at)[] | "\(.created_at // "NA") \(.title // "NA") --> \(.html_url // "NA") (\(.user.login // "NA"))"' | tee -a "${TEMP_ISSUES}/$(openssl rand -hex 3).txt"
     sleep 2
done) &
#Fetch: `musl compile`
(for page in {1..10}; do
    echo -e "\n[+] GH API: MUSL Compile ($page/10)\n"
     curl -qfsSL -A "${USER_AGENT}" "https://${GH_APIURL}/search/issues?q=musl+compile+state:open+is:issue&filter=all&since=${DATE_CUTOFF}&sort=created&direction=desc&per_page=100&page=$page" -H "Authorization: Bearer ${GITHUB_TOKEN}" | jq -r '.items | sort_by(.created_at)[] | "\(.created_at // "NA") \(.title // "NA") --> \(.html_url // "NA") (\(.user.login // "NA"))"' | tee -a "${TEMP_ISSUES}/$(openssl rand -hex 3).txt"
     sleep 2
done) &
wait ; echo
#Fetch: `release binary`
(for page in {1..10}; do
    echo -e "\n[+] GH API: Release Binary ($page/10)\n"
     curl -qfsSL -A "${USER_AGENT}" "https://${GH_APIURL}/search/issues?q=release+binary+state:open+is:issue&filter=all&since=${DATE_CUTOFF}&sort=created&direction=desc&per_page=100&page=$page" -H "Authorization: Bearer ${GITHUB_TOKEN}" | jq -r '.items | sort_by(.created_at)[] | "\(.created_at // "NA") \(.title // "NA") --> \(.html_url // "NA") (\(.user.login // "NA"))"' | tee -a "${TEMP_ISSUES}/$(openssl rand -hex 3).txt"
     sleep 2
done) &
#Fetch: `release static`
(for page in {1..10}; do
    echo -e "\n[+] GH API: Release Binary ($page/10)\n"
     curl -qfsSL -A "${USER_AGENT}" "https://${GH_APIURL}/search/issues?q=release+static+state:open+is:issue&filter=all&since=${DATE_CUTOFF}&sort=created&direction=desc&per_page=100&page=$page" -H "Authorization: Bearer ${GITHUB_TOKEN}" | jq -r '.items | sort_by(.created_at)[] | "\(.created_at // "NA") \(.title // "NA") --> \(.html_url // "NA") (\(.user.login // "NA"))"' | tee -a "${TEMP_ISSUES}/$(openssl rand -hex 3).txt"
     sleep 2
done) &
wait ; echo
#Sort
find "${TEMP_ISSUES}" -name "*.txt" -exec cat {} + | grep '^[0-9]' | grep -v '\[bot\])' | sort --unique --reverse -o "${OUTDIR}/pub_issues.txt"
#find "${TEMP_ISSUES}" -name "*.txt" -exec cat {} + | grep '^[0-9]' | grep -v '\[bot\])' | sort --numeric-sort --reverse --unique -o "${OUTDIR}/pub_issues.txt"
#find "${TEMP_ISSUES}" -name "*.txt" -exec cat {} + | grep '^[0-9]' | grep -v '\[bot\])' | sort --version-sort --reverse --unique -o "${OUTDIR}/pub_issues.txt"
echo -e "\n[+] Saved Output ==> ${OUTDIR}/pub_issues.txt"
#-------------------------------------------------------#