#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


SOURCE_DIR=$1


if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR  $R does not exists $N. please check"
    exit 1
fi

FILES_DEL=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS= read -r file
do

    echo "Deleting files are: $file "
    rm -rf $file

done <<< $FILES_DEL

#Cront JOb set below
#crontab -e
#*/2 * * * * sh <path-of-script>.sh
#*/2 * * * * sh /home/ec2-user/ShellScript-Practice/20.delete_logs.sh
#:wq!
#The above is the cronjob will run every 2 mins
#to cehck: go to --> cd /var/log
# sudo tail -f /var/log/cron
