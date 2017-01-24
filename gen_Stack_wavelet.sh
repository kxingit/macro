#/bin/bash
if (( $# != 1 )); then
    echo "Illegal number of parameters"
    echo "Input: [dugio]"
    exit 1;
fi

inputfile=$1
getlines $inputfile > line_list
mkdir stack_wavelets
for line in `cat line_list`
do
    echo $line
    output=$line'_Wavelet'
    dugio read file=$inputfile line=$line query=* | suascii bare=1 > ./stack_wavelets/$output
done


