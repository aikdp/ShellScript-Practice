#!/bin/bash


err_repo(){
    echo "Error on line $1"
}

trap 'err_repo "${LINENO}"' ERR

echo "Hi, How are you"

ehoo "I am good"

echo "Good to hear you"