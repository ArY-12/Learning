#!bin/bash

threshold=80

# Extracting the percentage % from the 'df -h' command | Can also use the 'df -h /' command
percentage=$(echo df -h | awk -F " " '$6 == "/" {print $5}' | awk -F "%" '{print $1}')

# Comparison of threshold and percentage.

if [ "$percentage" -gt "$threshold" ]; then
    echo "Usage exceeding threshold!!!"
    logger -t disk-alert -p user.warning "Disk Usage Exceeding Threshold"

elif [ "$percentage" -eq "$threshold" ]; then
    echo "Usage at threshold!"
    logger -t disk-alert -p user.warning "Disk Usage at Threshold"

elif [ "$percentage" -lt "$threshold" ]; then
    echo "Usage below threshold."

fi