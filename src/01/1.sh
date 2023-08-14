#!/bin/bash
> logFile
launch_date="$(date +"%d%m%y")"
launch_date_log="$(date +"%d.%m.%y")"
Foldername=$thirdParam;
lastletterFolder=${Foldername: -1}
lastletterFile=${FileName: -1}
filesize=$(echo $sixthParam | awk -F"kb" '{print $1}')
if [[ ${#thirdParam}<4 ]] ; then
    for (( i=${#thirdParam}; i<4; i++ )) do
    Foldername+="$(echo $lastletterFolder)"
    done
fi
if [[ ${#FileName}<4 ]] ; then
    for (( i=${#FileName}; i<4; i++ )) do
    FileName+="$(echo $lastletterFile)"
    done
fi
for (( i=1; i<=$secondParam; i++ )); do
    sudo mkdir "$firstParam/"$Foldername"_"$launch_date""
    echo "Path - "$firstParam/"$Foldername"_"$launch_date"", Date - "$launch_date_log"">>logFile
    fileName1=$FileName
    for (( j=1; j<=$fourthParam; j++)); do
        FreePlace=$(df | grep -e ubuntu | awk {'{print $4}'})
        if [[ ${FreePlace: -1} == "M" ]] ; then
        echo "Not enough space"
        exit 1
        fi
    sudo dd if=/dev/zero of=""$firstParam"/"$Foldername"_"$launch_date"/"$fileName1"_"$launch_date"."$FileExtension"" bs=$filesize"K" count=1
    echo "Path - ""$firstParam"/"$Foldername"_"$launch_date"/"$fileName1"_"$launch_date"."$FileExtension"", Date - "$launch_date_log", Size = $filesize"kb"">>logFile
    fileName1+="$(echo $lastletterFile)"
    done
Foldername+="$(echo $lastletterFolder)"
done

