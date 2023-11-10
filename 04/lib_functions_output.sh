#!/bin/bash

. ../03/lib_functions_color.sh

function colors_info() {
    if [[ $1 -eq $default_column1_background ]]
    then
    color_tmp="default"
    else
    color_tmp=$1
    fi
    echo "Column 1 background = $color_tmp ($(color_color_func $1))"

    if [[ $2 -eq $default_column1_font_color ]]
    then
    color_tmp="default"
    else
    color_tmp=$2
    fi
    echo "Column 1 font color = $color_tmp ($(color_color_func $2))"

    if [[ $3 -eq $default_column2_background ]]
    then
    color_tmp="default"
    else
    color_tmp=$3
    fi
    echo "Column 2 background = $color_tmp ($(color_color_func $3))"

    if [[ $4 -eq $default_column2_font_color ]]
    then
    color_tmp="default"
    else
    color_tmp=$4
    fi
    echo "Column 2 font color = $color_tmp ($(color_color_func $4))"
}

function color_color_func() {
    case $1 in 
    1) echo "white";;
    2) echo "red";;
    3) echo "green";;
    4) echo "blue";;
    5) echo "purple";;
    6) echo "black";;
    esac
}
