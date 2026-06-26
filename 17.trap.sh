#!/bin/bash


set -e

fail(){
    echo "Failed at $1:$2"
}

trap "fail '${LININO}' '$BASH_COMMAND'" ERR

echo "Hi, How are you"

ehoo "I am good"

echo "Good to hear you"