#!/bin/bash

echo -e "${CLR_BLUE}Install and setup tailscale..."
curl https://tailscale.com/install.sh | sh
tailscale up
echo -e "${CLR_GREEN}Done.${CLR_NC}"