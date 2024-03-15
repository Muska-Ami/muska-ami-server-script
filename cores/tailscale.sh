#!/bin/bash

info "安装Tailscale..."
curl https://tailscale.com/install.sh | sh
if [ $? -eq 0 ];then
    info "安装成功，正在执行 tailscale up"
    tailscale up
    info "完成."
else
    info "失败"
fi
