#!/usr/bin/env bash

##Helper Script to auto run self-hosted runners

#------------------------------------------------------------------------------------#
#Requires passwordless sudo 
if [ "$(id -u)" -eq 0 ]; then
    echo -e "\n[+] USER:$(whoami) Running as root, skipping passwordless Sudo Checks"
else
    if sudo -n -l | grep -q NOPASSWD; then
       echo -e "\n[+] Passwordless sudo is Configured"
       sudo -n -l 2>/dev/null
    else
       echo -e "\n[-] Passwordless sudo is NOT Configured"
       echo -e "\n[-] READ: https://web.archive.org/web/20230614212916/https://linuxhint.com/setup-sudo-no-password-linux/\n"
       #exit
       exit 1
    fi
fi
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
#Sanity Check
if ! command -v podman &> /dev/null; then
   #If this doesn't work with sudo: sudo ln -s "$(which podman)" "/usr/local/bin/podman"
   echo -e "\n[-] Podman is NOT Installed/Configured"
   echo -e "[-] Install ALL Dependencies && Configure ENV VARS|PATH\n"
   echo -e "\n[-] READ: https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/README.md#additional-notes--refs\n"
 exit 1
fi
if ! command -v docker &> /dev/null; then
   echo -e "\n[-] Docker is NOT Installed/Configured"
   echo -e "[-] Install ALL Dependencies && Configure ENV VARS|PATH\n"
   echo -e "\n[-] READ: https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/README.md#additional-notes--refs\n"
 exit 1
fi
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
##ENV
 SYSTMP="$(dirname $(mktemp -u))" && export SYSTMP="$SYSTMP"
 USER="$(whoami)" && export USER="$USER"
 HOME="$(getent passwd $USER | cut -d: -f6)" && export HOME="$HOME" ; pushd "$HOME" >/dev/null 2>&1
 echo -e "\n[+] USER = $USER"
 echo -e "[+] HOME = $HOME"
 echo -e "[+] WORKDIR = $(realpath .)"
 echo -e "[+] PATH = $PATH\n"
#Name+{rand}
if [ -z "$PODMAN_CONTAINER_NAME" ]; then
 echo -e "\n[+] Setting Default Container Name: gh-runner-arm64x-gcp"
  export PODMAN_CONTAINER_NAME="gh-runner-arm64x-gcp"
  sudo podman stop "${PODMAN_CONTAINER_NAME}" >/dev/null 2>&1
else
 export PODMAN_CONTAINER_NAME="${PODMAN_CONTAINER_NAME}"
  echo -e "\n[+] Setting Default Container Name: ${PODMAN_CONTAINER_NAME}"
  sudo podman stop "${PODMAN_CONTAINER_NAME}" >/dev/null 2>&1
fi
#Image
if [ -z "$PODMAN_CONTAINER_IMAGE" ]; then
 echo -e "\n[+] Setting Default Container Image: azathothas/gh-runner-aarch64-ubuntu"
  export PODMAN_CONTAINER_IMAGE="azathothas/gh-runner-aarch64-ubuntu"
  sudo podman rmi "${PODMAN_CONTAINER_IMAGE}" --force >/dev/null 2>&1
  sudo podman pull "${PODMAN_CONTAINER_IMAGE}"
else
 export PODMAN_CONTAINER_IMAGE="${PODMAN_CONTAINER_IMAGE}"
 echo -e "\n[+] Setting Default Container Image: ${PODMAN_CONTAINER_IMAGE}"
 sudo podman rmi "${PODMAN_CONTAINER_IMAGE}" --force >/dev/null 2>&1
 sudo podman pull "${PODMAN_CONTAINER_IMAGE}"
fi
#Env File
if [ -z "$PODMAN_ENV_FILE" ]; then
 echo -e "\n[+] Setting Default Container Env File: $HOME/.config/gh-runner/.env"
  export PODMAN_ENV_FILE="$HOME/.config/gh-runner/.env"
     if ! [[ -s "${PODMAN_ENV_FILE}" ]]; then
         echo -e "\n[-] Fatal: Empty/Non Existent ${PODMAN_ENV_FILE} file!"
       exit 1
     fi    
