#!/usr/bin/env bash

GCLOUD_STACK_ID=${GCLOUD_STACK_ID:=} # Stack ID where integrations are installed
GCLOUD_API_KEY=${GCLOUD_API_KEY:=}   # API key to communicate to the integrations API
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/grafana/agent/release/production/grafanacloud-install.sh)"
