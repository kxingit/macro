#!/bin/bash

# Split data into as many pieces as needed such that each piece doesn't exceed some number of gigabytes

max_size_gigabytes=3300
ts="$(date +%s)"

[[ -z "${1}" ]] && { echo 'Provide a list of directories containing files to be copied to the script'; exit 1; }
dir_list="${@}"

for d in ${dir_list}; do
    [[ -d "${d}" ]] || { echo "${d} does not seem to be a directory"; exit 1; }
done

max_size_bytes=$((max_size_gigabytes*1024*1024*1024))
section=0
total_size_section=0
while read file; do
    echo "${file}" >> "${ts}_result_split_${section}"
    size=$(stat -c '%s' "${file}")
    [[ -z "${size}" ]] && { echo "Could not get size of ${file}"; exit 1; }
    (( total_size_section+=size ))
    if (( total_size_section > max_size_bytes )); then
        (( section+=1 ))
        total_size_section=0
    fi
done <<< "$(find ${dir_list} -type f)"
