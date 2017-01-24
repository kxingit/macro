#!/bin/bash
for filename in ../map_vspeed/*map; do
    newname=`echo $filename |awk -F / '{print $NF}'| awk -F . '{print $1}'`.csv
    echo "writing $newname..."
    echo "sfs,ep,tracf" > $newname
    sed 's/,/ /g' $filename | awk '{print $3*100","$1","$2}' >> $newname
    echo "done"
done
