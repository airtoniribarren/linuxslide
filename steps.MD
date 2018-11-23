# SLIDE
## Debian Tiny Installer

You can download a couple of image files of small size, suitable for USB Sticks and similar devices, write them to the media, and then start the installation by booting from that.

Here are the links to the available image files (look at the MANIFEST file for information): 
amd64 - http://ftp.nl.debian.org/debian/dists/stretch/main/installer-amd64/current/images/netboot/

## Install SUDO
apt-get install --no-install-recommends sudo \
usermod -a -G sudo slide


# GRUB fast boot
sudo edit /etc/default/grub

#slide fastboot \
GRUB_CMDLINE_LINUX_DEFAULT="splash quiet" \
GRUB_DEFAULT=0 \
GRUB_DISABLE_OS_PROBER=true \
GRUB_DISTRIBUTOR="`/usr/bin/lsb_release -d -s 2>/dev/null || echo slide`" \
GRUB_GFXMODE="1024x768" \
GRUB_HIDDEN_TIMEOUT=0 \
GRUB_HIDDEN_TIMEOUT_QUIET=true \
GRUB_RECORDFAIL_TIMEOUT=0 \
GRUB_TIMEOUT=0 \
GRUB_TIMEOUT_STYLE=hidden \

## update GRUB settings
sudo update-grub

# install Desktop
## Xorg
sudo apt-get install --no-install-recommends xserver-xorg-core xserver-xorg-legacy xserver-xorg-video-vesa xserver-xorg-video-vmware xserver-xorg-input-all xinit xterm libxcursor1 x11-utils libdrm-intel1 libgl1-mesa-dri libglu1-mesa x11-xserver-utils

## Desktop
sudo apt-get install --no-install-recommends openbox tint2 feh scrot libgtk-3-0 libdbus-glib-1-2 stterm

## openbox autostart
edit the file ~/.config/openbox/autostart \

#Set resolution \
xrandr --size 1024x768 &

#Set the wallpaper \

#start tint2 \
tint2 &

# Install latest Firefox
Check here https://www.mozilla.org/en-US/firefox/all/ \
Install dependencies: \
sudo apt-get install --no-install-recommends libgtk-3-0 libdbus-glib-1-2

wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" -O firefox.tar.bz2 \

sudo tar -jxvf  firefox.tar.bz2 -C /opt/ \

sudo ln -sf /opt/firefox/firefox /usr/bin/firefox \

echo -e '[Desktop Entry]\n Version=59.0.3\n Encoding=UTF-8\n Name=Mozilla Firefox\n Comment=Navegador Web\n Exec=/opt/firefox/firefox\n Icon=/opt/firefox/browser/chrome/icons/default/default128.png\n Type=Application\n Categories=Network' | sudo tee /usr/share/applications/firefox.desktop


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
