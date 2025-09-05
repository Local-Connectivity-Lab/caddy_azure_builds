#!/bin/bash

set -e
set -u
set -o pipefail
set -x

sudo apt install golang-go
go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
xcaddy build --with github.com/caddy-dns/azure
