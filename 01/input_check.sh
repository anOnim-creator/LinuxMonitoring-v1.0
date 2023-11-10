#!/bin/bash

if [ -n "$parameter" ] 
then

chmod +x argument_check.sh
./argument_check.sh

else
echo "Error! Empty argument!"
fi
