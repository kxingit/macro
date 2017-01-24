input=$1
#input=103_Prod_CGG_GuidedWave_P2_deep_tfd_ch100.dugio
linename=$2
echo "gut,tracr" > csv/$linename.csv
dugio read file=$input query=shot:1221-13813[160] line=$linename |dugethw key=tracr,gut output=geom|sort -n |uniq |awk '{print $2","$1}' >> csv/$linename.csv
#echo "gut,tracr" > RY05-5568I4-170_cable5_gun2.csv
#dugio read file=$input query=* line=RY05-5568I4-170_cable5_gun2 |dugethw key=tracr,gut output=geom|sort -n |uniq |awk '{print $2","$1}' >> RY05-5568I4-170_cable5_gun2.csv
#echo "gut,tracr" > RY05-6272P1-015_cable3_gun1.csv
#dugio read file=$input query=* line=RY05-6272P1-015_cable3_gun1 |dugethw key=tracr,gut output=geom|sort -n |uniq |awk '{print $2","$1}' >> RY05-6272P1-015_cable3_gun1.csv

