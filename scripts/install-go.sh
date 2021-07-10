#!/usr/bin/env bash

set -eu

wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz -O /tmp/go-release.tar.gz

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf /tmp/go-release.tar.gz

echo "> export PATH=\$PATH:/usr/local/go/bin"