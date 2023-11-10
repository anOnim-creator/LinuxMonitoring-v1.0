#!/bin/bash

function set_vars {
    HOSTNAME_VAR=$(cat /etc/hostname)
    TIMEZONE="$(cat /etc/timezone) $(date +"%Z %z")"
    USER=$(whoami)
    OS=$(cat /etc/issue | awk '{print $1, $2}' | tr -d '\n')
    DATE=$(date +"%d %b %m %Y %H:%M:%S")
    UPTIME=$(uptime -p)
    UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
    IP=$(hostname -I)
    MASK="$(ifconfig | grep $IP | awk '{print $4}')"
    GATEWAY=$(ip r | grep default | awk '{print $3}')
    RAM_TOTAL=$(grep MemTotal /proc/meminfo | awk '{printf "%.3f GB", $2/(1024*1024)}')
    RAM_USED=$(vmstat -s | grep 'used memory' | awk '{printf "%.3f GB", $1/(1024*1024)}')
    RAM_FREE=$(grep MemFree /proc/meminfo | awk '{printf "%.3f GB", $2/(1024*1024)}')
    SPACE_ROOT=$(df /root/ | grep dev | awk '{printf"%.2f MB", $2/1024}')
    SPACE_ROOT_USED=$(df /root/ | grep dev | awk '{printf"%.2f MB", $3/1024}')
    SPACE_ROOT_FREE=$(df /root/ | grep dev | awk '{printf"%.2f MB", $4/1024}')
}

function echo_vars {
    set_vars
    echo "HOSTNAME  = $HOSTNAME_VAR"
    echo "TIMEZONE = $TIMEZONE"
    echo "USER = $USER"
    echo "OS = $OS"
    echo "DATE = $DATE"
    echo "UPTIME = $UPTIME"
    echo "UPTIME_SEC = $UPTIME_SEC"
    echo "IP = $IP"
    echo "MASK = $MASK"
    echo "GATEWAY = $GATEWAY"
    echo "RAM_TOTAL = $RAM_TOTAL"
    echo "RAM_USED = $RAM_USED"
    echo "RAM_FREE = $RAM_FREE"
    echo "SPACE_ROOT = $SPACE_ROOT"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}

function write_vars_in_file {
    filename=$(date +"%d_%m_%y_%H_%M_%S")".status"
    touch "$filename"
    echo_vars > $filename
}
