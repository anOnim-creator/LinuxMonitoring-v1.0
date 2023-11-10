#!/bin/bash

. ../02/lib_functions.sh

f_white="\033[37m"
f_red="\033[31m"
f_green="\033[32m"
f_blue="\033[34m"
f_purple="\033[35m"
f_black="\033[30m"

b_white="\033[47m"
b_red="\033[41m"
b_green="\033[42m"
b_blue="\033[44m"
b_purple="\033[45m"
b_black="\033[40m"

function check_params() {
    for i in $@
    do
        if [[ $(check_param $i) -ne 1 ]]
        then
            echo 0
            return 0
        fi
    done
    echo 1
}

function check_param() {
    if [[ $1 -ge 1 ]] && [[ $1 -le 6 ]]
    then
        echo 1
    else
        echo 0
    fi
}

function get_color {
    case $1 in 
    1) color_1_f_code=${f_white};;
    2) color_1_f_code=${f_red};;
    3) color_1_f_code=${f_green};;
    4) color_1_f_code=${f_blue};;
    5) color_1_f_code=${f_purple};;
    6) color_1_f_code=${f_black};;
    esac

    case $2 in 
    1) color_1_bg_code=${b_white};;
    2) color_1_bg_code=${b_red};;
    3) color_1_bg_code=${b_green};;
    4) color_1_bg_code=${b_blue};;
    5) color_1_bg_code=${b_purple};;
    6) color_1_bg_code=${b_black};;
    esac

    case $3 in 
    1) color_2_f_code=${f_white};;
    2) color_2_f_code=${f_red};;
    3) color_2_f_code=${f_green};;
    4) color_2_f_code=${f_blue};;
    5) color_2_f_code=${f_purple};;
    6) color_2_f_code=${f_black};;
    esac

    case $4 in 
    1) color_2_bg_code=${b_white};;
    2) color_2_bg_code=${b_red};;
    3) color_2_bg_code=${b_green};;
    4) color_2_bg_code=${b_blue};;
    5) color_2_bg_code=${b_purple};;
    6) color_2_bg_code=${b_black};;
    esac
}

clear_code="\033[0m";

function colorised_output_func {
    set_vars
    echo -e "${color_1_bg_code}${color_1_f_code}HOSTNAME${clear_code} = ${color_2_bg_code}${color_2_f_code}$HOSTNAME_VAR${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}TIMEZONE${clear_code} = ${color_2_bg_code}${color_2_f_code}$TIMEZONE${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}USER${clear_code} = ${color_2_bg_code}${color_2_f_code}$USER${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}OS${clear_code} = ${color_2_bg_code}${color_2_f_code}$OS${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}DATE${clear_code} = ${color_2_bg_code}${color_2_f_code}$DATE${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}UPTIME${clear_code} = ${color_2_bg_code}${color_2_f_code}$UPTIME${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}UPTIME_SEC${clear_code} = ${color_2_bg_code}${color_2_f_code}$UPTIME_SEC${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}IP${clear_code} = ${color_2_bg_code}${color_2_f_code}$IP${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}MASK${clear_code} = ${color_2_bg_code}${color_2_f_code}$MASK${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}GATEWAY${clear_code} = ${color_2_bg_code}${color_2_f_code}$GATEWAY${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}RAM_TOTAL${clear_code} = ${color_2_bg_code}${color_2_f_code}$RAM_TOTAL${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}RAM_USED${clear_code} = ${color_2_bg_code}${color_2_f_code}$RAM_USED${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}RAM_FREE${clear_code} = ${color_2_bg_code}${color_2_f_code}$RAM_FREE${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}SPACE_ROOT${clear_code} = ${color_2_bg_code}${color_2_f_code}$SPACE_ROOT${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}SPACE_ROOT_USED${clear_code} = ${color_2_bg_code}${color_2_f_code}$SPACE_ROOT_USED${clear_code}"
    echo -e "${color_1_bg_code}${color_1_f_code}SPACE_ROOT_FREE${clear_code} = ${color_2_bg_code}${color_2_f_code}$SPACE_ROOT_FREE${clear_code}"
}
