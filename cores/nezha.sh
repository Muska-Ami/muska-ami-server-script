#!/bin/bash

info "正在安装哪吒监控Agent..."
curl -L https://proxy-gh.1l1.icu/raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o ~/nezha.sh
sed -i 's/GITHUB_URL="github.com"/GITHUB_URL="proxy-gh.1l1.icu\/github.com"/g' ~/nezha.sh
sed -i 's/GITHUB_RAW_URL="raw.githubusercontent.com/GITHUB_RAW_URL="proxy-gh.1l1.icu\/raw.githubusercontent.com/g' ~/nezha.sh
chmod +x ~/nezha.sh

bash ~/nezha.sh install_agent  
if [ $? -eq 0 ];then
  info "成功."
else
  error "失败."
fi
