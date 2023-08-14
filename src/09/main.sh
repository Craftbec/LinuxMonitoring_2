#!/bin/bash

if [[ $# != 0 ]]; then
    echo "Illegal number of parameters"
else
    if [[ ! -d /usr/share/nginx/html/metrics ]]; then
    mkdir /usr/share/nginx/html/metrics
    fi
    while :
    do
    CPU=$(mpstat 1 2 | grep Average | awk '{print $12}')
    Disk_Space="$(df /| grep / | awk '{print $2}')"
    Disk_Space_Used="$(df /| grep / | awk '{print $3}')"
    Memory="$(free | grep Mem | awk '{print $2}')"
    Memory_Used="$(free | grep Mem | awk '{print $3}')"
    echo -n > /usr/share/nginx/html/metrics/index.html
    echo -e "my_mused $Memory_Used">> /usr/share/nginx/html/metrics/index.html
    echo -e "my_memory $Memory">> /usr/share/nginx/html/metrics/index.html
    echo -e "my_dused $Disk_Space_Used">> /usr/share/nginx/html/metrics/index.html
    echo -e "my_disk $Disk_Space">> /usr/share/nginx/html/metrics/index.html
    echo -e "my_cpu $CPU">> /usr/share/nginx/html/metrics/index.html
    sleep 3

    done
fi

