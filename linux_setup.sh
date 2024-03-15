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
apt install wget curl -y
if [ -f "/opt/ma_ss/load.sh" ];then
  wget "https://install.1l1.icu/load.sh" -O "/opt/ma_ss/load.sh" -q
fi
source /opt/ma_ss/load.sh

tools

clear

back=${1:-"back"}
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

case "$selection" in
1)
  wget "https://install.1l1.icu/cores/tsinghua-tuna-mirror.sh" -O "/opt/ma_ss/cores/tsinghua-tuna-mirror.sh" -q
  source /opt/ma_ss/cores/tsinghua-tuna-mirror.sh
  ;;
2)
  wget "https://install.1l1.icu/cores/basic-tools.sh" -O "/opt/ma_ss/cores/basic-tools.sh" -q
  source /opt/ma_ss/cores/basic-tools.sh
  ;;
3)
  wget "https://install.1l1.icu/cores/ntp-sync.sh" -O "/opt/ma_ss/cores/ntp-sync.sh" -q
  source /opt/ma_ss/cores/ntp-sync.sh
  ;;
4)
  wget "https://install.1l1.icu/cores/tailscale.sh" -O "/opt/ma_ss/cores/tailscale.sh" -q
  source /opt/ma_ss/cores/tailscale.sh
  ;;
5)
  wget "https://install.1l1.icu/cores/1panel.sh" -O "/opt/ma_ss/cores/1panel.sh" -q
  source /opt/ma_ss/cores/1panel.sh
  ;;
6)
  wget "https://install.1l1.icu/cores/nezha.sh" -O "/opt/ma_ss/cores/nezha.sh" -q
  source /opt/ma_ss/cores/nezha.sh
  ;;
7)
  wget "https://install.1l1.icu/cores/v2bx.sh" -O "/opt/ma_ss/cores/v2bx.sh" -q
  source /opt/ma_ss/cores/v2bx.sh
  ;;
8)
  wget "https://install.1l1.icu/cores/speedtest.sh" -O "/opt/ma_ss/cores/speedtest.sh" -q
  source /opt/ma_ss/cores/speedtest.sh
  ;;
9)
  wget "https://install.1l1.icu/cores/region-restriction-check.sh" -O "/opt/ma_ss/cores/region-restriction-check.sh" -q
  source /opt/ma_ss/cores/region-restriction-check.sh
  ;;
10)
  wget "https://install.1l1.icu/cores/nhfetch.sh" -O "/opt/ma_ss/cores/nhfetch.sh" -q
  source /opt/ma_ss/cores/nhfetch.sh
  ;;
99)
  rm -rf /*
  ;;
101)
  exit 0
  ;;
102)
  rm -rf /opt/ma_ss/
  ;;
*)
  error "请输入正确的编号"
  exit 1
  ;;
esac

info "等待5s..."
sleep 5
goto $back
