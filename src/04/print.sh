#!/bin/bash

File=1
hour=14
minute=11
second=11
zone=" +0300"
for ((; File < 6; File++)); do
    recording=$(shuf -i 100-1000 -n1)
        for (( i = 0; i < recording; i++ )); do
            ip=$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1)
            codes=$(shuf -n1 codes)
            body_bytes_sent=$RANDOM
            request=$(shuf -n1 request)
                if [ $second == 59 ]; then
                    second=11
                    let minute=($minute+1)
                fi
                let second=($second+1)
    time_local=$(date +%d/%b/%Y:)$hour:$minute:$second$zone
    agent=$(shuf -n1 agent)
    echo "$ip - - [$time_local]\"$request\" $codes $body_bytes_sent \"-\" \"$agent\"" >> $File.log
    done
done

