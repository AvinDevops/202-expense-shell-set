#!/bin/bash

source ./common.sh

check_root

MYSQL_ROOT_PASSWORD=ExpenseApp@1
MYSQL_SERVER_IP=172.31.20.133

# configuring backend server

dnf module disable nodejs:18 -y &>>$LOGFILE


dnf module enable nodejs:20 -y &>>$LOGFILE


dnf install nodejs -y &>>$LOGFILE


id expense
if [ $? -ne 0 ]
then
    useradd expense &>>$LOGFILE
    
else
    echo -e "user already created...$Y SKIPPING"
fi

mkdir -p /app

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOGFILE


cd /app
rm -rf /app/*
unzip /tmp/backend.zip &>>$LOGFILE


npm install &>>$LOGFILE


cp /home/ec2-user/201-expense-shell/backend.service /etc/systemd/system/backend.service &>>$LOGFILE


systemctl daemon-reload &>>$LOGFILE


systemctl start backend &>>$LOGFILE


systemctl enable backend &>>$LOGFILE


dnf install mysql -y &>>$LOGFILE


mysql -h $MYSQL_SERVER_IP -uroot -p${MYSQL_ROOT_PASSWORD} < /app/schema/backend.sql &>>$LOGFILE


systemctl restart backend &>>$LOGFILE

