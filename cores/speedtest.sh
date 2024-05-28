#!/bin/bash

curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
apt install speedtest -y
speedtest
