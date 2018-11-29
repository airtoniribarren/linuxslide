
#!/bin/bash

ROOT_UID=0

# check command avalibility
function has_command() {
    command -v $1 > /dev/null
}

# Load common properties and functions in the current script.
. ./common.sh
	if [ "$UID" -eq "$ROOT_UID" ]; then
# get the base
apt-get install --no-install-recommends gjs webkit2gtk gst-plugins-base gst-plugins-good
cd /usr/bin
wget --no-check-certificate https://raw.githubusercontent.com/saymoncoppi/linuxslide/master/base/slidelauncher
chmod a+x slidelauncher


	else
		# Message  
		echo -e "Please run this script as root..."
	fi
