#!/bin/bash

if [[ "$parameter" =~ [[:digit:]] ]]
then
echo "Error! Number in argument!"
else
echo "$parameter"
fi
