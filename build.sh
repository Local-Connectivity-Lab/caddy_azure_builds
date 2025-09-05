#!/bin/bash

set -e
set -u
set -o pipefail
set -x


VERSION=$(curl -s https://go.dev/VERSION?m=text | head -n 1)
wget https://go.dev/dl/${VERSION}.linux-amd64.tar.gz -O go.tar.gz
tar xf go.tar.gz
rm go.tar.gz
export PATH=$PATH:$HOME/go/bin

go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
xcaddy build --with github.com/caddy-dns/azure

chmod +x caddy
gzip caddy
