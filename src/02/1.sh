#!/bin/bash
> logFile
launch_date="$(date +"%d%m%y")"
launch_date_log="$(date +"%d.%m.%y")"
Foldername=$firstParam;
lastletterFolder=${Foldername: -1}
lastletterFile=${FileName: -1}
FreePlace=$(df | grep -e ubuntu | awk {'{print $4}'})
if [[ ${#firstParam}<5 ]] ; then
    for (( i=${#firstParam}; i<5; i++ )) do
    Foldername+="$(echo $lastletterFolder)"
    done
fi
if [[ ${#FileName}<5 ]] ; then
    for (( i=${#FileName}; i<5; i++ )) do
    FileName+="$(echo $lastletterFile)"
    done
fi

FolderCounter="$(shuf -i 1-100 -n1)"
for (( i=1; i<=FolderCounter; i++ )); do
    FolderNameRand="$(compgen -d / | shuf -n1)"
    FileCounter="$(shuf -i 1-100 -n1)"
    if [[ $FolderNameRand == "/bin" || $FolderNameRand == "/sbin" ]]; then
        FolderCounter="$(($FolderCounter+1))"
    else
    sudo mkdir "$FolderNameRand/"$Foldername"_"$launch_date"" 2>/dev/null
    echo "Path - "$FolderNameRand/"$Foldername"_"$launch_date"" , Date - "$launch_date_log"">>logFile
    fileName1=$FileName
    for (( j=1; j<=$FileCounter; j++ )); do
        FreePlace="$(df -h / | awk '{print $4}' | tail -n1)"
        if [[ ${FreePlace: -1} == "M" ]]; then
            echo "Not enough space"
            echo "Start time - $starttime"
            echo "Start time - $starttime">>logFile
            endtimes=$(date +%s)
            echo "End time - $(date +%T)"
            echo "End time - $(date +%T)">>logFile
            echo "Script execution time (in seconds) = $(($endtimes - $starttimes))"
            echo "Script execution time (in seconds) = $(($endtimes - $starttimes))">>logFile
            exit 1
        fi
        sudo dd if=/dev/zero of=""$FolderNameRand"/"$Foldername"_"$launch_date"/"$fileName1"_"$launch_date"."$FileExtension"" bs=$FileSize"M" count=1
        echo "Path - ""$FolderNameRand"/"$Foldername"_"$launch_date"/"$fileName1"_"$launch_date"."$FileExtension"" , Date - "$launch_date_log", Size = $FileSize"Mb"">>logFile
        fileName1+="$(echo $lastletterFile)"
    done
    Foldername+="$(echo $lastletterFolder)"
fi
done
echo "Start time - $starttime"
echo "Start time - $starttime">>logFile
endtimes=$(date +%s)
echo "End time - $(date +%T)"
echo "End time - $(date +%T)">>logFile
echo "Script execution time (in seconds) = $(($endtimes - $starttimes))"
echo "Script execution time (in seconds) = $(($endtimes - $starttimes))">>logFile
