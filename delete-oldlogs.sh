#!/bin/bash

source_dir=/tmp/app-logs

R="e\[31m"
G="e\[32m"
N="e\[0m"

if [ -d $source_dir ]
then 
    echo -e " source directory : $R $source_dir $N exist"
else 
    echo " please create source directory for logs"
    exit 1
fi

files=$(find $source_dir -name "*.log" -mtime +15)
while IFS= read -r line
do
    echo " deleting old logs from $source_dir : $line "
    rm -rf $line
done <<< $files