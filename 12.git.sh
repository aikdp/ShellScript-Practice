#!/bin/bash


USER=$(id -u)

if [ $USER -ne 0 ]
    then
        echo "Please run with ROOT preveilges"
        exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
then
    echo "Git is not installed, goint to installed"
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Git instllation failed, pleae check"
        exit 1
    fi
else 
    echo "git already installed, SKIPPING"
fi