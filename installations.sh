#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then    
    echo "please login with super user access"
    exit 0
else    
    echo "you are super user"
fi
dnf install mysql -y
if [ $? -ne 0 ]
then 
    echo "installation is failed"
else
    echo "installation is success"
fi