#!/bin/bash
echo -e "\n[+] Starting supervisor (Docker)\n"
sudo service docker start

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