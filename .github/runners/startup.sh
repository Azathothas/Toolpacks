#!/bin/env bash

#------------------------------------------------------------------------------------#
##Example ENV (Avoid double quotes if it's in a file)
#[admin:org] :: repo (all) || read:public_key (on admin:public_key) || read:repo_hook (on admin:repo_hook) || admin:org_hook || notifications || workflow
#GITHUB_PERSONAL_TOKEN=ghp_vaaaaaaaaaa
#GITHUB_OWNER=Azathothas
#leave empty if for entire org
#GITHUB_REPOSITORY=Toolpacks
#leave empty if for repo
#GITHUB_ORG=
#A random suffix is applied on RUNNER_NAME
#RUNNER_NAME=amd64-x64-toolpacker
#RUNNER_LABELS=amd64-x64-toolpacker,amd64-x64-toolpacker-azathothas,amd64-x64-toolpacker-builder
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
#Sanity Checks
if [ -z "${GITHUB_PERSONAL_TOKEN}" ] || \
   [ -z "${GITHUB_OWNER}" ] || \
   [ -z "${RUNNER_NAME}" ] || \
   [ -z "${RUNNER_LABELS}" ]; then
  #exit
   echo -e "\n[-] FATAL: Required ENV VARS NOT SET\n"
   echo -e "GITHUB_PERSONAL_TOKEN=${GITHUB_PERSONAL_TOKEN}"
   echo -e "GITHUB_OWNER=${GITHUB_OWNER}"
   echo -e "RUNNER_NAME=${RUNNER_NAME}"
   echo -e "RUNNER_LABELS=${RUNNER_LABELS}"
 exit 1
elif [ -z "${GITHUB_REPOSITORY}" ] && [ -z "${GITHUB_ORG}" ]; then
  #exit
   echo -e "\n[-] FATAL: At least GITHUB_ORG or GITHUB_REPOSITORY must be specified\n"
   echo -e "GITHUB_ORG=${GITHUB_ORG}"
   echo -e "GITHUB_REPOSITORY=${GITHUB_REPOSITORY}"
 exit 1
fi
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
#Start Docker
if command -v systemctl &>/dev/null && [ -s "/lib/systemd/system/docker.service" ]; then
   echo -e "\n[+] Starting supervisor (Docker)\n"
   sudo systemctl daemon-reload 2>/dev/null
   sudo systemctl enable docker --now --yes 2>/dev/null
   sudo systemctl restart docker 2>/dev/null
   sudo systemctl list-unit-files --type=service | grep -i "docker"
   sudo systemctl status "docker.service" --no-pager
   sudo service docker restart >/dev/null 2>&1
   sudo systemctl status "docker.service" --no-pager
fi
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Read from --env-file=runner.env & Authenticate
if [ -n "${GITHUB_REPOSITORY}" ]; then
  echo -e "[+] Registering Runner For ${GITHUB_OWNER}/${GITHUB_REPOSITORY} [REPO]"
  export AUTH_URL="https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPOSITORY}/actions/runners/registration-token"
  export REG_URL="https://github.com/${GITHUB_OWNER}/${GITHUB_REPOSITORY}"
elif [ -n "${GITHUB_ORG}" ]; then
  echo -e "[+] Registering Runner For ${GITHUB_ORG} [ORG]"
  export AUTH_URL="https://api.github.com/orgs/${GITHUB_OWNER}/actions/runners/registration-token"
  export REG_URL="https://github.com/${GITHUB_OWNER}"
fi
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Func to Generate API Tokens
generate_token() {
  echo -e "[+] Generating Token..."
  API_RESPONSE="$(curl -qfsSL -X 'POST' "${AUTH_URL}" -H "Authorization: Bearer ${GITHUB_PERSONAL_TOKEN}" -H 'Accept: application/vnd.github+json')" && export API_RESPONSE="${API_RESPONSE}"
 #Validate Response
  if ! echo "${API_RESPONSE}" | jq -e . >/dev/null 2>&1; then
     echo "[-] Error: API response is not a valid JSON."
     echo "${API_RESPONSE}"
     unset RUNNER_TOKEN
    exit 1
  else
    #Fetch Token
     RUNNER_TOKEN="$(echo "${API_RESPONSE}" | jq -r '.token' | tr -d '[:space:]')" && export RUNNER_TOKEN="${RUNNER_TOKEN}"
     if [ "${RUNNER_TOKEN}" == "null" ]; then
       echo "[-] Error: Couldn't fetch Ephemeral AUTH Token."
       echo "${API_RESPONSE}" | jq .
       unset RUNNER_TOKEN
       exit 1
     else
       echo -e "[+] Ephemeral AUTH Token :: ${RUNNER_TOKEN}"
     fi
  fi
}
export -f generate_token
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Register Runner
cd "/runner-init"
RUNNER_ID="${RUNNER_NAME}_$(openssl rand -hex 6 | tr -d '[:space:]')" && export RUNNER_ID="${RUNNER_ID}"
echo "[+] Registering Runner --> ${RUNNER_ID}" && generate_token
if [ -n "${RUNNER_TOKEN}" ]; then
  ##Configure
   echo "[+] Configuring Runner..."
   echo "[+] (ID: ${RUNNER_ID})"
   echo "[+] (LABELS: ${RUNNER_LABELS})"
   echo "[+] (TOKEN: ${RUNNER_TOKEN})"
   echo "[+] (URL: ${REG_URL})"
   "/runner-init/config.sh" \
     --name "${RUNNER_ID}" \
     --labels "${RUNNER_LABELS}" \
     --token "${RUNNER_TOKEN}" \
     --url "${REG_URL}" \
     --unattended \
     --replace \
     --ephemeral
else
   echo "[-] Failed to Generate Token..."
   echo -e "\n[+] GITHUB_PERSONAL_TOKEN: ${GITHUB_PERSONAL_TOKEN}\n"
     curl -fsSL "https://api.github.com/user" -H "Authorization: Bearer ${GITHUB_PERSONAL_TOKEN}" -H 'Accept: application/vnd.github+json'
   exit 1
fi
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Remove Runner Upon Completion
remove_runner() {
  generate_token
  "/runner-init/config.sh" remove --unattended --token "${RUNNER_TOKEN}"
  unset API_RESPONSE AUTH_URL REG_URL RUNNER_ID RUNNER_LABELS RUNNER_TOKEN
}
export -f remove_runner
#exit if ctrl + c
trap 'remove_runner; exit 130' SIGINT
#exit if kill|pkill -9
trap 'remove_runner; exit 143' SIGTERM
#------------------------------------------------------------------------------------#
#Run with Initial ARGs
"/runner-init/run.sh" "$*"
#------------------------------------------------------------------------------------#