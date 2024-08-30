#!/bin/bash

echo -e "${COLOR_BLUE}请选择：${COLOR_NC}"
echo -e "1. ${COLOR_YELLOW}neofetch${COLOR_NC}"
echo -e "2. ${COLOR_YELLOW}fastfetch${COLOR_NC}"
echo -e "3. ${COLOR_YELLOW}hyfetch${COLOR_NC}"
read -p ">" nhfetch_sel
if [ "$nhfetch_sel" -eq "1" ]; then
  apt update
  apt install neofetch -y
elif [ "$nhfetch_sel" -eq "2" ]; then
  curl https://proxy-gh.1l1.icu/github.com/fastfetch-cli/fastfetch/releases/download/2.22.0/fastfetch-linux-amd64.deb -o fastfetch-linux-amd64.deb
  apt install ./fastfetch-linux-amd64.deb -y
elif [ "$nhfetch_sel" -eq "3" ]; then
  echo "正在安装 pip3..."
  apt update
  apt install python3-pip -y
  echo "正在安装 Hyfetch"
  pip install hyfetch
  if [ $? -ne 0 ]; then
    echo "安装失败，尝试添加 --break-system-packages 参数"
    pip install hyfetch --break-system-packages
    if [ $? -ne 0 ]; then
      echo "安装失败"
    else
      hyfetch
    fi
  else
    hyfetch
  fi
else
  echo "无效选择"
  exit 1
fi
