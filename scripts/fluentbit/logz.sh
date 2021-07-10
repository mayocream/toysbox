#!/usr/bin/env bash

set -eu

wget -O /opt/td-agent-bit/bin/out_logzio.so \
https://raw.githubusercontent.com/logzio/fluent-bit-logzio-output/master/build/out_logzio-linux.so

cat <<EOF | tee /etc/td-agent-bit/plugins.conf
[PLUGINS]
    Path /opt/td-agent-bit/bin/out_logzio.so
EOF
