#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    commd="getScalar.sh 103_Prod_CGG_GuidedWave_P2_deep_tfd_ch100.dugio $line"
    eval $commd
done < "$1"
