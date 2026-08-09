#/bin/bash

today=$(date -%Y-%m-%d)

outputfile="/tmp/log-monitor-${today}.log"

journalctl --since today | grep -i error >> outputfile
