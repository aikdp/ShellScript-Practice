#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


SOURCE_DIR=$1
# DESTINATION_DIR=$2
# DAYS=$(3: -14)

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR  $R does not exists $N. please check"
    exit 1
fi

# if [ ! -d $DESTINATION_DIR]
# then
#     echo "$DESTINATION_DIR does not exists. please check"
#     exit 1
# fi

FILES_DEL=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "File to be deleted: $FILES_DEL"