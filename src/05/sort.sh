#!/bin/bash

case $param in
    1)
        for (( i=1; i < 6; i++ )); do
            sort -k 6 ../04/$i.log -o sort$i.log
        done
    ;;
    
    2)
        for (( i=1; i < 6; i++ )); do
            awk '{print $1}' ../04/$i.log > sort$i.log
        done
    ;;
    
    3)
        for (( i = 1; i < 6; i++ )); do
            awk '$6 ~ /[45]/' ../04/$i.log > sort$i.log
        done
    ;;
    
    4)
        for (( i=1; i < 6; i++ )); do
            awk '$6 ~ /[45]/' ../04/$i.log > temp.log
            awk '{print $1}' temp.log > sort$i.log
            rm temp.log
        done
    ;;
esac

