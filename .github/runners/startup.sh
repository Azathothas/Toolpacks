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
##Read from --env-file=runner.env
if [ -n "${GITHUB_REPOSITORY}" ]; then
  auth_url="https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPOSITORY}/actions/runners/registration-token"
  registration_url="https://github.com/${GITHUB_OWNER}/${GITHUB_REPOSITORY}"
else
  auth_url="https://api.github.com/orgs/${GITHUB_OWNER}/actions/runners/registration-token"
  registration_url="https://github.com/${GITHUB_OWNER}"
fi
#------------------------------------------------------------------------------------#
generate_token() {
  local payload
  local runner_token
  payload=$(curl -fsX POST -H "Authorization: token ${GITHUB_PERSONAL_TOKEN}" "${auth_url}")
  runner_token=$(echo "${payload}" | jq .token --raw-output)
  if [ "${runner_token}" == "null" ]; then
    echo "${payload}"
    exit 1
  fi
  echo "${runner_token}"
}
#------------------------------------------------------------------------------------#
service docker status
runner_id=${RUNNER_NAME}_$(openssl rand -hex 6)
echo "Registering runner ${runner_id}"
RUNNER_TOKEN=$(generate_token)
test $? -ne 0 && {
  echo "Debugging token"
  echo -e "\n[+] Token: ${GITHUB_PERSONAL_TOKEN}\n"
  echo "${RUNNER_TOKEN}" && echo -e "\n"
  exit 1
}
./config.sh \
  --name "${runner_id}" \
  --labels "${RUNNER_LABELS}" \
  --token "${RUNNER_TOKEN}" \
  --url "${registration_url}" \
  --unattended \
  --replace \
  --ephemeral
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
remove_runner() {
  ./config.sh remove --unattended --token "$(generate_token)"
}
trap 'remove_runner; exit 130' SIGINT
trap 'remove_runner; exit 143' SIGTERM
#------------------------------------------------------------------------------------#
./run.sh "$*"
#------------------------------------------------------------------------------------#
