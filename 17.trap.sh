#!/bin/bash


set -e

fail(){
    echo "Failed at $1:$2"
}

trap "fail '${LINENO}' '$BASH_COMMAND'" ERR

echo "Hi, How are you"

ehoo "I am good"

echo "Good to hear you"