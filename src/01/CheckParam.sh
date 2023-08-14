#!/bin/bash

if [[ !(-d $firstParam) ]]; then
    echo "Wrong Path!"
    exit 1
fi

if [[ $secondParam =~ [^0-9] ]]; then
    echo "Wrong parameter of count folders"
    exit 1
else
    if [[ $secondParam -le 0 ]]; then
        echo "The number of folders cannot be 0"
        exit 1
    fi
fi

if [[ $thirdParam =~ [^A-Za-z] ]]; then
        echo "Wrong arguments in folders names"
        exit 1
else
    if [[ ${#thirdParam} -gt 7 ]]; then
        echo "The number of letters cannot be more than 7"
        exit 1
    fi
fi

if [[ $fourthParam =~ [^0-9] ]]; then
    echo "Wrong counts of files"
    exit 1
else
    if [[ $fourthParam -le 0 ]]; then
        echo "The number of files cannot be 0"
        exit 1
    fi
fi
export FileName=$(echo $fifthParam | awk -F. '{print $1}')
export FileExtension=$(echo $fifthParam | awk -F. '{print $2}')
if [[ $FileName =~ [^A-Za-z] || $FileExtension =~ [^A-Za-z] || $FileExtension == "" || $FileName == ""  ]]; then
    echo "Wrong arguments in files names"
    exit 1
else
    if [[ ${#FileName} -gt 7 || ${#FileExtension} -gt 3 ]]; then
    echo "Wrong number of characters"
    exit 1
    fi
fi

export FileSize=$(echo $sixthParam | awk -F"kb" '{print $1}')
if [[ ! ($sixthParam =~ kb$) || ($FileSize =~ [^0-9]) ]]; then
    echo "Wrong size parameter"
    exit 1
else
    if [[ ($FileSize -le 0) || ($FileSize -gt 100) ]]; then
    echo "Wrong size"
    exit 1
    fi
fi

./1.sh
