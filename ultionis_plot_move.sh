clear
echo "   Wait-Move   easy automated plot mover"
echo
echo "User= "
eval whoami
user=$(whoami)
echo
echo "Setting /media/"$user"/ for mounted drives"
echo
echo "Define mounted drives to move completed plots to : Example: SATA"
read mountident
echo
echo "using /media/"$user"/"$mountident" to move plots to:"
echo "Would you like to list mounted drives first? y/n:"
read list1
echo "setting variables for " $mountident
if  [ $list1 == "y" ]; then
df -ah --type=ext4 --type=exfat --type=fuseblk | grep -e $user'/'$mountident'.*' | awk '{ print $NF }'
	echo
	else 
	echo "not showing mounted drives "
	fi
mounted1+=$(df -ah --type=ext4 --type=exfat --type=fuseblk | grep -e $user'/'$mountident'.*' | awk '{ print $NF }' | sed -n '1p')
mounted2+=$(df -ah --type=ext4 --type=exfat --type=fuseblk | grep -e $user'/'$mountident'.*' | awk '{ print $NF }' | sed -n '2p')
mounted3+=$(df -ah --type=ext4 --type=exfat --type=fuseblk | grep -e $user'/'$mountident'.*' | awk '{ print $NF }' | sed -n '3p')
mounted4+=$(df -ah --type=ext4 --type=exfat --type=fuseblk | grep -e $user'/'$mountident'.*' | awk '{ print $NF }' | sed -n '4p')
mounted5+=$(df -ah --type=ext4 --type=exfat --type=fuseblk | grep -e $user'/'$mountident'.*' | awk '{ print $NF }' | sed -n '5p')
echo "showing mounted"
echo "$mounted1"
echo "$mounted2"
echo "$mounted3"
echo "$mounted4"
echo "$mounted5"
echo "-----"
echo "using mounted variables for PLOT - SEND TO"
reqSpace=110000000	#Size of plot file with a little bit of wiggle room
availSpace=$(df $mounted1 | awk 'END{print $4}')	#Checks drive space free
(( PS = $availSpace / $reqSpace ))
	echo "Room for " $PS " plots on " $mounted1
echo "Define plot landing location as defined by your plotter"
echo
echo "Landing/Destination drive for plotter. using /media/"$user"/"
echo "Landing Drive 1 : "; read landing1
echo "/media/"$user"/"$landing1
let WW=0
echo
reqSpace=110000000	#Size of plot file with a little bit of wiggle room
availSpace=$(df $mounted1 | awk 'END{print $4}')	#Checks drive space free
	echo " "Required  space : $reqSpace bytes
	echo
	echo Available space : $availSpace bytes
	echo
	if (( availSpace < reqSpace )); then	# Compares required space to free space
	  echo "Not enough space available on " $mounted1 " , Checking next drive." >&2	#Move to next drive if not enough free space
	fi
	echo "Available free disk space on  " $drive1 "  OK"
	echo
	echo Available : $availSpace / Required : $reqSpace
	echo
	(( PS = $availSpace / $reqSpace ))
	echo Room for $PS plots on $mounted1
while [ ! -f $landing1*.plot ]; do	#Starts wait on drive for plot file
echo
	sleep 5	#Waits for 5 seconds
	let WW=$WW+1
	let TT=$WW/20
		echo Available : $availSpace / Required : $reqSpace
		echo
	(( PS = $availSpace / $reqSpace ))
	echo Room for $PS plots on $mounted1
	echo
	echo
	echo
	echo -n Lap $WW on $landing1 "Scanning every 5s for new plot file :  " $TT " Minutes elapsed"
	echo	
sleep 1
	if [ -f $landing1*.plot ];	#Starts transfer
	then
		echo
		echo 
		echo "	New plot file located !";
		echo
		echo   moving $landing1/*.plot to $mounted1;
			mv $landing1/*.plot $mounted1/;	#Transfering
		echo
		echo "Move complete."
		let WW=0
	echo
	fi
	continue
echo "ending background plot mover"
done
