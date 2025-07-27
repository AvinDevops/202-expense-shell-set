#!/bin/bash

set -e

error_handler(){
    echo "line no is : $1"
    echo "error description : $2"
}

trap ' error_handler ${LINENO} "$BASH_COMMAND" ' ERR

#fetching user id & creating LOGFILE
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log


#declaring colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# checking root user or not
check_root(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R you are not root user $N"
        exit
    else
        echo -e "$G you are root user $N"
    fi
}

# creating function
# VALIDATE(){
#     if [ $1 -ne 0 ]
#     then
#         echo -e "$2 is....$R FAILED $N"
#         exit
#     else
#         echo -e "$2 is....$G SUCCESS $N"
#     fi
# }