#!/bin/bash

# TODO: add usage guide in case of bad input

target=$1
# TODO: next line may not work on all platforms, find other solutions e.g. string manipulation
targetDir=$(dirname "$target") # POSIX only

echo "Creating directory: $targetDir/unzipped"
mkdir "$targetDir/unzipped"

# unzip command:
# unzip [target file] -d [target location]
for f in "$target"/*
do
    # bf=${f##*/} should work for all bash
    bf=$(basename $f) # POSIX only
    unzip -q $f -d $targetDir/unzipped/$bf
done

echo "Done"
