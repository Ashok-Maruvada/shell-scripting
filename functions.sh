#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F-%H+%M+%S)
script_name=$($0 | cut -d "." -f1)
logfile=/temp/$script_name_$timestamp.log
validate(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 :  failed"
        exit 0
    else
        echo "$2 : success"
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