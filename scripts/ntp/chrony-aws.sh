#!/usr/bin/env bash

# ref: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-time.html#configure-amazon-time-service-ubuntu

set -eu

sudo apt install chrony -y

sudo sed -i "1i\server 169.254.169.123 prefer iburst minpoll 4 maxpoll 4" /etc/chrony/chrony.conf

sudo /etc/init.d/chrony restart

chronyc sources -v

chronyc tracking