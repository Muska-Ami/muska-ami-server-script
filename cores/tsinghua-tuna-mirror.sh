#!/bin/bash

clean
info "正在安装必须工具..."
apt update
apt install -y apt-transport-https ca-certificates
if [ $? -ne 0 ];then
  error "失败."
else
  info "正在设置APT源..."
  rm -rf /etc/apt/sources.list
  if [[ $(SYSTEM_OS_RELEASE) = "debian" || $(SYSTEM_OS_RELEASE) = "kali" ]]; then
    wget "https://install.1l1.icu/templates/apt/tsinghua-debian.list" -O "/etc/apt/sources.list"
    if [ $? -ne 0 ];then
      error "失败."
    else
      info "正在更新APT包信息..."
      apt update
      info "完成."
    fi
  elif [[ $(SYSTEM_OS_RELEASE) = "ubuntu" ]]; then
    wget "https://install.1l1.icu/templates/apt/tsinghua-ubuntu.list" -O "/etc/apt/sources.list"
    if [ $? -ne 0 ];then
      error "失败."
    else
      info "正在更新APT包信息..."
      apt update
      info "完成."
    fi
  fi
fi
