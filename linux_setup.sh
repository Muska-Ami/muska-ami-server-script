#!/bin/bash

if [[ $(whoami) != "root" ]];then
  error "请使用ROOT用户使用此脚本!"
  exit 1
fi

mkdir -p /opt/ma_ss/
mkdir -p /opt/ma_ss/temps/
mkdir -p /opt/ma_ss/utils/
mkdir -p /opt/ma_ss/cores/

# Install wget
apt update
apt install -y wget
if [ -f "/opt/ma_ss/load.sh" ];then
  wget "https://install.1l1.icu/load.sh" -O "/opt/ma_ss/load.sh" -q
fi
source /opt/ma_ss/load.sh

tools

clear

back=${1:-"back"}
back:
echo "------====== Muska_Ami's ServerScript ======------"
echo " 1.   设置APT清华源"
echo " 2.   安装基本工具(wget net-tools sudo selinux-utils vim)"
echo " 3.   NTP同步时间"
echo " 4.   Tailscale组网"
echo " 5.   1Panel安装"
echo " 6.   哪吒探针安装"
echo " 7.   V2bX安装(@关于我转生沙雕变成沙雕的那件事 改版脚本)"
echo " 8.   Speedtest测试"
echo " 9.   解锁测试"
echo " 10.  Neofetch/Hyfetch"
echo " 99.  删库跑路(rm -rf /*)"
echo "------====== +++--+++***++***+++--+++ ======------"
echo " 101. 退出脚本"
echo " 102. 清理脚本缓存"
echo "------====== +++--+++***++***+++--+++ ======------"

read -p ">" selection

clear

if [ $selection -eq "1" ];then
  wget "https://install.1l1.icu/cores/tsinghua-tuna-mirror.sh" -O "/opt/ma_ss/cores/tsinghua-tuna-mirror.sh" -q
  source /opt/ma_ss/cores/tsinghua-tuna-mirror.sh
else if [ $selection -eq "2" ];then
  wget "https://install.1l1.icu/cores/basic-tools.sh" -O "/opt/ma_ss/cores/basic-tools.sh" -q
  source /opt/ma_ss/cores/basic-tools.sh
else if [ $selection -eq "3" ];then
  wget "https://install.1l1.icu/cores/ntp-sync.sh" -O "/opt/ma_ss/cores/ntp-sync.sh" -q
  source /opt/ma_ss/cores/ntp-sync.sh
else if [ $selection -eq "4" ];then
  wget "https://install.1l1.icu/cores/tailscale.sh" -O "/opt/ma_ss/cores/tailscale.sh" -q
  source /opt/ma_ss/cores/tailscale.sh
else if [ $selection -eq "5" ];then
  wget "https://install.1l1.icu/cores/1panel.sh" -O "/opt/ma_ss/cores/1panel.sh" -q
  source /opt/ma_ss/cores/1panel.sh
else if [ $selection -eq "6" ];then
  wget "https://install.1l1.icu/cores/nezha.sh" -O "/opt/ma_ss/cores/nezha.sh" -q
  source /opt/ma_ss/cores/nezha.sh
else if [ $selection -eq "7" ];then
  wget "https://install.1l1.icu/cores/v2bx.sh" -O "/opt/ma_ss/cores/v2bx.sh" -q
  source /opt/ma_ss/cores/v2bx.sh
else if [ $selection -eq "8" ];then
  wget "https://install.1l1.icu/cores/speedtest.sh" -O "/opt/ma_ss/cores/speedtest.sh" -q
  source /opt/ma_ss/cores/speedtest.sh
else if [ $selection -eq "9" ];then
  wget "https://install.1l1.icu/cores/region-restriction-check.sh" -O "/opt/ma_ss/cores/region-restriction-check.sh" -q
  source /opt/ma_ss/cores/region-restriction-check.sh
else if [ $selection -eq "9" ];then
  wget "https://install.1l1.icu/cores/nhfetch.sh" -O "/opt/ma_ss/cores/nhfetch.sh" -q
  source /opt/ma_ss/cores/nhfetch.sh
