#!/usr/bin/env bash

export DOCKER_CONTAINER_NAME="gh-runner-arm64x-gcp"
export DOCKER_CONTAINER_IMAGE="azathothas/gh-runner-aarch64-ubuntu"
export DOCKER_ENV_FILE="$HOME/.config/gh-runner/.env"

nohup bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/runners/run.sh") >/dev/null 2>&1