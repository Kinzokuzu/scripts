#!/bin/bash

# filename
file_name=$1 
# holds output of the file command
file_command_output=$(file -b $file_name) 
# delimits file_command_output by space
IFS=" " read -ra STRING <<< "$file_command_output"
# file type is in STRING[0]
file_type="${STRING[0]}"

echo "file type is $file_type"
case $file_type in
    # add decompression commands here
    Zip)
        unzip $file_name
        ;;
esac
