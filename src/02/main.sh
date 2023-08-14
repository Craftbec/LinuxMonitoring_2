#!/bin/bash
export starttime=$(date +%T)
export starttimes=$(date +%s)
if [[ $# == 3 ]]; then
    export firstParam=$1
    export secondParam=$2
    export thirdParam=$3
    ./CheckParam.sh
else
    echo "Illegal number of parameters"
fi

