
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
apt-get install --no-install-recommends \
gjs \
gir1.2-webkit2-4.0 \
gstreamer1.0-plugins-base \
gstreamer1.0-plugins-good

#enter /usr/bin folder and copy the new file
cd /usr/bin
wget --no-check-certificate https://raw.githubusercontent.com/saymoncoppi/linuxslide/master/base/slidelauncher
chmod a+x slidelauncher


	else
		# Message  
		echo -e "Please run this script as root..."
	fi
