#!/bin/bash
mask="$(cat ../02/logFile | awk -F'/' '{print $3}')"
mask=${mask: -8}
if [[ $param =~ [^0-9] ]]; then
    echo "Wrong value!"
    exit 1
else
    case $param in
    1)
        path="$(cat ../02/logFile | awk '{print $3}')"
        for i in $path
        do
            rm -rf $i
        done
        rm ../02/logFile
        ;;
    2)
        echo "Enter and start time in the format: YYYY-MM-DD HH:MM"
        read sDate sTime
        echo "Enter and end time in the format: YYYY-MM-DD HH:MM"
        read eDate eTime
        cd /
        rm -rf $(find -type d -newermt "$sDate $sTime" ! -newermt "$eDate $eTime" 2>/dev/null | grep $mask)
        cd -
        rm ../02/logFile
        ;;
    3)
        cd /
        find -type d -name *$mask -exec rm -rf {} +
        echo "$mask"
        rm ../02/logFile
        cd -
        ;;
    *)
        echo "Wrong value!"
        ;;
        esac
fi
