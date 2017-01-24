#!/bin/bash
paste *Wavelet > all_Wavelet
awk '{
    s=n=0;
    for(i=1;i<=NF;i++)
        if($i!="NA"){
            s+=$i*1;n++
    }
    if(n!=0){
        print s/n
    }
     }' all_Wavelet > ave_all_Wavelet
rm -f all_Wavelet
echo -e "Stacked wavelet is \033[36m ave_all_Wavelet \033[0m"
