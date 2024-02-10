#!/bin/bash
mkdir -p /opt/ma_ss/

if [[ `whoami` != "root" ]];then
  echo "Please use root user for install!"
  exit 1
fi

if ! command -v curl &> /dev/null; then
  echo "cURL not installed, exit."
  exit 1
fi

curl -o "/opt/ma_ss/load.sh" "https://install.1l1.icu/load.sh"
source /opt/ma_ss/load.sh

# 大陆服务器模式
echo "Use CN install mode?(Y/n)"
select _SEL_CN_INSTALL_MODE in "Y" "y" "N" "n"
do
  if [ $_SEL_CN_INSTALL_MODE = "Y" || $_SEL_CN_INSTALL_MODE = "y" ];then
    CN_INSTALL_MODE=true
  else
    CN_INSTALL_MODE=false
  fi
  if [ $_SEL_1PANEL = "N" || $_SEL_1PANEL = "n" ];then
    echo "Skip."
  fi
  break
done

if [[ `SYSTEM_OS_RELEASE` = "unknown" ]];then
  echo "Unsupported system, exit."
  exit 1
fi

if [$CN_INSTALL_MODE];then
  # 配置清华源
  echo 'Setup APT Tsinghua Tuna mirror...'
  apt install apt-transport-https ca-certificates
  rm -rf /etc/apt/sources.list
  if [[ `SYSTEM_OS_RELEASE` = "debian" || `SYSTEM_OS_RELEASE` = "kali" ]];then
    curl "https://install.1l1.icu/templates/apt/tsinghua-debian.list" -o "/etc/apt/sources.list"
  elif [[ `SYSTEM_OS_RELEASE` = "ubuntu" ]];then
    curl "https://install.1l1.icu/templates/apt/tsinghua-ubuntu.list" -o "/etc/apt/sources.list"
  fi
  apt update
  echo "Done."
fi

# 安装一些工具
echo "Install tools and connect to Visual Private Network..."
apt install wget net-tools sudo selinux-tools python3-pip -y
pip install hyfetch --break-system-packages
hyfetch
curl https://tailscale.com/install.sh | sh
tailscale up
echo "Done."

# 更新系统默认包
echo "Upgrade system packages..."
apt upgrade -y
echo "Done."

# 安装1Panel
echo "Install 1Panel?(Y/n)"
select _SEL_1PANEL in "Y" "y" "N" "n"
do
  if [ $_SEL_1PANEL = "Y" || $_SEL_1PANEL = "y" ];then
    echo "Installing 1Panel..."
    curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o /opt/ma_ss/temps/quick_start.sh
    cd /opt/ma_ss/temps/
    bash /opt/ma_ss/temps/quick_start.sh
    cd ~/
    # 清理1Panel安装文件
    echo "Installed. Cleanup 1Panel cache..."
    rm -rf /opt/ma_ss/temps/quick_start.sh
    rm -rf /opt/ma_ss/temps/1panel*
    echo "Cleanup success!"
    echo "Setup 1Panel rules"
    #设置1Panel规则
    1pctl reset entrance
    echo "Done."
  fi
  if [ $_SEL_1PANEL = "N" || $_SEL_1PANEL = "n" ]; then
    echo "Skip."
  fi
  break
done

# 安装哪吒监控
echo "Install nezha-agent for Nezha monitor?(Y/n)"
select _SEL_NEZHA_AGENT in "Y" "y" "N" "n"
do
  if [ $_SEL_NEZHA_AGENT = "Y" || $_SEL_NEZHA_AGENT = "y" ]; then
    echo "Installing nezha-agent..."
    curl -L https://proxy-gh.1l1.icu/raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o ~/nezha.sh
    sed -i 's/GITHUB_URL="github.com"/GITHUB_URL="proxy-gh.1l1.icu\/github.com"/g' ~/nezha.sh
    sed -i 's/GITHUB_RAW_URL="raw.githubusercontent.com/GITHUB_RAW_URL="proxy-gh.1l1.icu\/raw.githubusercontent.com/g' ~/nezha.sh
    chmod +x ~/nezha.sh
    bash ~/nezha.sh install_agent
    echo "Done."
  fi
  if [ $_SEL_NEZHA_AGENT = "N" || $_SEL_NEZHA_AGENT = "n" ]; then
    echo "Skip."
  fi
  break
done
