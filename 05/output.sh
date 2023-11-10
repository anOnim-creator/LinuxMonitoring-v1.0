#!/bin/bash

. ./lib_functions.sh

if [[ -d $1 ]]
then
print_info $1
else
echo "Error! Directory not found or the path does not point to a directory!"
fi
