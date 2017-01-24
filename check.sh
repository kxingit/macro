#!/bin/bash
printf "Line\t\t\tREEL\n"
#for f in /h2/000scratch/Apache20160610_tape/*/REEL*/00000001.dump
for f in *.sgy
do
	line=`dd if=${f} conv=ascii ibs=3200 count=1|cut -b 301-320`
	echo "$line ${f::-13}"
done
