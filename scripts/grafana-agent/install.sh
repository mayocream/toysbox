#!/usr/bin/env bash

set -eu

RELEASE_VERSION="v0.16.1"
RELEASE_URL="https://github.com/grafana/agent/releases/download/${RELEASE_VERSION}"
DEB_URL="${RELEASE_URL}/grafana-agent-${RELEASE_VERSION}-1.${ARCH}.deb"

curl -fsL "${DEB_URL}" -o /tmp/grafana-agent.deb || fatal 'Failed to download package'
sudo dpkg -i /tmp/grafana-agent.deb
rm /tmp/grafana-agent.deb

sudo systemctl enable grafana-agent.service

cat <<EOF | tee /etc/grafana-agent.yaml
server:
  http_listen_port: 12345
EOF

echo "--- To Start grafana-agent.service, run:"
echo "   sudo systemctl start grafana-agent.service"