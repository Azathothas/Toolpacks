#!/bin/env bash

#------------------------------------------------------------------------------------#
#Start Docker
if command -v systemctl &>/dev/null && [ -s "/lib/systemd/system/docker.service" ]; then
   echo -e "\n[+] Starting supervisor (Docker)\n"
   sudo systemctl daemon-reload 2>/dev/null
   sudo systemctl enable docker --now 2>/dev/null
   sudo systemctl restart docker 2>/dev/null
   sudo systemctl list-unit-files --type=service | grep -i "docker"
   sudo systemctl status "docker.service"
   sudo service docker restart
   sudo service docker status
fi
#------------------------------------------------------------------------------------#

##------------------------------------------------------------------------------------#
##If using s6-svc (in a container), attempt to restart tailscale
#start_tailscaled()
#{
# sudo systemctl daemon-reload 2>/dev/null
# sudo systemctl enable "tailscaled.service" --now 2>/dev/null
# sudo systemctl restart "tailscaled.service" 2>/dev/null
# sudo systemctl list-unit-files --type=service | grep -i "tailscale"
# sudo systemctl status "tailscaled.service" 2>/dev/null
#}
#export -f start_tailscaled
#if command -v s6-svc &>/dev/null && [ -d "/command" ] && [ -d "/etc/s6-overlay/s6-rc.d/tailscaled" ]; then
#   timeout -k 10 20 sudo "$(command -v s6-svc)" -u "/etc/s6-overlay/s6-rc.d/tailscaled" 2>/dev/null
#   timeout -k 10 20 sudo "$(command -v s6-svc)" -r "/etc/s6-overlay/s6-rc.d/tailscaled" 2>/dev/null
#   sleep 10
#   if ! sudo pgrep -f 'tailscaled --tun=userspace-networking' >/dev/null && command -v systemctl &>/dev/null && [ -s "/lib/systemd/system/tailscaled.service" ]; then
#     start_tailscaled 2>/dev/null
#   fi
#elif ! sudo pgrep -f 'tailscaled --tun=userspace-networking' >/dev/null && command -v systemctl &>/dev/null && [ -s "/lib/systemd/system/tailscaled.service" ]; then
#   start_tailscaled 2>/dev/null
#fi
##------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Read from --env-file=runner.env & Authenticate
if [ -n "${GITHUB_REPOSITORY}" ]; then
  echo -e "[+] Registering Runner For ${GITHUB_OWNER}/${GITHUB_REPOSITORY}"
  export auth_url="https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPOSITORY}/actions/runners/registration-token"
  export registration_url="https://github.com/${GITHUB_OWNER}/${GITHUB_REPOSITORY}"
else
  echo -e "[+] Registering Runner For ${GITHUB_OWNER} [ORG]"
  export auth_url="https://api.github.com/orgs/${GITHUB_OWNER}/actions/runners/registration-token"
  export registration_url="https://github.com/${GITHUB_OWNER}"
fi
#------------------------------------------------------------------------------------#
##Func to Generate API Tokens
generate_token() {
  local payload
  local runner_token
  echo -e "[+] Generating Token..."
  payload="$(curl -qfsSL -X 'POST' "${auth_url}" -H "Authorization: Bearer ${GITHUB_PERSONAL_TOKEN}" -H 'Accept: application/vnd.github+json')"
  runner_token="$(echo "${payload}" | jq '.token' --raw-output)"
  if [ "${runner_token}" == "null" ]; then
    echo "${payload}" | jq .
    exit 1
  fi
  echo -e "[+] Ephemeral AUTH Token :: ${runner_token}"
}
export -f generate_token
#------------------------------------------------------------------------------------#
##Recheck Docker Status & Register Runner
cd "/runner-init" && service docker status
runner_id="${RUNNER_NAME}_$(openssl rand -hex 6)"
echo "[+] Registering Runner --> ${runner_id}"
RUNNER_TOKEN="$(generate_token)"
test $? -ne 0 && {
  echo "[-] Debugging Token..."
  echo -e "\n[+] Token: ${GITHUB_PERSONAL_TOKEN}\n"
  echo "${RUNNER_TOKEN}" && echo -e "\n"
  exit 1
}
##Configure
echo "[+] Configuring Runner..."
echo "[+] (ID: ${runner_id})"
echo "[+] (LABELS: ${RUNNER_LABELS})"
echo "[+] (TOKEN: ${RUNNER_TOKEN})"
echo "[+] (URL: ${registration_url})"
"/runner-init/config.sh" \
  --name "${runner_id}" \
  --labels "${RUNNER_LABELS}" \
  --token "${RUNNER_TOKEN}" \
  --url "${registration_url}" \
  --unattended \
  --replace \
  --ephemeral
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##Remove Runner Upon Completion
remove_runner() {
  "/runner-init/config.sh" remove --unattended --token "$(generate_token)"
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
