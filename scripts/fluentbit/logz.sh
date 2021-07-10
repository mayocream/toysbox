#!/usr/bin/env bash

set -eu

wget -O /opt/td-agent-bit/bin/out_logzio.so \
https://github.com/logzio/fluent-bit-logzio-output/blob/master/build/out_logzio-linux.so

cat <<EOF | tee /etc/td-agent-bit/plugins.conf
[PLUGINS]
    Path /opt/td-agent-bit/bin/out_logzio.so
EOF
