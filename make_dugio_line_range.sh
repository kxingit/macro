#/bin/bash
for i in {4015..5245}
do
  echo $i
  find /h2/apache/srnB58Pr_167/seiTimeProc/test/3011_Polarcus_2016_Tidal_WCS_deSig_deBubble_4ms_resample/100sei/3011_Polarcus_2016_Tidal_WCS_deSig_deBubble_4ms_resample.dugio/ -name "APA58-$i*" #| xargs ln -s -t .
  find /h2/apache/srnB58Pr_167/seiTimeProc/test/3011_Polarcus_2016_Tidal_WCS_deSig_deBubble_4ms_resample/100sei/3011_Polarcus_2016_Tidal_WCS_deSig_deBubble_4ms_resample.dugio/ -name "2D-APA58-$i*" #| xargs ln -s -t .
done
