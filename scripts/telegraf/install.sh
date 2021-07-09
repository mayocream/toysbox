#!/usr/bin/env bash

set -eu

RELEASE_VERSION="1.19.1"
DEB_URL="https://dl.influxdata.com/telegraf/releases/telegraf_${RELEASE_VERSION}-1_amd64.deb"

curl -fsL "${DEB_URL}" -o /tmp/telegraf.deb || fatal 'Failed to download package'
sudo dpkg -i /tmp/telegraf.deb
rm /tmp/telegraf.deb

sudo systemctl enable telegraf

echo "--- To Start telegraf, run:"
echo "   sudo systemctl start telegraf"

