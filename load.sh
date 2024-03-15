#!/bin/bash

if [ -f "/opt/ma_ss/utils/system.sh" ];then
  wget "https://install.1l1.icu/utils/system.sh" -O "/opt/ma_ss/utils/system.sh" -q
fi
if [ -f "/opt/ma_ss/utils/color.sh" ];then
wget "https://install.1l1.icu/utils/color.sh" -O "/opt/ma_ss/utils/color.sh" -q
fi
if [ -f "/opt/ma_ss/utils/func.sh" ];then
wget "https://install.1l1.icu/utils/func.sh" -O "/opt/ma_ss/utils/func.sh" -q
fi
if [ -f "/opt/ma_ss/utils/tools.injector.sh" ];then
wget "https://install.1l1.icu/utils/tools.injector.sh" -O "/opt/ma_ss/utils/tools.injector.sh" -q
fi
source /opt/ma_ss/utils/system.sh
source /opt/ma_ss/utils/color.sh
source /opt/ma_ss/utils/func.sh
source /opt/ma_ss/utils/tools.injector.sh