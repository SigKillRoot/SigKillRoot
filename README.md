    to install and run, copy and paste the section below in your terminal
-----

git clone https://github.com/SigKillRoot/SigKillRoot.git

cd SigKillRoot

#these use MadMax chia plotter  
#https://github.com/madMAx43v3r/chia-plotter

chmod +x ultionis_plot_man.sh

chmod +x ultionis_plot_move.sh

chmod +x upmgui.sh

#for optional yad dialog log file gui
sudo apt install yad

#move files to your MadMax chia plotter /build/
./upmgui.sh

-----
    Ultionis plot move
    Ultionis plot man
    Ultionis plan man GUI

Update June 14 02:30
Simple plot creation, with automatic plot crash restart + wipes drives of temp files.
Added GUI elements.
Auto following GUI dialog box displays running log.


Changed some things, added GUI interface to Ultionis plot man (upmgui.sh)
not every lets the default mount points load to /media/ so a couple of people
wanted another selection process.


Messed up last night while adding more features. 
Brought back to simple 1 drive to get plot from, 1 drive to send plot to.

Ill get it back to where it was at another time.
I will also let you know when I have changed my plotting manager to be used by others without having to change code

Scans user with 'whoami' and sets '/media/user
Asks for definition of drives look for
Scans using /media/user/defineddrive and mounts to 5 variables
Asks for plot landing location where your plotter places the .plot file
Calculates space required for a single plot file
Calculates drive space and displays how many plots you can fit on defined drive
Scans every 5 seconds on landing drive for a new plot file (removed size limitation)
Displays scan cycles and time in minutes waiting for plot file
After plot moved, it re-scans defined drive space and re-runs calculation.
Goes back to landing drive to wait for next plot.
Cycles till drive is full.

