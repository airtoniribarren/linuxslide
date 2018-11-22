# download installer
Get here:
https://github.com/saymoncoppi/linuxslide/blob/master/Debian%20Tiny%20Installer.MD

# remove unrequired files, logs and apt list
## cleaning /usr/share
rm -rf /usr/share/locale \
mkdir /usr/share/locale \
rm -rf /usr/share/man \
mkdir /usr/share/man \
rm -rf /usr/share/doc \
mkdir /usr/share/doc \
rm -rf /usr/share/zoneinfo \
mkdir /usr/share/zoneinfo

## cleaning /usr/share
apt-get clean

## remove all logs, only retain 1mb. Check settings later
journalctl --vacuum-size=1M 


# install Desktop
## Xorg
apt-get install --no-install-recommends xserver-xorg-core xserver-xorg-video-vesa xserver-xorg-video-vmware xserver-xorg-input-all xinit xterm libxcursor1 x11-utils libdrm-intel1 libgl1-mesa-dri libglu1-mesa
apt-get download x11-xserver-utils ; dpkg -x x11-xserver-utils*.deb /tmp/x11utils ; cd /tmp/x11utils ; cp -aR * / ; rm -rf /x11-xserver-utils*.deb

## Desktop
apt-get install --no-install-recommends openbox tint2 feh scrot
