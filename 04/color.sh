#!/bin/bash

. ./colors.conf
. ./lib_functions_output.sh

default_column1_background=6
default_column1_font_color=1
default_column2_background=2
default_column2_font_color=4

now_column1_background=$column1_background
now_column1_font_color=$column1_font_color
now_column2_background=$column2_background
now_column2_font_color=$column2_font_color

if [[ -z $now_column1_background ]]
then
    now_column1_background=$default_column1_background
fi

if [[ -z $now_column1_font_color ]]
then
    now_column1_font_color=$default_column1_font_color
fi

if [[ -z $now_column2_background ]]
then
    now_column2_background=$default_column2_background
fi

if [[ -z $now_column2_font_color ]]
then
    now_column2_font_color=$default_column2_font_color
fi

if [[ $(check_params $now_column1_background $now_column1_font_color $now_column2_background $now_column2_font_color) -eq 1 ]] \
&& [[ $now_column1_background -ne $now_column1_font_color ]] && [[ $now_column2_background -ne $now_column2_font_color ]]
then

get_color $now_column1_background $now_column1_font_color $now_column2_background $now_column2_font_color
colorised_output_func

echo ""
colors_info $now_column1_background $now_column1_font_color $now_column2_background $now_column2_font_color

else
echo "Please specify other colors! The colors of the text and background should not be equal!"
fi
