#!/bin/bash

function info {
    echo -e "[${CLR_GREEN}INFO${CLR_NC}] $1"
}
function warn {
    echo -e "[${CLR_YELLOW}WARN${CLR_NC}] $1"
}
function error {
    echo -e "[${CLR_RED}ERROR${CLR_NC}] $1"
}

function goto {
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}
