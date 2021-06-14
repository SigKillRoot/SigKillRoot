#!/bin/bash
echo "Ultionis plot man"
newline=$(echo)
max=$(find ~/ -type d -name "chia-plotter")
zenity --info --title="Ultionis plot man" --text="Finding madMAx43v3r plotter 
$newline found at $max" --no-wrap --timeout=1
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
zenity --info --title="Scan results" --text="PoolKey $poolactual
FarmKey $farmactual" --no-wrap --timeout=1
zenity --info --title="Ultionis plot man" --text="
Select TEMP
 " --no-wrap
tempz=`zenity --file-selection --directory --title="Select TEMP drive directory"`

case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected.";;
        -1)
                echo "An unexpected error has occurred.";;
esac
zenity --info --title="Ultionis plot man" --text="Select TEMP 2" --no-wrap
temp2z=`zenity --file-selection --directory --title="Select TEMP2 drive directory"`

case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected.";;
        -1)
                echo "An unexpected error has occurred.";;
esac
zenity --info --title="Ultionis plot man" --text="Select DESTINATION" --no-wrap
destz=`zenity --file-selection --directory --title="Select DESTINATION drive directory"`

case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected.";;
        -1)
                echo "An unexpected error has occurred.";;
esac
threadz=$(zenity --entry --title="Threads")
if [ -n "$threadz" ]
then
    zenity --info --text="Using $threadz Threads" --no-wrap
fi
buckz=$(zenity --entry --title="Buckets")
if [ -n "$buckz" ]
then
    zenity --info --text="Using $buckz Buckets" --no-wrap
fi
echo
plotz=$(zenity --entry --title="Plots to run")
if [ -n "$plotz" ]
then
    zenity --info --text="running $plotz plots before loop" --no-wrap
fi
echo "Removing temp files"
zenity --info --title="REMOVING TEMP FILES" --text="$tempz
$temp2z" --no-wrap --timeout=1
rm $tempz/*.tmp
rm $temp2z/*.tmp
eval
echo "OK"
eval cd $max
eval cd build
maxbuild=$(pwd)
zenity --info --title="STARTING PLOT LOOP" --timeout=1 --text="TEMP $tempz
TEMP2 $temp2z
DESTINATION $destz
THREADS $threadz
BUCKETS $buckz" --no-wrap --timeout=1
while true; do
    echo "Starting next plot"
    echo "Plot # " $xxx
    eval nohup ./chia_plot -p $poolactual -f $farmactual -t $tempz/ -2 $temp2z/ -d $destz/ -r $threadz -u $buckz -n $plotz > plotlog.out &
tail -n 500 -f plotlog.out | \
yad --title="UPMGUI" --tail --window-icon=logviewer \
    --button=gtk-close --geometry 600x800 \
    --list --text="Content of $LOGFILE" \
    --column Reading_Log \

exit $?
eval
    eval
    echo "Removing temp files"
	rm $tempz/*.tmp
	rm $temp2z/*.tmp
	eval
    echo "Continuing loop"
    done
echo "End of script."
done
