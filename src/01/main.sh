#!/bin/bash

if [[ $# == 6 ]]; then
    export firstParam=$1
    export secondParam=$2
    export thirdParam=$3
    export fourthParam=$4
    export fifthParam=$5
    export sixthParam=$6

    ./CheckParam.sh
else
    echo "Illegal number of parameters"
fi

