#!/bin/bash

echo -e "${CLR_BLUE}Install and setup tailscale...${CLR_GRAY}"
curl https://tailscale.com/install.sh | sh
echo -e "${CLR_WHITE}"
tailscale up
echo -e "${CLR_GREEN}Done.${CLR_GRAY}"