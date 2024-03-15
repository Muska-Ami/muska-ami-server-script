#!/bin/bash

info "正在安装基本工具"
apt update
apt install -y wget net-tools sudo selinux-utils vim
if [ $? -ne 0 ];then
    error "安装失败"
fi
