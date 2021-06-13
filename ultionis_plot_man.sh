#!/bin/bash
echo "Ultionis plot man"
max=$(find ~/ -type d -name "chia-plotter")
eval cd $max 
eval cd build
eval pwd
pwd1=$(pwd)
user=$(whoami)
driveprefix=$"/media/"$user"/"
echo $driveprefix
cd ~/chia-blockchain/venv/bin/
poolactual=$(./chia keys show | grep -e 'Pool' | awk '{print $5}')
echo "Pool key "$poolactual
cd ~/chia-blockchain/venv/bin/
farmactual=$(./chia keys show | grep -e 'Farm' | awk '{print $5}')
echo "Farmer Key "$farmactual
echo
echo "Temp drive"
read temptemp
temp=$driveprefix$temptemp"/"
echo $temp
echo
echo "Temp2 drive"
read temptemp2
temp2=$driveprefix$temptemp2"/"
echo $temp2
echo
echo "Destination drive"
read desttemp
dest=$driveprefix$desttemp"/"
echo $dest
echo
echo "Thread count"
read threadtemp
thread=$"-r "$threadtemp
echo $thread
echo
echo "Buckets 32/64/128/256/512"
read bucktemp
buck=$"-u "$bucktemp
echo $buck
echo
echo "Removing temp files"
rm $temp*.tmp
eval ls $temp
rm $temp2*.tmp
eval ls $temp2
sleep 1
eval
echo "OK"
eval cd $max
eval cd build
while true; do
	sleep 1
    echo "Starting next plot"
    echo "Plot # " $xxx
    eval ./chia_plot -p $poolactual -f $farmactual -t $temp -2 $temp2 -d $dest $thread $buck
    eval
    echo "Removing temp files"
	rm $temp*.tmp
	eval ls $temp
	rm $temp2*.tmp
	eval ls $temp2
	eval
    echo "Continuing loop"
    done
echo "End of script."
done