else
 export PODMAN_ENV_FILE="${PODMAN_ENV_FILE}"
 echo -e "\n[+] Setting Default Container Env File: ${PODMAN_ENV_FILE}"
      if ! [[ -s "${PODMAN_ENV_FILE}" ]]; then
         echo -e "\n[-] Fatal: Empty/Non Existent ${PODMAN_ENV_FILE} file!"
       exit 1
     fi 
fi
#Log File
if [ -z "$PODMAN_LOG_FILE" ]; then
 PODMAN_LOG_FILE="$(mktemp)" && export PODMAN_LOG_FILE="${PODMAN_LOG_FILE}"
 echo -e "\n[+] Setting Default Container LOG File: ${PODMAN_LOG_FILE}"
 echo -e "[+] View Logs: tail -f ${PODMAN_LOG_FILE}\n"
else
 export PODMAN_LOG_FILE="${PODMAN_LOG_FILE}"
 echo -e "\n[+] Setting Default Container LOG File:${PODMAN_LOG_FILE}"
 echo -e "[+] View Logs: tail -f ${PODMAN_LOG_FILE}\n" 
fi
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
#Stop Existing
echo -e "\n[+] Cleaning PreExisting Container\n"
sudo podman stop "$(sudo podman ps -aqf name=${PODMAN_CONTAINER_NAME})" >/dev/null 2>&1 &
wait
sudo podman stop "$(sudo podman ps -aqf name=${PODMAN_CONTAINER_NAME})" >/dev/null 2>&1 && sleep 5
#RUN
echo -e "\n[+] Starting Runner Container (LOGFILE: ${PODMAN_LOG_FILE})\n"
sudo mkdir -p "/var/lib/containers/tmp"
set -x && nohup sudo podman run --privileged --network="bridge" --systemd="always" --volume="/var/lib/containers/tmp:/tmp" --tz="UTC" --pull="always" --name="${PODMAN_CONTAINER_NAME}" --rm --env-file="${PODMAN_ENV_FILE}" "${PODMAN_CONTAINER_IMAGE}" > "${PODMAN_LOG_FILE}" 2>&1 &
set +x && echo -e "[+] Waiting 30s..." && sleep 30
#Get logs
PODMAN_ID="$(sudo podman ps -qf name=${PODMAN_CONTAINER_NAME})" && export PODMAN_ID="${PODMAN_ID}"
PODMAN_LOGPATH="$(sudo podman inspect --format='{{.HostConfig.LogConfig.Path}}' ${PODMAN_CONTAINER_NAME})" && export PODMAN_LOGPATH="${PODMAN_LOGPATH}"
echo -e "\n[+] Writing Logs to ${PODMAN_LOGPATH} (${PODMAN_CONTAINER_NAME} :: ${PODMAN_ID})\n"
sudo podman exec --user "runner" --env-file="${PODMAN_ENV_FILE}" "${PODMAN_ID}" "/usr/local/bin/manager.sh" >> "${PODMAN_LOG_FILE}" 2>&1 &
set +x && echo -e "[+] Waiting 10s..." && sleep 10
#sudo jq -r '.log' "${PODMAN_LOGPATH}""
#Monitor & Stop on Exit
set +x && echo -e "[+] Executing Runner..."
while true; do
    if ! pgrep -f "/usr/local/bin/manager.sh" > /dev/null; then
        cat "${PODMAN_LOG_FILE}"
      sudo podman stop "${PODMAN_ID}" --ignore
      exit 0
    fi
    sleep 5
done
#------------------------------------------------------------------------------------#
#END
popd >/dev/null 2>&1
echo -e "\n\n[+] Completed Runner ${PODMAN_CONTAINER_NAME} (LOGFILE: ${PODMAN_LOG_FILE})\n\n"
sed '/^$/d' "${PODMAN_LOG_FILE}"
echo -e "\n\n[+] Listing All Running Containers\n"
sudo podman ps ; echo
echo -e 'RUN (Remove ALL Containers): sudo podman ps -aq | xargs sudo podman stop 2>/dev/null && sudo podman rm "$(podman ps -aq)" --force' && echo
echo -e 'RUN (Remove ALL Images): sudo podman rmi -f $(podman images -q) >/dev/null 2>&1' && echo
#EOF
#------------------------------------------------------------------------------------#