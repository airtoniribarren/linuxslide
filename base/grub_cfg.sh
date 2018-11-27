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
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash zswap.enabled=1 zswap.compressor=zstd zswap.zpool=z3fold"
GRUB_CMDLINE_LINUX="console=tty12"
GRUB_DEFAULT=0
GRUB_DISABLE_OS_PROBER=true
GRUB_DISTRIBUTOR="`/usr/bin/lsb_release -d -s 2>/dev/null || echo Slide`"
GRUB_GFXMODE=3840x2160,2560x1440,1920x1080,1600x900,1366x768,1280x1024,1024x768,800x600
GRUB_GFXPAYLOAD_LINUX=keep
GRUB_INIT_TUNE="480 440 1"
GRUB_HIDDEN_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_RECORDFAIL_TIMEOUT=0
GRUB_TIMEOUT=0
GRUB_TIMEOUT_STYLE=hidden' > /etc/default/grub

# update GRUB settings
update-grub

# update modules
echo zstd >> /etc/initramfs-tools/modules
echo z3fold >> /etc/initramfs-tools/modules

# update initramfs
update-initramfs -u

else
		# Message  
		echo -e "Please run this script as root..."
	fi
