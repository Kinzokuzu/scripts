#!/bin/bash


file_name=$1 
target_file_type=$2
attempt_count=$3 # maximum loops before script gives up

# handle usage
if [ $# -ne 1 ] && [ $# -ne 3 ];
then
    echo "usage: chad-unzipper [file] [target file type] [maximum number of attempts]"
    exit 1
# handle unassigned target file type and attempt count
elif [ $# -eq 1 ];
then
    target_file_type="NONE"
    attempt_count=1
fi

# holds output of the file command
file_command_output=$(file -b $file_name) 
# delimits file_command_output by space
IFS=" " read -ra FILE_COMMAND_STRING<<< "$file_command_output"
# file type is in STRING[0]
file_type="${FILE_COMMAND_STRING[0]}"

# TODO: figure out way to manipulate "same" file multiple times.
#   ideas:
#       1. force commands to always create a destination file of the same name

# only execute this code if we have a target file type and maximum number of attempts
while [ $attempt_count -gt 0 ];
do
    # break out of loop if we have the target file type
    if [[ $(echo $(file -b $file_name | grep -q $target_file_type; echo $?)) == "0" ]];
    then
        break
    fi

    # decompression case block
    case $file_type in
        # TODO: add decompression commands here
        Zip)
            unzip $file_name
    esac
   
    # decrement attempt_count
    ((attempt_count--))

    # executes if attempts were exhausted
    if [ $attempt_count -eq 0 ];
    then
        echo "Sorry I tried but failed :("
    fi
done

if [ $# -eq 1 ];
then
    echo "file is now $file_type file"
else
    echo "file is now $target_file_type file"
fi
