#!/bin/bash

if [ $# -eq 1 ]
then

parameter="$1"

export parameter
chmod +x input_check.sh
./input_check.sh

else 
echo "Error! The number of arguments is not equal to one!"
fi
