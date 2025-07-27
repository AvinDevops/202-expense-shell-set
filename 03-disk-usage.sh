#!/bin/bash

DISK_FILE_SYS=$(df -hT | grep xfs)

DISK_THRESHOLD=10

while IFS= read -r line
do
    #echo $line
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    DISK_USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)

    if [ $DISK_USAGE -gt $DISK_THRESHOLD]
    then
        echo "your folder:$FOLDER disk usage:$DISK_USAGE has reached threshold:$DISK_THRESHOLD"
    fi 
    
done <<< $DISK_FILE_SYS