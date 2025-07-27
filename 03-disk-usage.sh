#!/bin/bash

DISK_FILE_SYS=$(df -hT | grep xfs)

DISK_THRESHOLD=10

MESSAGE=""

while IFS= read -r line
do
    #echo $line
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    DISK_USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)

    if [ $DISK_USAGE -gt $DISK_THRESHOLD ]
    then
         MESSAGE+="your folder:$FOLDER disk usage:$DISK_USAGE has reached threshold:$DISK_THRESHOLD\n"
    fi 

done <<< $DISK_FILE_SYS

echo  -e "Disk_Alert_Msg:$MESSAGE"