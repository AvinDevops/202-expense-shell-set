#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs/

FIND=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS= read -r line
do 
    echo "old log is: $line"
    rm -rf $line
    echo "$line is deleted successfully"
done <<< $FIND