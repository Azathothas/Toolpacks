
- Replacing eget with GH
```bash
#Assumes GITHUB_TOKEN is exported
gh release download -R "https://github.com/Tantalor93/dnspyre" --clobber -p '*linux*amd64*tar.gz' -p '!(*arm*|*windows*|*mac*)'
gh release download -R "https://github.com/Tantalor93/dnspyre" --clobber -p '*linux*amd64*tar.gz'


pushd "$($TMPDIRS)" >/dev/null 2>&1
gh release download -R "$SOURCE_URL" --clobber -p '*static*amd64*tar*'
ouch decompress "./"* --yes
find . -type d -name '*bin*' ! -name 'build-bins' -print0 | xargs -0 -I {} sh -c 'mkdir -p ./build-bins && cp -r {}/* ./build-bins/'
file "./build-bins/"* && du -sh "./build-bins/"*
```

- Searching Issues for Single User
```bash

curl -qfsSL "https://api.github.com/search/issues?q=author%3Axplshn" -H "Authorization: Bearer ghp_NON_PRIV_TOKEN" | jq -r '.items[] | "\(.title) --> \(.url)"' | sed 's#api\.github\.com/repos#github.com#g'

curl -qfsSL "https://api.github.com/search/issues?q=author%3ASkyperTHC" -H "Authorization: Bearer ghp_NON_PRIV_TOKEN" | jq -r '.items[] | "\(.title) --> \(.url)"' | sed 's#api\.github\.com/repos#github.com#g'


curl -qfsSL "https://api.github.com/search/issues?q=author%3Aleleliu008" -H "Authorization: Bearer ghp_NON_PRIV_TOKEN" | jq -r '.items[] | "\(.title) --> \(.url)"' | sed 's#api\.github\.com/repos#github.com#g'
```