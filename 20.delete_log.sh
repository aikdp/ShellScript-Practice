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