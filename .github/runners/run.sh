#!/usr/bin/env bash

##Helper Script to auto run self-hosted runners

#------------------------------------------------------------------------------------#
##ENV
#Name+{rand}
if [ -z "$DOCKER_CONTAINER_NAME" ]; then
 echo -e "\n[+]Setting Default Container Name: gh-runner-arm64x-gcp"
  export DOCKER_CONTAINER_NAME="gh-runner-arm64x-gcp"
else
 export DOCKER_CONTAINER_NAME="${DOCKER_CONTAINER_NAME}"
 echo -e "\n[+]Setting Default Container Name: ${DOCKER_CONTAINER_NAME}"
fi
#Image
if [ -z "$DOCKER_CONTAINER_IMAGE" ]; then
 echo -e "\n[+]Setting Default Container Image: azathothas/gh-runner-aarch64-ubuntu"
  export DOCKER_CONTAINER_IMAGE="azathothas/gh-runner-aarch64-ubuntu"
else
 export DOCKER_CONTAINER_IMAGE="${DOCKER_CONTAINER_IMAGE}"
 echo -e "\n[+]Setting Default Container Image: ${DOCKER_CONTAINER_IMAGE}"
fi
#Env File
if [ -z "$DOCKER_ENV_FILE" ]; then
 echo -e "\n[+]Setting Default Container Env File: $HOME/.config/gh-runner/.env"
  export DOCKER_ENV_FILE="$HOME/.config/gh-runner/.env"
else
 export DOCKER_ENV_FILE="${DOCKER_ENV_FILE}"
 echo -e "\n[+]Setting Default Container Env File: ${DOCKER_ENV_FILE}"
fi
#Log File
if [ -z "$DOCKER_LOG_FILE" ]; then
 DOCKER_LOG_FILE="$(mktemp)" && export DOCKER_LOG_FILE="${DOCKER_LOG_FILE}"
 echo -e "\n[+]Setting Default Container LOG File: ${DOCKER_LOG_FILE}"
 echo -e "[+]View Logs: tail -f ${DOCKER_LOG_FILE}\n"
else
 export DOCKER_LOG_FILE="${DOCKER_LOG_FILE}"
 echo -e "\n[+]Setting Default Container LOG File:${DOCKER_LOG_FILE}"
 echo -e "[+]View Logs: tail -f ${DOCKER_LOG_FILE}\n" 
fi
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
#Stop Existing
echo -e "\n[+] Cleaning PreExisting Container\n"
docker stop "$(docker ps -aqf name=${DOCKER_CONTAINER_NAME})" 2>/dev/null
docker stop "$(docker ps -aqf name=${DOCKER_CONTAINER_NAME})" 2>/dev/null
#RUN
echo -e "\n[+] Starting Runner Container (LOGFILE: ${DOCKER_LOG_FILE})\n"
set -x && nohup docker run --runtime "sysbox-runc" --name="${DOCKER_CONTAINER_NAME}" --rm --env-file="${DOCKER_ENV_FILE}" "${DOCKER_CONTAINER_IMAGE}" > "${DOCKER_LOG_FILE}" 2>&1 &
set +x && sleep 10
#Get logs
DOCKER_ID="$(docker ps -qf name=${DOCKER_CONTAINER_NAME})" && export DOCKER_ID="${DOCKER_ID}"
DOCKER_LOGPATH="$(docker inspect --format='{{.LogPath}}' ${DOCKER_CONTAINER_NAME})" && export DOCKER_LOGPATH="${DOCKER_LOGPATH}"
echo -e "\n[+] Writing Logs to ${DOCKER_LOGPATH} (${DOCKER_CONTAINER_NAME} :: ${DOCKER_ID})\n"
#sudo jq -r '.log' "${DOCKER_LOGPATH}""
#Monitor & Stop on Exit
while true; do
  export SHUTDOWN=false
  while IFS= read -r LOGS; do
    if echo "$LOGS" | grep -q "s6-rc: info: service s6rc-oneshot-runner successfully stopped"; then
      echo -e "\n[+] Stopping... (${DOCKER_CONTAINER_NAME} :: ${DOCKER_ID})\n"
      sudo jq -r '.log' "${DOCKER_LOGPATH}" | grep -i -A 999999 "Exiting runner"
      docker stop "$(docker ps -aqf name=${DOCKER_CONTAINER_NAME})"
      export SHUTDOWN=true
      break
    fi
  done < <(cat "${DOCKER_LOG_FILE}")
  #Check Status
  if [ "$SHUTDOWN" = true ]; then
    break
  fi
  sleep 5
done
#------------------------------------------------------------------------------------#
#END
echo -e "\n\n[+] Completed Runner ${DOCKER_CONTAINER_NAME} (LOGFILE: ${DOCKER_LOG_FILE})\n\n"
sed '/^$/d' "${DOCKER_LOG_FILE}"
echo -e "\n\n[+] Listing All Running Containers\n"
docker ps ; echo
echo -e 'RUN (Remove ALL Containers): docker ps -aq | xargs docker stop 2>/dev/null && docker rm "$(docker ps -aq)"' && echo
echo -e 'RUN (Remove ALL Images): docker rmi -f $(docker images -q) >/dev/null 2>&1' && echo
#EOF
#------------------------------------------------------------------------------------#