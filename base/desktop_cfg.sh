#!/bin/bash

ROOT_UID=0

# check command avalibility
function has_command() {
    command -v $1 > /dev/null
}

# Load common properties and functions in the current script.
. ./common.sh
	if [ "$UID" -eq "$ROOT_UID" ]; then
# make wallpapers folder
mkdir -p /usr/share/wallpapers/slide

# dowload the default wallpapers
cd /usr/share/wallpapers/slide
wget --no-check-certificate https://github.com/saymoncoppi/linuxslide/raw/master/custom/wallpapers/wallpapers.zip
unzip wallpapers.zip
rm -rf wallpapers.zip
clear

# make folder .config/openbox
mkdir -p ~/.config/openbox/
cd ~/.config/openbox/
clear

echo "#Set resolution 
xrandr --size 1366x768 &

# set background color and big wait mouse cursor
xsetroot -solid '#111111'
xsetroot -xcf /usr/share/icons/breeze_cursors/cursors/watch 37

#Set the wallpaper
feh --bg-scale /usr/share/wallpapers/slide/Road.png

#start tint2 
tint2 &" > autostart


# auto startx

echo '[Unit]
Description=X-Window
ConditionKernelCommandLine=!text
After=systemd-user-sessions.service

[Service]
ExecStart=/bin/su --login -c "/usr/bin/startx -- :0 vt7"

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/display-manager.service
systemctl daemon-reload
systemctl enable display-manager


  else
		# Message  
		echo -e "Please run this script as root..."
	fi
