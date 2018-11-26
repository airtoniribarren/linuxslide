#!/bin/bash

ROOT_UID=0

# check command avalibility
function has_command() {
    command -v $1 > /dev/null
}

# Load common properties and functions in the current script.
. ./common.sh
	if [ "$UID" -eq "$ROOT_UID" ]; then
  
echo"#Set resolution 
xrandr --size 1024x768 &

#Set the wallpaper \

#start tint2 
tint2 &" > ~/.config/openbox/autostart
  
  
  
  else
		# Message  
		echo -e "Please run this script as root..."
	fi
