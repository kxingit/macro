#!/bin/bash
echo "Checking md5 from tape wrting..."
echo "Checking..."
for filename in */*/*/*md5sum
    do echo $filename
done
output=`ls */*/*/*md5sum | paste -sd ' \n' | awk '{printf "diff "$0"\n"}' | source /dev/stdin`
echo $output
if [[ $output == "" ]]; then
    echo "Checksum passed. Tapes writing successful"
else 
    echo "Check errors!"
fi
