#!/bin/bash

ROOT_UID=0

# check command avalibility
function has_command() {
    command -v $1 > /dev/null
}
# dowload the wallpapers
mkdir -p /usr/share/wallpapers/slide
wget -c -P -O /usr/share/wallpapers/slide/default.jpg --nocheck-certificate https://raw.githubusercontent.com/saymoncoppi/linuxslide/master/custom/wallpapers/AidenDrew%20-%20Glati%20-%201920x1080.jpg

# Load common properties and functions in the current script.
. ./common.sh
	if [ "$UID" -eq "$ROOT_UID" ]; then
  
echo"#Set resolution 
xrandr --size 1366x768 &

# set background color and big wait mouse cursor
xsetroot -solid '#111111'
xsetroot -xcf /usr/share/icons/breeze_cursors/cursors/watch 37

#Set the wallpaper \
feh --bg-scale /usr/share/wallpapers/slide/default.jpg

#start tint2 
tint2 &



" > ~/.config/openbox/autostart
  
  
  
  else
		# Message  
		echo -e "Please run this script as root..."
	fi
