- #### Docker Images for Self-Hosted Toolpack Build Machines
> INFO: Originally forked from [PasseiDireto/gh-runner](https://github.com/PasseiDireto/gh-runner)
> > - [Ubuntu (ubuntu:latest)](https://hub.docker.com/_/ubuntu) with [Systemd + Docker](https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/ubuntu-systemd-base.dockerfile) --> [azathothas/ubuntu-systemd-base](https://hub.docker.com/r/azathothas/ubuntu-systemd-base)
> > > This is a base image meant for use by [gh-runners](https://github.com/Azathothas/Toolpacks/tree/main/.github/runners) with sysbox preconfigured on host
> > > - **Preconfigured** : `Systemd + SSHD + Docker`
> > > - **Runtime**:[`sysbox-runc`](https://github.com/nestybox/sysbox)
> > > - **Used**: [`azathothas/gh-runner-aarch64-ubuntu:latest`](https://hub.docker.com/r/azathothas/gh-runner-aarch64-ubuntu)
> > > ```bash
> > > docker run --runtime=sysbox-runc -it --rm --name="ubuntu-systemd" "azathothas/ubuntu-systemd-base:latest"
> > >
> > > !# Login
> > > $USER="admin"
> > > $PASSWORD="admin"
> > > ```
> > - [(azathothas/gh-runner-aarch64-ubuntu:latest)](https://hub.docker.com/r/azathothas/gh-runner-aarch64-ubuntu) --> [aarch64-ubuntu.dockerfile](https://github.com/Azathothas/Toolpacks/blob/main/.github/runners/aarch64-ubuntu.dockerfile)
> > > This is a base image meant for use by [gh-runners](https://github.com/Azathothas/Toolpacks/tree/main/.github/runners) with sysbox preconfigured on host
> > > - **Preconfigured** : [`Systemd + SSHD + Docker`](https://hub.docker.com/r/azathothas/ubuntu-systemd-base)
> > > - **Runtime**:[`sysbox-runc`](https://github.com/nestybox/sysbox)
> > > - **Overlay/Init**:[`s6-overlay`](https://github.com/just-containers/s6-overlay)
> > > - **Systemctl**:[`docker-systemctl-replacement`](https://github.com/gdraheim/docker-systemctl-replacement)
> > > ```bash
> > > !# For Details see: https://github.com/PasseiDireto/gh-runner/blob/master/README.md
> > > # gh-runner-arm64x-gcp is just an example
> > > # See `.env-example` for $HOME/.config/gh-runner/.env
> > > docker run --runtime "sysbox-runc" --name="gh-runner-arm64x-gcp" --rm --env-file="$HOME/.config/gh-runner/.env" "azathothas/gh-runner-aarch64-ubuntu"
> > > # One-Liner
> > > DOCKER_CONTAINER_NAME="gh-runner-arm64x-gcp" DOCKER_CONTAINER_IMAGE="azathothas/gh-runner-aarch64-ubuntu" DOCKER_ENV_FILE="$HOME/.config/gh-runner/.env" bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/runners/run.sh")
> > > DOCKER_CONTAINER_NAME="gh-runner-arm64x-gcp" DOCKER_CONTAINER_IMAGE="azathothas/gh-runner-aarch64-ubuntu" DOCKER_ENV_FILE="$HOME/.config/gh-runner/.env" bash <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/runners/run.sh")
> > > 
> > > !# Stopping
> > > docker stop "gh-runner-arm64x-gcp"
> > >
---
- #### Additional Notes & Refs
> - [Install Sysbox](https://github.com/nestybox/sysbox)
> ```bash
> !# Del Existing Docker
> docker rm $(docker ps -a -q) -f
> 
> !# Install Deps
> sudo apt-get install fuse3 libfuse-dev -y
> sudo apt-get install "linux-headers-$(uname -r)" -y
> sudo apt-get install linux-headers-{amd64|arm64} -y
> sudo apt-get --fix-broken install -y
> # Get .Deb PKGS
> #aarch64 | arm64
> pushd "$(mktemp -d)" > /dev/null 2>&1 && wget --quiet --show-progress "$(curl -qfsSL 'https://api.github.com/repos/nestybox/sysbox/releases/latest' | jq -r '.body' | sed -n 's/.*(\(https:\/\/.*\.deb\)).*/\1/p' | grep -i 'arm64')" -O "./sysbox.deb" && sudo dpkg -i "./sysbox.deb" ; popd > /dev/null 2>&1
> sudo apt-get autoremove -y ; sudo apt-get update -y && sudo apt-get upgrade -y
> #amd x86_64
> pushd "$(mktemp -d)" > /dev/null 2>&1 && wget --quiet --show-progress "$(curl -qfsSL 'https://api.github.com/repos/nestybox/sysbox/releases/latest' | jq -r '.body' | sed -n 's/.*(\(https:\/\/.*\.deb\)).*/\1/p' | grep -i 'amd64')" -O "./sysbox.deb" && sudo dpkg -i "./sysbox.deb" ; popd > /dev/null 2>&1
> sudo apt-get autoremove -y ; sudo apt-get update -y && sudo apt-get upgrade -y
> #Test
> sysbox-runc --version
> ```
