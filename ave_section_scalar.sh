#!/bin/bash
echo "# channel sum n ave"
for i in `seq 1 7000`;
do 
  echo -e $i" \c"
#  cat Scalars/* |grep $i |awk '{sum+=$3;n++} END {if (n >0) print sum" "n" "sum/n}'
# chennel/section
#  cat Scalars/* |awk -v channel="$i" '{if($1==channel) print $0}' |awk '{sum+=$3;n++} END {if (n >0) print sum" "n" "sum/n}'
# section only
  cat Scalars/* |awk -v channel="$i" '{if($1==channel) print $0}' |awk '{sum+=$4;n++} END {if (n >0) print sum" "n" "sum/n}'
done
