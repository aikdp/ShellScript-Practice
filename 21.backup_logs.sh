#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR  $R does not exists $N. please check"
    exit 1
fi


if [ ! -d $DESTINATION_DIR ]
then
    echo "$DESTINATION_DIR does not exists. please check"
    exit 1
fi

USAGE(){
    echo "USAGE is:: sh <Source> <Destination> Days(optional)"
    exit 1
}

if [ $# -lt 2 ] # $# means no. of args passed to the script in run time
then
    USAGE
fi

#Every time this will tell you the user when the script executing
echo "Script started executed at:: $(date)"

FILES_DEL=$(find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS)
echo "Existing oldet]r than $DAYS days are:: $FILES_DEL "

# #doesnot found true ( z is true when files empty, ! makes it expression false )
if [ ! -z "${FILES_DEL}" ]
then
    echo -e "File older than 14days $Y are found $N, going to ZIP"
    ZIP_FILE="$DESTINATION_DIR/app_logs-$TIMESTAMP.zip"
    FILES_DEL=$(find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS) | zip "$ZIP_FILE" -@
    if [ -f $ZIP_FILE ]
    then
        echo "Files is Zipped $G successfully $N"
        while IFS= read -r file
        do
            echo "DELETING FILES: $file"
            rm -rf $file
        done <<< $FILES_DEL
    else
        echo "ZIPPINGp failed"
        exit 1
    fi
else 
    echo -e "FIles older than 14 days are $R not found $N"
fi