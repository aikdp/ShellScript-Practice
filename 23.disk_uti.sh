#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=5


while IFS= read -r line
do
    USAGE=$(echo "$line" | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    MOUNT_POINT=$(echo "$line" | grep xfs | awk -F '{print $NF}')
    if [ "$USAGE" -ge "$THRESHOLD" ]
    then
        echo "$MOUNT_POINT is morethan $THRESHOLD, Currrent Value is:: $USAGE, PLEASE CHECK"
    fi

done <<< "$DISK_USAGE"
