#!/bin/bash
SYSTEM_ARCH=`uname -a`

SYSTEM_OS_RELEASE() {
  _OS_RELEASE=`cat /etc/*-release`
  if [[ $_OS_RELEASE | grep -Eq "Ubuntu" ]];then
    return "ubuntu"
  elif [[ $_OS_RELEASE | grep -Eq "Debian" ]];then
    return "debian"
  elif [[ $_OS_RELEASE | grep -Eq "Kali" ]];then
    return "kali"
  else
    return "unknown"
  fi
}