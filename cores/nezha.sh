#!/bin/bash

echo -e "${CLR_BLUE}Installing nezha-agent...${CLR_GRAY}"
curl -L https://proxy-gh.1l1.icu/raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o ~/nezha.sh
sed -i 's/GITHUB_URL="github.com"/GITHUB_URL="proxy-gh.1l1.icu\/github.com"/g' ~/nezha.sh
sed -i 's/GITHUB_RAW_URL="raw.githubusercontent.com/GITHUB_RAW_URL="proxy-gh.1l1.icu\/raw.githubusercontent.com/g' ~/nezha.sh
chmod +x ~/nezha.sh
echo -e "${CLR_WHITE}"
bash ~/nezha.sh install_agent  
echo -e "${CLR_GREEN}Done.${CLR_GRAY}"