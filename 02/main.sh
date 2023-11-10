#!/bin/bash

. ./lib_functions.sh

echo_vars

echo "Save output in file? [Y/N]"
read choice
if [[ $choice = Y ]] || [[ $choice = y ]]
then
write_vars_in_file
fi
