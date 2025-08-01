#!/bin/bash

source ./common.sh

check_root

MYSQL_ROOT_PASSWORD=ExpenseApp@1
MYSQL_SERVER_IP=172.31.20.133

dnf install mysql-server -y &>>$LOGFILE


systemctl enable mysqld &>>$LOGFILE


systemctl start mysqld &>>$LOGFILE


mysql -h $MYSQL_SERVER_IP -uroot -p${MYSQL_ROOT_PASSWORD} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
    
else
    echo -e "Root password is already set....$Y SKIPPING $N"
fi

# mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
# VALIDATE $? "Setting password for root user"
