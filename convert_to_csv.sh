#!/bin/bash
# create header .csv files from Polarcus's ascii
for filename in *.txt; do
    basename=`echo ${filename%.txt}`
    csvname="$basename.csv"
    echo "Converting $basename ... "
    awk '{print $3","$1}' $filename > tmp
    firstline="gut,tracf"
    sed "1s/.*/$firstline/" tmp > $csvname
    rm tmp
done
for f in s[0-9]*csv; do 
    namepadzero=`zeropad.sh $f`
	if [ $f != $namepadzero ]; then
        mv $f $namepadzero
    fi
done
echo "renaming csv"
for f in s[0-9]*.csv; do 
    newname=`echo $f |cut -c 2-4`
    echo "newname="$newname
    mv $f $newname 
done

for filename in [0-9]*; do
#    awk 'if($filename==$1) {cp $filename $2}' line/line3
#    awk '"s101_section_scalars.csv"~$1{print "yes";cp "s101_section_scalars.csv" $2}' line/line3
#    awk -v seq=$1,linename=$2 '$filename~$seq {print $seq,$linename;print "Creating scalars for "$linename;cp $filename $linename}' line/line3
#    awk '$filename~\$1 {print \$1;print "Creating scalars for "\$2;cp $filename \$2}' line/line3
#    awk -v col1=$1 '$filename==$col1{print "cp "$filename".csv"}' line/line3
#    echo $filename
#    gawk -v col1=$1 '{if($filename==col1){print "cp "filename".csv"}}' line/line3
    cat /h2/apache/srnB58Pr_167/seiTimeProc/test/channel_shot_scaling_Polarcus/prod_test/line/line3 | 
      awk -v fn=$filename 'fn==$1{print "cp "fn" "$2".csv"}' | bash
done
