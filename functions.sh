#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F-%H+%M+%S)
script_name=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$script_name-$timestamp.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
validate(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 : $R failed $N"
        exit 0
    else
        echo "$2 : $R success $N"
    fi
}
if [ $userid -ne 0 ]
then
    echo "please use root access"
    exit 0
else
    echo " you are super user"
fi

dnf install mysql -y &>>$logfile
validate $? "installing mysql"

dnf install git -y &>>$logfile
validate $? "installing git"