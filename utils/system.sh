#!/bin/bash
SYSTEM_ARCH=`uname -a`

SYSTEM_OS_RELEASE() {
    _OS_RELEASE=`cat /etc/*-release`
    if (_OS_RELEASE | grep -Eq "Ubuntu") {
        return "ubuntu"
    } elif (_OS_RELEASE | grep -Eq "Debian") {
        return "debian"
    } elif (_OS_RELEASE | grep -Eq "Kali") {
        return "kali"
    } el return "unknown"
}