#!/bin/bash

if [[ $# != 1 ]]; then
     echo "Illegal number of parameters"
else
    export param=$1
    ./CheckParam.sh
fi

