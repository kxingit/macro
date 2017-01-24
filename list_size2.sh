#!/bin/bash
echo "Calculating..."
echo "=============="
log_file=list_size_$(date -d "today" +"%Y%m%d%H%M").log
du -s * |sort -k1,1 -n |
awk '{print $2}' |
xargs du -hs |
tee $log_file
printf "==============\n List saved to: %s \n" $log_file 
