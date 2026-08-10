#!/bin/bash

# Path where the backups are stored.
# destPath="/home/ary/backup"
# sourcePath=/home/ary/scripts/
# tar -C "$sourePath" . -czf "$destPath/${timestamp}-backup.tar.gz" 

sourcePath="$1"
destPath="$2"

# Get the file count of the destPath.
filecnt="$(cd $destPath && ls | wc -l)"

# Function to append the file to the destPath.
appendfile() {

        timestamp=$(date +%Y-%m-%d_%H-%M-%S)
        tar -czf "$destPath/${timestamp}-backup.tar.gz" -C "$(dirname "$sourcePath")" "$(basename "$sourcePath")"

}

# Function to remove the oldest file from the destPath.
removefile() {

        oldfile="$(ls "$destPath" | sort | head -n 1)"
        rm -- "$destPath/$oldfile"

}

# Check to see whether destPath contains 5, greater than 5 or less files.
while ["$filecnt" -gt 4 ]; do
    removefile
    filecnt=$(ls "$destPath" | wc -l)
done

appendfile