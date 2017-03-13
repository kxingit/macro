#!/bin/bash
if (( $# == 0 )); then
    echo "merge_dugio.sh [Output volume name] [Input volume names (space seperated)]"
	echo "e.g. merge_dugio.sh merged_output.dugio input1.dugio input2.dugio..."
    exit 1;
fi

ts="$(date +%s)"
output=$1
if [ -d $output ]; then
	  echo "Output volume exits!"
	  echo "Exiting..."
	  exit 1;
  fi
mkdir $output
for vol # in "${@:2}"
do
	# Absolution paths
	if [[ "${vol:0:1}" == / || "${vol:0:2}" == ~[/a-z] ]]
		then
    		find $vol -maxdepth 1 -type f| grep -v notes.txt | grep -v status.db | xargs ln -s -t $output
	else # Relative paths
    		find $PWD'/'$vol -maxdepth 1 -type f| grep -v notes.txt | grep -v status.db | xargs ln -s -t $output
	fi
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
echo "Merged volume is ${bold}"$output"${normal}"
