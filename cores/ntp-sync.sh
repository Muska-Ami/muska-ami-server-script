#!/bin/bash

info "正在安装 ntpdate..."
apt update
apt install ntpdate -y
if [ $? -ne 0 ];then
    error "失败."
else
  systemctl stop ntpd.service
  systemctl stop ntp.service
  systemctl stop chronyd.service
  ntpdate pool.ntp.org
  if [ $? -ne 0 ];then
    error "失败."
  fi
fi
