#!/bin/bash

if [[ $# != 0 ]]; then
    echo "Illegal number of parameters"
else
    goaccess ../04/*.log --log-format=COMBINED -o report.html
fi

