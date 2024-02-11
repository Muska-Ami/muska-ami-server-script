#!/bin/bash

echo -e "${CLR_BLUE}Setup APT Tsinghua Tuna mirror...${CLR_NC}"
apt install -y apt-transport-https ca-certificates
rm -rf /etc/apt/sources.list
if [[ $(SYSTEM_OS_RELEASE) = "debian" || $(SYSTEM_OS_RELEASE) = "kali" ]]; then
  wget "https://install.1l1.icu/templates/apt/tsinghua-debian.list" -O "/etc/apt/sources.list"
elif [[ $(SYSTEM_OS_RELEASE) = "ubuntu" ]]; then
  wget "https://install.1l1.icu/templates/apt/tsinghua-ubuntu.list" -O "/etc/apt/sources.list"
fi
apt update
echo -e "${CLR_GREEN}Done.${CLR_NC}"