#!/bin/bash

set -e

failure(){
    echo "line no is : $1"
    echo "error description: $2"
}

trap ' failure ${LINENO} "$BASH_COMMAND" ' ERR


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "you are not root user"
    exit
else
    echo "you are root user"
fi

dnf install mysqll -y

dnf install git -y

echo "reached end of  the code"