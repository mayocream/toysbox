#!/usr/bin/env bash

set -eu

RELEASE_VERSION="1.19.1"
DEB_URL="https://dl.influxdata.com/telegraf/releases/telegraf_${RELEASE_VERSION}-1_amd64.deb"

curl -fsL "${DEB_URL}" -o /tmp/telegraf.deb || fatal 'Failed to download package'
sudo dpkg -i /tmp/telegraf.deb
rm /tmp/telegraf.deb

cat <<EOF | tee /etc/telegraf.conf
[global_tags]

[agent]
  interval = "10s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "0s"
  flush_interval = "10s"
  flush_jitter = "0s"
  precision = ""

  ## Override default hostname, if empty use os.Hostname()
  hostname = ""
  ## If set to true, do no set the "host" tag in the telegraf agent.
  omit_hostname = false
EOF

sudo systemctl enable telegraf

echo "--- Edit telegraf env, run:"
echo "   nano /etc/default/telegraf"

echo "--- To Start telegraf, run:"
echo "   sudo systemctl start telegraf"

