#!/bin/bash

START_TIME=$(date +%s)

str=$1
if [[ $# -eq 1 ]] && [[ $(echo "${str: -1}") == "/" ]]
then

chmod +x output.sh
./output.sh $1

END_TIME=$(date +%s)
echo "Script execution time (in seconds) = $(( $END_TIME - $START_TIME ))"

else
echo "Error! The argument does not end with \"/\" or the number of arguments does not equal 1!"
fi
