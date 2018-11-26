#!/bin/bash

ROOT_UID=0

# check command avalibility
function has_command() {
    command -v $1 > /dev/null
}

# Load common properties and functions in the current script.
. ./common.sh
	if [ "$UID" -eq "$ROOT_UID" ]; then

# edit /etc/issue
echo "Linux Slide 0.1" > /etc/issue

# edit /etc/motd
echo "" > /etc/motd

# edit /etc/lsb-release
echo 'DISTRIB_ID=Slide
DISTRIB_RELEASE="0.1"
DISTRIB_DESCRIPTION="Slide 0.1 "
DISTRIB_CODENAME=unstable' >  /etc/lsb-release

# edit /etc/hostname
echo "Slide" > /etc/hostname

else
		# Message  
		echo -e "Please run this script as root..."
	fi
