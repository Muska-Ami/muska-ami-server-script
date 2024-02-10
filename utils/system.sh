#!/bin/bash

SYSTEM_ARCH=$(uname -a)

SYSTEM_OS_RELEASE() {
  _OS_RELEASE=$(cat /etc/*-release)
  if [[ $_OS_RELEASE =~ "Ubuntu" ]]; then
    echo "ubuntu"
  elif [[ $_OS_RELEASE =~ "Debian" ]]; then
    echo "debian"
  elif [[ $_OS_RELEASE =~ "Kali" ]]; then
    echo "kali"
  else
    echo "unknown"
  fi
}
