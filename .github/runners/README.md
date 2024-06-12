- #### **`"$HOME/.config/gh-runner/.toolpacks_env"`** `(x86_64_Linux)`
> ```bash
> mkdir -p "$HOME/.config/gh-runner" && touch "$HOME/.config/gh-runner/.env"
> cat << 'EOF' > "$HOME/.config/gh-runner/.env"
> ##DO NOT USE DOUBLE QUOTES
> #A random suffix is applied on RUNNER_NAME
> RUNNER_NAME=amd64-linux-toolpacker
> #[admin:org] :: repo (all) || read:public_key (on admin:public_key) || read:repo_hook (on admin:repo_hook) || admin:org_hook || notifications || workflow
> GITHUB_PERSONAL_TOKEN=ghp_azazazazaaaaazazazazazzazaza
> GITHUB_OWNER=Azathothas
> GITHUB_REPOSITORY=Toolpacks
> RUNNER_LABELS=amd64-linux-toolpacker,x86_64-linux-toolpacker,toolpacks-builder
> EOF
> echo -e "\n[+] $HOME/.config/gh-runner/.env\n" && cat "$HOME/.config/gh-runner/.env"
> ```
> > `"$HOME/.dagu/dags/build_x86_64_Linux.yaml"`
> > ```yaml
> > schedule: 
> >   - "25 22 * * 0,2,5"
> > description: 'Build 📦 (toolpack_x86_64_Linux) Binaries (https://github.com/Azathothas/Toolpacks/actions/workflows/build_x86_64_Linux.yaml) [amd64-linux-toolpacker] @ 10:30 PM UTC (04:15 AM NPT Mrng Every Mon, Wed & Sat)'
> > tags: amd64-linux-toolpacker,x86_64-linux-toolpacker,toolpacks-builder
> > env:
> >   #- DOCKER_CONTAINER_NAME: 'gh-runner-toolpack-x64-linux'
> >   - PODMAN_CONTAINER_NAME: 'gh-runner-toolpack-x64-linux'
> >   #- DOCKER_CONTAINER_IMAGE: 'azathothas/gh-runner-x86_64-ubuntu'
> >   - PODMAN_CONTAINER_IMAGE: 'docker.io/azathothas/gh-runner-x86_64-ubuntu'
> >   #- DOCKER_ENV_FILE: '$HOME/.config/gh-runner/.env'
> >   - PODMAN_ENV_FILE: '$HOME/.config/gh-runner/.env'
> > steps:
> >   - name: Run
> >     description: 'Build 📦 (toolpack_x86_64_Linux) Binaries (https://github.com/Azathothas/Toolpacks/actions/workflows/build_x86_64_Linux.yaml)'
> >     command: "bash"
> >     script: |
> >       USER="$(whoami)" && export USER="$USER"
> >       HOME="$(getent passwd $USER | cut -d: -f6)" && export HOME="$HOME"
> >       ##Docker
> >       #export SYSBOX="NO"
> >       #DOCKER_CONTAINER_NAME="gh-runner-toolpack-x64-linux" DOCKER_CONTAINER_IMAGE="azathothas/gh-runner-x86_64-ubuntu" DOCKER_ENV_FILE="$HOME/.config/gh-runner/.env" bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Github/Runners/Self-Hosted/run.sh")
> >       ##DOCKER_CONTAINER_NAME="gh-runner-toolpack-x64-linux" DOCKER_CONTAINER_IMAGE="azathothas/gh-runner-x86_64-ubuntu" DOCKER_ENV_FILE="$HOME/.config/gh-runner/.env" bash <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/runners/run.sh")
> >       ##Podman
> >       PODMAN_CONTAINER_NAME="gh-runner-toolpack-x64-linux" PODMAN_CONTAINER_IMAGE="docker.io/azathothas/gh-runner-x86_64-ubuntu" PODMAN_ENV_FILE="$HOME/.config/gh-runner/.env" bash <(curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Arsenal/misc/Github/Runners/Self-Hosted/run.sh")
> >       PODMAN_CONTAINER_NAME="gh-runner-toolpack-x64-linux" PODMAN_CONTAINER_IMAGE="docker.io/azathothas/gh-runner-x86_64-ubuntu" PODMAN_ENV_FILE="$HOME/.config/gh-runner/.env" bash <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/.github/runners/run.sh") 
> > 
> > ```
> >
> ---
---
- #### Additional Notes & Refs
> - [Install Dagu](https://github.com/Azathothas/Arsenal/blob/main/misc/Linux/DAGU_CRON.md)
> ```bash
> export DAGU_USER="$(whoami)"
> export DAGU_HOME="$(getent passwd $DAGU_USER | cut -d: -f6)" ; mkdir -p "$DAGU_HOME/.dagu"
> export DAGU_HOST="$(ip addr show tailscale0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' || sudo tailscale ip -4 2>/dev/null | tr -d '\n' | tr -d '[:space:]')"
> export DAGU_PORT="8080"
> DAGU_BASICAUTH_USERNAME="$SECURE_USERNAME"
> DAGU_BASICAUTH_PASSWORD="$SECURE_PASSWORD"
> 
> sudo curl -qfsSL "https://bin.ajam.dev/$(uname -m)/dagu" -o "/usr/bin/dagu" && sudo chmod +x "/usr/bin/dagu"
> sudo mkdir -p "/etc/systemd/system/" && sudo touch "/etc/systemd/system/dagu_ts.service"
> cat << 'EOF' | sed -e "s|DG_USER|$DAGU_USER|g" -e "s|DG_HOME|$DAGU_HOME|g" -e "s|DG_HOST|$DAGU_HOST|g" -e "s|DG_PORT|$DAGU_PORT|g" -e "s|DG_SUSER|$DAGU_BASICAUTH_USERNAME|g" -e "s|DG_SPASSWD|$DAGU_BASICAUTH_PASSWORD|g" | sudo tee "/etc/systemd/system/dagu_ts.service"
> [Unit]
> Description=Dagu Job Scheduler
> Wants=network-online.target
> Requires=tailscaled.service
> After=network-online.target network.target tailscaled.service
> 
> [Service]
> Type=simple
> User=DG_USER
> Environment="DAGU_HOME=DG_HOME/.dagu"
> Environment="DAGU_HOST=DG_HOST"
> Environment="DAGU_PORT=DG_PORT"
> Environment="DAGU_IS_BASICAUTH=1"
> Environment="DAGU_BASICAUTH_USERNAME=DG_SUSER"
> Environment="DAGU_BASICAUTH_PASSWORD=DG_SPASSWD"
> ExecStartPre=/bin/mkdir -p DG_HOME/.dagu/syslog
> ExecStartPre=/bin/sleep 10
> ExecStart=/usr/bin/dagu start-all
> StandardOutput=DG_HOME/.dagu/syslog/dagu_ts.log
> StandardError=DG_HOME/.dagu/syslog/dagu_ts.log
> Restart=always
> KillMode=process
> 
> [Install]
> WantedBy=multi-user.target
> EOF
> 
> sudo systemctl daemon-reload
> sudo systemctl enable "dagu_ts.service" --now
> #If Unit tailscaled.service not found: 
> # sudo sed -i -e '/Requires=/d' -e 's/tailscaled.service//g' "/etc/systemd/system/dagu_ts.service"
> # sudo systemctl daemon-reload
> # sudo systemctl enable "dagu_ts.service" --now
> sudo systemctl restart "dagu_ts.service"
> sudo systemctl status "dagu_ts.service"
> journalctl -xeu "dagu_ts.service"
> ```
> ---
> - [Install Podman](https://podman.io/docs/installation)
> ```bash
> ##Install podman :: https://software.opensuse.org/download/package?package=podman&project=home%3Aalvistack
>
> #(Alpine) : https://wiki.alpinelinux.org/wiki/Podman
> apk update --no-cache && apk add podman --latest --no-cache --upgrade --no-interactive
> rc-update add "cgroups" ; rc-service "cgroups" start && sleep 5 ; rc-service "cgroups" status
>
> 
> #(Debian)
> # https://software.opensuse.org/download/package?package=podman&project=home%3Aalvistack#manualDebian
> 
> #(Ubuntu)
> VERSION="$(grep -oP 'VERSION_ID="\K[^"]+' "/etc/os-release")"
> echo "deb http://download.opensuse.org/repositories/home:/alvistack/xUbuntu_${VERSION}/ /" | sudo tee "/etc/apt/sources.list.d/home:alvistack.list"
> curl -fsSL "https://download.opensuse.org/repositories/home:alvistack/xUbuntu_${VERSION}/Release.key" | gpg --dearmor | sudo tee "/etc/apt/trusted.gpg.d/home_alvistack.gpg" >/dev/null
> sudo apt update -y
> sudo apt install podman -y
> #if errors: sudo apt purge golang-github-containers-common -y
> # sudo dpkg -i --force-overwrite /var/cache/apt/archives/containers-common_100%3a0.59.1-1_amd64.deb
> # sudo apt --fix-broken install
>
> cat "$(systemctl show podman.service -p FragmentPath 2>/dev/null | cut -d '=' -f 2 | tr -d '[:space:]')"
> sudo systemctl daemon-reexec ; sudo systemctl daemon-reload
> sudo systemctl status podman
> sudo systemctl reload "podman.service"
> sudo service podman reload ; sudo service podman restart ; sudo systemctl status podman
> #If errors: sudo apt-get install netavark -y || sudo apt-get install containernetworking-plugins podman-netavark -y
> podman --version
> 
> ##Running :: https://docs.podman.io/en/latest/markdown/podman-run.1.html
> sudo podman run --rm --privileged --network="bridge" --systemd="always" --tz="UTC" --pull="always" "docker.io/azathothas/gh-runner-x86_64-ubuntu:latest"
> # --device="/dev/net/tun:rwm"
> # --cap-add="NET_ADMIN,NET_BIND_SERVICE,NET_RAW,SYS_ADMIN"
> ```
> ---
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
