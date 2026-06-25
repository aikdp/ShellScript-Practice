#!/bin/bash


echo "All variables passed to the script: $@"
echo "No. of args passed in the script:: $#"
echo "Name of the script:: $0"
echo "Current working directory of user:: $PWD"
echo "Home directory of current user:: $HOME"
echo "PID of current shell or process command:: $$"
sleep 10 &&
echo "PID of last background job:: $!"
echo "Exit status of last executed command is:: $?"