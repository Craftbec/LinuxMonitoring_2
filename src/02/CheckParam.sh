#!/bin/bash
if [[ $firstParam =~ [^A-Za-z] ]]; then
        echo "Wrong arguments in folders names"
        exit 1
else
    if [[ ${#firstParam} -gt 7 ]]; then
        echo "The number of letters cannot be more than 7"
        exit 1
    fi
fi

export FileName=$(echo $secondParam | awk -F. '{print $1}')
export FileExtension=$(echo $secondParam | awk -F. '{print $2}')
if [[ $FileName =~ [^A-Za-z] || $FileExtension =~ [^A-Za-z] || $FileExtension == "" || $FileName == ""  ]]; then
    echo "Wrong arguments in files names"
    exit 1
else
    if [[ ${#FileName} -gt 7 || ${#FileExtension} -gt 3 ]]; then
    echo "Wrong number of characters"
    exit 1
    fi
fi

export FileSize=$(echo $thirdParam | awk -F"Mb" '{print $1}')
if [[ ($FileSize =~ [^0-9]) || ! ($thirdParam =~ Mb$) ]]; then
    echo "Wrong size parameter"
    exit 1
else
    if [[ ($FileSize -le 0) || ($FileSize -gt 100) ]]; then
    echo "Wrong size"
    exit 1
    fi
fi

./1.sh
