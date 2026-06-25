#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USER=$(id -u)
LOG_FOLDER="/var/log/shell_practice"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

if [ $USER -ne 0 ]
    then
        echo -e "$R Please run with ROOT preveilges $N" 
        exit 1
fi

USAGE(){
    echo "USAGE is:: sudo sh <FILENAME> package1 package2 ..."
}
USAGE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R Failed $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is $G SUCCESS $N" | tee -a $LOG_FILE
    fi    
}

mkdir -p $LOG_FOLDER | tee -a $LOG_FILE

for package in $@
do
   dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$package is not installed, $Y goint to installed $N" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package Installtion"
    else 
        echo -e "$package already installed, $Y SKIPPING $N" | tee -a $LOG_FILE
    fi
done
