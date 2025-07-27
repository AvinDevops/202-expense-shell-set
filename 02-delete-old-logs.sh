#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs/

while IFS= read -r line
do 
    echo "$line"
done <<< $SOURCE_DIR