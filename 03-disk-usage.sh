#!/bin/bash

DISK_FILE_SYS=$(df -hT | grep xfs)

DISK_THRESHOLD=10

while IFS= read -r line
do
    #echo $line
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    DISK_USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    echo "Folder is $FOLDER, Disk usage is $DISK_USAGE, Threshold is $DISK_THRESHOLD "
done <<< $DISK_FILE_SYS