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

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "ngnx is not installed, $Y goint to installed $N"
    dnf install nginx -y
    if [ $? -ne 0 ]
    then
        echo "$R nginx instllation failed $N, please check"
        exit 1
    else 
        echo -e "NGINX installation completed $G SUCCESSFULLY $N"
    fi
else 
    echo -e "nginx already installed, $Y SKIPPING $N"
fi