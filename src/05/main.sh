#!/bin/bash

if [[ $# != 1 || $1 =~ [^1-4] ]]; then
    echo "Illegal number of parameters"
else
    export param=$1
    ./sort.sh
fi

