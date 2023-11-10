#!/bin/bash

archive_extrntions="\.7z$|\.ace$|\.afa$|\.arc$|\.arj$|\.b1$|\.cab$|\.cfs$|\.cpt$|\.dar$|\.dgc$|"
archive_extrntions+="\.arc$|\.lzh$|\.lha$|\.lzx$|\.arc$|.mou$|\.dmg$|\.partimg$|\.pea$|\.pim$|\.qda$|"
archive_extrntions+="\.rar$|\.rk$|\.shk$|\.sit$|\.sitx$|\.uc$|\.wim$|\.swm$|\.esd$|\.zip$|\.zpaq$|\.a$|"
archive_extrntions+="\.ar$|\.cpio$|\.tar$|\.iso$|\.tar.gz$|\.img$|\.ima$|\.tar.bz2$|\.zipx$"

function print_info() {
    total_dir_num_func $1
    print_top_5_dirs $1
    total_files_num_func $1
    number_of_func $1
    print_top_10_files $1
    print_top_10_exe_files $1
}

function total_dir_num_func() {
    echo "Total number of folders (including all nested ones) = $(dir_count_func $1)"
}

function total_files_num_func() {
    echo "Total number of files = $(files_count_func $1)"
}

function number_of_func() {
    echo "Number of:"
    conf_file_count_func $1
    text_file_count_func $1
    exe_files_count_func $1
    log_files_count_func $1
    arc_files_count_func $1
    symb_link_files_count_func $1
}

function dir_count_func() {
    echo "$(($(find $1 -type d 2>/dev/null | wc -l) - 1))"
}

function print_top_5_dirs() {
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    IFS=$'\n'
	top_five_dirs_array=($(du -h $1 2>/dev/null | sort -t " " -k1rh -k2 | head -6 | awk '{printf "%s/, %s\n", $2, $1}'))
	for (( i=1; i<${#top_five_dirs_array[@]}; i++ ))
    do
		echo "$i - ${top_five_dirs_array[$i]}"
	done
}

function files_count_func() {
    echo "$(find $1 -type f 2>/dev/null | wc -l)"
}

function conf_file_count_func() {
    echo "Configuration files (with the .conf extension) = $(find $1 -type f 2>/dev/null | grep '\.conf$' | wc -l)"
}

function text_file_count_func() {
    echo "Text files = $(find $1 -type f 2>/dev/null | grep '\.txt$' | wc -l)"
}

function exe_files_count_func() {
    echo "Executable files = $(find $1 -type f -executable 2>/dev/null | wc -l)"
}

function log_files_count_func() {
    echo "Log files (with the extension .log) = $(find $1 -type f 2>/dev/null | grep '\.log$' | wc -l)"
}

function arc_files_count_func() {
    echo "Archive files = $(find $1 -type f 2>/dev/null | grep -E $archive_extrntions | wc -l)"
}

function symb_link_files_count_func() {
    echo "Symbolic links = $(find $1 -type l 2>/dev/null | wc -l)"
}

function print_top_10_files() {
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    IFS=$'\n'
	top_ten_files_array=($(find $1 -type f -exec du -h {} + 2>/dev/null | sort -rh | head -10 | awk '{printf "%s, %s\n", $2, $1}'))
    top_ten_files_names=($(find $1 -type f -exec du -h {} + 2>/dev/null | sort -rh | head -10 | awk '{printf "%s\n", $2}'))
	for (( i=0; i<${#top_ten_files_array[@]}; i++ ))
    do
		echo "$(($i + 1)) - ${top_ten_files_array[$i]}, ${top_ten_files_names[$i]##*.}"
	done
}

function print_top_10_exe_files() {
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    IFS=$'\n'
	top_ten_files_array=($(find $1 -type f -executable -exec du -h {} + 2>/dev/null | sort -rh | head -10 | awk '{printf "%s, %s\n", $2, $1}'))
    top_ten_files_names=($(find $1 -type f -executable -exec du -h {} + 2>/dev/null | sort -rh | head -10 | awk '{printf "%s\n", $2}'))
	for (( i=0; i<${#top_ten_files_array[@]}; i++ ))
    do
		echo "$(($i + 1)) - ${top_ten_files_array[$i]}, $(md5sum ${top_ten_files_names[$i]} | awk '{printf "%s", $1}')"
	done
}
