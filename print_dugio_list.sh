#!/bin/bash
if (( $# != 1 )); then
    echo "Illegal number of parameters"
    echo "input: [prefix of filelists], e.g. [1478645267_list.]"
    exit 1;
fi

for file in $1[0-9][0-9]
do  
    i=`echo $file | tail -c 3`
    printseq=$(printf "awk -F / '{print \$(NF-1)}' %s | uniq" $file )
    printf "[Tape %02d] \n" ${i#0}
    eval $printseq
done
