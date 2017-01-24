#!/bin/bash
if (( $# == 0 )); then
    echo "input: [Input volumes (space seperated)], e.g. merge_dugio.sh input1.dugio input2.dugio..."
    exit 1;
fi

ts="$(date +%s)"
output="tmp_output"$ts".dugio"
mkdir $output
for vol # in "$@"
do
    find $vol -maxdepth 1 -type f| grep -v notes.txt | grep -v status.db | xargs ln -s -t $output
done

notes=$output"/notes.txt"
echo "This is a volume merged from the following volumes:" > $notes
for vol
do
    echo $vol >> $notes
done

bold=$(tput bold)
normal=$(tput sgr0)
echo ""
echo "Merged dugio file is ${bold}"$output
echo "${normal}Rename as you wish."
