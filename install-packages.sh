#!/bin/bash

userid=$(id -u)
timestamp=$(date +%f+%H+%M+%S)
LOGFILE=$(echo $0 | cut -d "." -f1)
R="\e[31m"
G="\e[32m"
N="\e[0m"
validate(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 : $R failed $N "
        exit 1
    else
        echo -e "$2 : $G sucees $N "
    fi
}
if [ $userid -ne 0 ]
then
    echo "please use root access"
    exit 1
else
    echo " u are super user"
fi

for i in $@
do 
    echo " package to install : $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo " already installed: $i"
        exit 1
    else    
        echo "installing package : $i"
        dnf install $i &>>$LOGFILE
        validate $? "installing $i"
    fi
done
