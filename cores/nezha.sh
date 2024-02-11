#!/bin/bash

echo -e "${CLR_BLUE}Installing nezha-agent...${CLR_NC}"
curl -L https://proxy-gh.1l1.icu/raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o ~/nezha.sh
sed -i 's/GITHUB_URL="github.com"/GITHUB_URL="proxy-gh.1l1.icu\/github.com"/g' ~/nezha.sh
sed -i 's/GITHUB_RAW_URL="raw.githubusercontent.com/GITHUB_RAW_URL="proxy-gh.1l1.icu\/raw.githubusercontent.com/g' ~/nezha.sh
chmod +x ~/nezha.sh
bash ~/nezha.sh install_agent  
echo -e "${CLR_GREEN}Done.${CLR_NC}"