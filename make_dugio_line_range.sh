#/bin/bash
input=/h2/apache/srnB58Pr_167/seiTimeProc/test/9002_DAMute_for_SRME/100sei/9002_DAMute_for_SRME.dugio
for i in {4735..5245}
do
  echo $i
  find $input -name "*APA58-$i*" >> list
  #find $intpu -name "*APA58-$i*" | xargs ln -s -t .
done
