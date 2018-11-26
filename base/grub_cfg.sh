#!/bin/bash

ROOT_UID=0

# check command avalibility
function has_command() {
    command -v $1 > /dev/null
}

# Load common properties and functions in the current script.
. ./common.sh
	if [ "$UID" -eq "$ROOT_UID" ]; then

echo '#linuxslide fastboot settings
GRUB_CMDLINE_LINUX_DEFAULT="splash quiet"
GRUB_DEFAULT=0
GRUB_DISABLE_OS_PROBER=true
GRUB_DISTRIBUTOR="`/usr/bin/lsb_release -d -s 2>/dev/null || echo Slide`"
GRUB_GFXMODE=1920x1080,1600x900,1366x768,1280x1024,1024x768,800x600
GRUB_GFXPAYLOAD_LINUX=keep
GRUB_HIDDEN_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_RECORDFAIL_TIMEOUT=0
GRUB_TIMEOUT=0
GRUB_TIMEOUT_STYLE=hidden' > /etc/default/grub

# update GRUB settings
update-grub

else
		# Message  
		echo -e "Please run this script as root..."
	fi
