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
  apt-get install --no-install-recommends xserver-xorg-core xserver-xorg-legacy xserver-xorg-video-vesa xserver-xorg-video-vmware xserver-xorg-input-all xinit xfonts-base x11-utils libxcursor1 libdrm-intel1 libgl1-mesa-dri libglu1-mesa x11-xserver-utils alsa-utils pulseaudio
 
	else
		# Message  
		echo -e "Please run this script as root..."
	fi
