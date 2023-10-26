#!/bin/bash

file_name=$1 
target_file_type=$2

# holds output of the file command
file_command_output=$(file -b $file_name) 
# delimits file_command_output by space
IFS=" " read -ra FILE_COMMAND_STRING<<< "$file_command_output"
# file type is in STRING[0]
file_type="${FILE_COMMAND_STRING[0]}"

# TODO: combine the following if and case statements into a loop that will continue
#       to exicute until we reach our target file type or until we tried too hard :(

# check if we're at the target file type
if [[ $(echo $(file -b $file_name | grep -q ASCII; echo $?)) == "0" ]]; then
    echo "$file_name is already a $target_file_type file"
fi

case $file_type in
    # add decompression commands here
    Zip)
        unzip $file_name
        ;;
esac