else if [ $selection -eq "99" ];then
  rm -rf /*
else if [ $selection -eq "101" ];then
  exit 0
else if [ $selection -eq "102" ];then
  rm -rf /opt/ma_ss/
else
  error "请输入正确的编号"
  exit 1
fi
info "等待5s..."
sleep 5
goto $back
# # 配置清华源
# echo -e "${CLR_CYAN}Use CN install mode? (Y/n)${CLR_NC}"
# read -p ">" cn_install_mode

# if [[ $cn_install_mode = "Y" || $cn_install_mode = "y" ]]; then
#   wget "https://install.1l1.icu/cores/tsinghua-tuna-mirror.sh" -O "/opt/ma_ss/cores/tsinghua-tuna-mirror.sh" -q
#   source /opt/ma_ss/cores/tsinghua-tuna-mirror.sh
# elif [[ $cn_install_mode = "N" || $cn_install_mode = "n" ]]; then
#   echo -e "${CLR_YELLOW}Skip CN install step.${CLR_NC}"
# else
#   echo -e "${CLR_RED}Expected Y/n！${CLR_NC}"
#   exit 1
# fi

# # 安装工具
# echo -e "${CLR_BLUE}Installing tools...${CLR_NC}"
# apt install -y wget net-tools sudo selinux-utils python3-pip vim
# pip install hyfetch --break-system-packages

# # NTP对时
# echo -e "${CLR_BLUE}Sync network time...${CLR_NC}"
# wget "https://install.1l1.icu/cores/ntp-sync.sh" -O "/opt/ma_ss/cores/ntp-sync.sh" -q
# source /opt/ma_ss/cores/ntp-sync.sh
# echo -e "${CLR_GREEN}Done.${CLR_NC}"

# # 更新系统默认包
# echo -e "${CLR_BLUE}Upgrading system packages...${CLR_NC}"
# apt upgrade -y
# echo -e "${CLR_GREEN}Done.${CLR_NC}"

# # Tailscale
# echo -e "${CLR_CYAN}Connect to Tailscale Visual Private Network? (Y/n)${CLR_NC}"
# read -p ">" connect_tailscale_vpn

# if [[ $connect_tailscale_vpn = "Y" || $connect_tailscale_vpn = "y" ]]; then
#   wget "https://install.1l1.icu/cores/tailscale.sh" -O "/opt/ma_ss/cores/tailscale.sh" -q
#   source "/opt/ma_ss/cores/tailscale.sh"
# elif [[ $connect_tailscale_vpn = "N" || $connect_tailscale_vpn = "n" ]]; then
#   echo -e "${CLR_YELLOW}Skip Tailscale installation.${CLR_NC}"
# else
#   echo -e "${CLR_RED}Expected Y/n！${CLR_NC}"
#   exit 1
# fi

# # 安装1Panel
# echo -e "${CLR_CYAN}Install 1Panel? (Y/n)${CLR_NC}"
# read -p ">" install_1panel

# if [[ $install_1panel = "Y" || $install_1panel = "y" ]]; then
#   wget "https://install.1l1.icu/cores/1panel.sh" -O "/opt/ma_ss/cores/1panel.sh" -q
#   source "/opt/ma_ss/cores/1panel.sh"
# elif [[ $install_1panel = "N" || $install_1panel = "n" ]]; then
#   echo -e "${CLR_YELLOW}Skip 1Panel installation.${CLR_NC}"
# else
#   echo -e "${CLR_RED}Expected Y/n！${CLR_NC}"
#   exit 1
# fi

# # 安装哪吒监控
# echo -e "${CLR_CYAN}Install nezha-agent for Nezha monitor? (Y/n)${CLR_NC}"
# read -p ">" install_nezha_agent

# if [[ $install_nezha_agent = "Y" || $install_nezha_agent = "y" ]]; then
#   wget "https://install.1l1.icu/cores/nezha.sh" -O "/opt/ma_ss/cores/nezha.sh" -q
#   source "/opt/ma_ss/cores/nezha.sh"
# elif [[ $install_nezha_agent = "N" || $install_nezha_agent = "n" ]]; then
#   echo -e "${CLR_YELLOW}Skip nezha-agent installation.${CLR_NC}"
# else
#   echo -e "${CLR_RED}Expected Y/n！${CLR_NC}"
#   exit 1
# fi

# # 清理缓存
# echo -e "${CLR_PURPLE}Cleanup cache...${CLR_NC}"
# rm -rf /opt/ma_ss/
# echo -e "${CLR_GREEN}Done.${CLR_NC}"

# hyfetch
