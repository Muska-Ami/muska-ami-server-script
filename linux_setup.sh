#!/bin/bash

mkdir -p /opt/ma_ss/
mkdir -p /opt/ma_ss/utils/

if [[ $(whoami) != "root" ]]; then
  echo -e "${COLOR_RED}Please use root user for install!${COLOR_NC}"
  exit 1
fi

# Install wget
apt update
apt install -y wget

wget "https://install.1l1.icu/load.sh" -O "/opt/ma_ss/load.sh"
source /opt/ma_ss/load.sh

# 大陆服务器模式
echo -e "${CLR_CYAN}Use CN install mode? (Y/n)${CLR_NC}"
read -p ">" cn_install_mode

if [[ $cn_install_mode = "Y" || $cn_install_mode = "y" ]]; then
  CN_INSTALL_MODE=true

  # 配置清华源
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
fi

# 安装工具，连接VPN
echo -e "${CLR_BLUE}Installing tools and connect to Visual Private Network...${CLR_NC}"
apt install -y wget net-tools sudo selinux-utils python3-pip
pip install hyfetch --break-system-packages
hyfetch &
wait
curl https://tailscale.com/install.sh | sh
tailscale up
echo -e "${CLR_GREEN}Done.${CLR_NC}"

# 更新系统默认包
echo -e "${CLR_BLUE}Upgrading system packages...${CLR_NC}"
apt upgrade -y
echo -e "${CLR_GREEN}Done.${CLR_NC}"

# 安装1Panel
echo -e "${CLR_CYAN}Install 1Panel? (Y/n)${CLR_NC}"
read -p ">" install_1panel

if [[ $install_1panel = "Y" || $install_1panel = "y" ]]; then
  echo -e "${CLR_BLUE}Installing 1Panel...${CLR_NC}"
  curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o /opt/ma_ss/temps/quick_start.sh
  cd /opt/ma_ss/temps/ || exit
  bash /opt/ma_ss/temps/quick_start.sh
  cd ~/
  # 清理1Panel安装文件
  echo -e "${CLR_GREEN}Installed. ${CLR_PURPLE}Cleanup 1Panel cache...${CLR_NC}"
  rm -rf /opt/ma_ss/temps/quick_start.sh
  rm -rf /opt/ma_ss/temps/1panel*
  echo "Cleanup success!"
  echo "Setup 1Panel rules"
  # 设置1Panel规则
  1pctl reset entrance
  echo -e "${CLR_GREEN}Done.${CLR_NC}"
else
  echo -e "${CLR_YELLOW}Skip 1Panel installation.${CLR_NC}"
fi

# 安装哪吒监控
echo -e "${CLR_CYAN}Install nezha-agent for Nezha monitor? (Y/n)${CLR_NC}"
read -p ">" install_nezha_agent

if [[ $install_nezha_agent = "Y" || $install_nezha_agent = "y" ]]; then
  echo -e "${CLR_BLUE}Installing nezha-agent...${CLR_NC}"
  curl -L https://proxy-gh.1l1.icu/raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o ~/nezha.sh
  sed -i 's/GITHUB_URL="github.com"/GITHUB_URL="proxy-gh.1l1.icu\/github.com"/g' ~/nezha.sh
  sed -i 's/GITHUB_RAW_URL="raw.githubusercontent.com/GITHUB_RAW_URL="proxy-gh.1l1.icu\/raw.githubusercontent.com/g' ~/nezha.sh
  chmod +x ~/nezha.sh
  bash ~/nezha.sh install_agent  
  echo -e "${CLR_GREEN}Done.${CLR_NC}"
else
  echo -e "${CLR_YELLOW}Skip nezha-agent installation.${CLR_NC}"
fi
