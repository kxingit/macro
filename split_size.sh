#!/bin/bash
if (( $# != 2 )); then
    echo "Illegal number of parameters"
    echo "input: [File list] [Size of all files on each list (in gigabytes)]"
    exit 1;
fi

file_list=$1
max_size_gigabytes=$2
ts="$(date +%s)"
temp_file_size=".$ts.ds3e.temp.txt"

# [[ -z "${1}" ]] && { echo 'Provide a list of files and their sizes'; exit 1; }

cat $file_list | xargs du > $temp_file_size

awk -v sizelimit=$((max_size_gigabytes*1024*1024)) -v outputfilename=${ts}_list \
'BEGIN {target=outputfilename ".00"}; '\
'{sum+=$1; '\
'if(sum>sizelimit) { file_index++; target=outputfilename "." sprintf("%02d",file_index); sum=$1;}; '\
'print $2 >target}' ${temp_file_size}

rm $temp_file_size
echo "Done!"
echo "Check the splitted lists!"
