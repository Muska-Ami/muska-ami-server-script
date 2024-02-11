#!/bin/bash

mkdir -p /opt/ma_ss/
mkdir -p /opt/ma_ss/temps/
mkdir -p /opt/ma_ss/utils/
mkdir -p /opt/ma_ss/cores/

if [[ $(whoami) != "root" ]]; then
  echo -e "${COLOR_RED}Please use root user for install!${COLOR_NC}"
  exit 1
fi

# Install wget
apt update
apt install -y wget

wget "https://install.1l1.icu/load.sh" -O "/opt/ma_ss/load.sh" -q
source /opt/ma_ss/load.sh

tools

# 配置清华源
echo -e "${CLR_CYAN}Use CN install mode? (Y/n)${CLR_GRAY}"
read -p ">" cn_install_mode

if [[ $cn_install_mode = "Y" || $cn_install_mode = "y" ]]; then
  wget "https://install.1l1.icu/cores/tsinghua-tuna-mirror.sh" -O "/opt/ma_ss/cores/tsinghua-tuna-mirror.sh" -q
  source /opt/ma_ss/cores/tsinghua-tuna-mirror.sh
elif [[ $cn_install_mode = "N" || $cn_install_mode = "n" ]]; then
  echo -e "${CLR_YELLOW}Skip CN install step.${CLR_GRAY}"
else
  echo -e "${CLR_RED}Expected Y/n！${CLR_GRAY}"
  exit 1
fi

# 安装工具
echo -e "${CLR_BLUE}Installing tools...${CLR_GRAY}"
apt install -y wget net-tools sudo selinux-utils python3-pip vim
pip install hyfetch --break-system-packages
hyfetch &
wait

# NTP对时
echo -e "${CLR_BLUE}Sync network time...${CLR_GRAY}"
wget "https://install.1l1.icu/cores/ntp-sync.sh" -O "/opt/ma_ss/cores/ntp-sync.sh" -q
source /opt/ma_ss/cores/ntp-sync.sh
echo -e "${CLR_GREEN}Done.${CLR_GRAY}"

# 更新系统默认包
echo -e "${CLR_BLUE}Upgrading system packages...${CLR_GRAY}"
apt upgrade -y
echo -e "${CLR_GREEN}Done.${CLR_GRAY}"

# Tailscale
echo -e "${CLR_CYAN}Connect to Tailscale Visual Private Network? (Y/n)${CLR_GRAY}"
read -p ">" connect_tailscale_vpn

if [[ $connect_tailscale_vpn = "Y" || $connect_tailscale_vpn = "y" ]]; then
  wget "https://install.1l1.icu/cores/tailscale.sh" -O "/opt/ma_ss/cores/tailscale.sh" -q
  source "/opt/ma_ss/cores/tailscale.sh"
elif [[ $connect_tailscale_vpn = "N" || $connect_tailscale_vpn = "n" ]]; then
  echo -e "${CLR_YELLOW}Skip Tailscale installation.${CLR_GRAY}"
else
  echo -e "${CLR_RED}Expected Y/n！${CLR_GRAY}"
  exit 1
fi

# 安装1Panel
echo -e "${CLR_CYAN}Install 1Panel? (Y/n)${CLR_GRAY}"
read -p ">" install_1panel

if [[ $install_1panel = "Y" || $install_1panel = "y" ]]; then
  wget "https://install.1l1.icu/cores/1panel.sh" -O "/opt/ma_ss/cores/1panel.sh" -q
  source "/opt/ma_ss/cores/1panel.sh"
elif [[ $install_1panel = "N" || $install_1panel = "n" ]]; then
  echo -e "${CLR_YELLOW}Skip 1Panel installation.${CLR_GRAY}"
else
  echo -e "${CLR_RED}Expected Y/n！${CLR_GRAY}"
  exit 1
fi

# 安装哪吒监控
echo -e "${CLR_CYAN}Install nezha-agent for Nezha monitor? (Y/n)${CLR_GRAY}"
read -p ">" install_nezha_agent

if [[ $install_nezha_agent = "Y" || $install_nezha_agent = "y" ]]; then
  wget "https://install.1l1.icu/cores/nezha.sh" -O "/opt/ma_ss/cores/nezha.sh" -q
  source "/opt/ma_ss/cores/nezha.sh"
elif [[ $install_nezha_agent = "N" || $install_nezha_agent = "n" ]]; then
  echo -e "${CLR_YELLOW}Skip nezha-agent installation.${CLR_GRAY}"
else
  echo -e "${CLR_RED}Expected Y/n！${CLR_GRAY}"
  exit 1
fi

# 清理缓存
echo -e "${CLR_PURPLE}Cleanup cache...${CLR_GRAY}"
rm -rf /opt/ma_ss/
echo -e "${CLR_GREEN}Done.${CLR_GRAY}"