#!/bin/bash

ROOT_UID=0

# check command avalibility
function has_command() {
    command -v $1 > /dev/null
}
# Load common properties and functions in the current script.
. ./common.sh

	if [ "$UID" -eq "$ROOT_UID" ]; then
		clear
    apt-get install --yes --no-install-recommends \
    openbox \
    compton \
    tint2 \
    feh \
    scrot \
    xterm \
    wmctrl \
    xdotool
#    libnotify4 
else
		# Message  
		echo -e "Please run this script as root..."
	fi
