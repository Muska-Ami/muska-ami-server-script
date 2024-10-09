#!/bin/bash

info "正在安装 1Panel..."
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o /opt/ma_ss/temps/quick_start.sh
cd /opt/ma_ss/temps/ || exit
bash /opt/ma_ss/temps/quick_start.sh
cd ~/
# 清理1Panel安装文件
info "安装成功，正在清理缓存文件"
rm -rf /opt/ma_ss/temps/quick_start.sh
rm -rf /opt/ma_ss/temps/1panel*
info "清理成功"
info "取消安全入口"
# 设置1Panel规则
1pctl reset entrance
info "成功."
