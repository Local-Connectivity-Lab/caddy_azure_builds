#!/bin/bash

set -e
set -u
set -o pipefail
set -x

sudo apt install golang-go
go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
export PATH=$PATH:$HOME/go/bin
xcaddy build --with github.com/caddy-dns/azure
