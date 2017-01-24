#!/bin/bash
printf "Line\t\t\tREEL\n"
for f in /h2/000scratch/Apache20160610_tape/*/REEL*/*.dump
do
	fsize=`stat --printf="%s" $f`
	if [[ $fsize -lt 1000000 ]]
	then 
#		echo "skipped $fsize $f"
		continue
	fi
	line=`dd if=${f} conv=ascii ibs=3200 count=1|cut -b 167-182`
	if [[ $line == "" ]]
	then
		continue
	fi
	if [[ $f == *"PGS"* ]]
	then
		line=`dd if=${f} conv=ascii ibs=3200 count=1|cut -b 167-182`
#		echo "$line ${f::-13}"
		echo "$line ${f}"
	elif [[ $f == *"CGG"* ]]
	then 
		line=`dd if=${f} conv=ascii ibs=3200 count=1|cut -b 175-192`
		echo "$line ${f}"
	else
		line=`dd if=${f} conv=ascii ibs=3200 count=1|cut -b 176-192`
		echo "$line ${f}"
	fi
done
# dd if=00000001.dump conv=ascii  ibs=4000 count=1|cut -b 500-3700|fold -w 80
# dd if=4643-4745-001.sgy conv=ascii  ibs=4000 count=1|cut -b 513-3712|fold -w 80
