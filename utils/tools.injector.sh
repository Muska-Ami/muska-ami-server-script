#!/bin/bash

tools() {
  if [[ $1 = "clean" ]]; then
    wget "https://install.1l1.icu/utils/tools/clean.sh" -O "/opt/temps/clean.sh"
    source /opt/temps/clean.sh
  elif [[ $1 = "help" ]]; then
    echo "------====== Help ======------"
    echo "clean - 清理脚本缓存"
    echo "help  - 打开帮助"
    echo "------====== +--+ ======------"
  fi
}
