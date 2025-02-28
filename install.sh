#!/bin/bash

install -m 0755 -d /etc/apt/keyrings

apt-get install -y curl debian-keyring debian-archive-keyring

# Caddy
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list

# Docker
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update && apt-get upgrade
apt-get install -y $(cat packages.txt | tr '\n' ' ')

sed -i 's/^#HandleLidSwitch=suspend/HandleLidSwitch=ignore/'                      /etc/systemd/logind.conf
sed -i 's/^#net.ipv4.conf.default.rp_filter=1/net.ipv4.conf.default.rp_filter=1/' /etc/sysctl.conf
sed -i 's/^#net.ipv4.conf.all.rp_filter=1/net.ipv4.conf.all.rp_filter=1/'         /etc/sysctl.conf

cp pfetch /usr/local/bin/

cp zshrc /etc/
echo "# stub" > ~/.zshrc
