#!/bin/bash


USER=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER -ne 0 ]
    then
        echo -e "$R Please run with ROOT preveilges $N"
        exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R Failed $N"
        exit 1
    else
        echo -e "$2 is $G SUCCESS $N"
    fi    
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "mysql is not installed, $Y goint to installed $N"
    dnf install mysql -y
    VALIDATE $? "Mysql Installtion"
else 
    echo -e "mysql already installed, $Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "mysql is not installed, $Y goint to installed $N"
    dnf install nginx -y
    VALIDATE $? "Nginx Installtion"
else 
    echo -e "NGINX already installed, $Y SKIPPING $N"
fi