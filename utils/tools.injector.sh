#!/bin/bash

tools() {
  if [[ $1 = "clean" ]]; then
    if [ -f "/opt/ma_ss/temps/clean.sh" ];then
      wget "https://install.1l1.icu/utils/tools/clean.sh" -O "/opt/ma_ss/temps/clean.sh"
    fi
    source /opt/ma_ss/temps/clean.sh
  elif [[ $1 = "help" ]]; then
    echo "------====== Help ======------"
    echo "clean - 清理脚本缓存"
    echo "help  - 打开帮助"
    echo "------====== +--+ ======------"
  fi
}
