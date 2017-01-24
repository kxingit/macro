dir1=raw_loader
reel1=0006
path1="/h2/000scratch/mcg/asa2dPr_004/01_raw_Lazarev/$dir1/REEL$reel1/"
for filename in $path1/*.dump; do echo ln -s $filename ${PWD}/; done >ln.txt
sed '$d' ln.txt > tmp.txt; mv tmp.txt ln.txt

#dir2=raw_loader
#reel2=0006
#path2="/h2/000scratch/mcg/asa2dPr_004/01_raw_Lazarev/$dir2/REEL$reel2/"
#for filename in $path2/*.dump; do echo ln -s $filename ${PWD}/; done >>ln.txt
#sed '$d' ln.txt >tmp.txt;mv tmp.txt ln.txt

cat ln.txt |awk '{ printf($0"%08d.segd\n", ++i) }' > ln.sh
sh ln.sh
rm -f ln.txt ln.sh
