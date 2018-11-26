# Slide
A mini Debian flavor with a Simple, Light and Incredible Desktop Enviroment

## Follow these steps
- Get iso
- Install sudo
- Update boot speed
- LSB editions
- Install X
- Install Desktop
- Config the desktop

## openbox autostart
edit the file ~/.config/openbox/autostart \

#Set resolution \
xrandr --size 1024x768 &

#Set the wallpaper \

#start tint2 \
tint2 &


## Desktop base tools
sudo apt-get install --no-install-recommends stterm pcmanfm file-roller geany wicd volumeicon-alsa

# Install latest Firefox
Check here https://www.mozilla.org/en-US/firefox/all/ \
Install dependencies: \
sudo apt-get install --no-install-recommends libgtk-3-0 libdbus-glib-1-2

wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" -O firefox.tar.bz2 \

sudo tar -jxvf  firefox.tar.bz2 -C /opt/ \

sudo ln -sf /opt/firefox/firefox /usr/bin/firefox \

echo -e '[Desktop Entry]\n Version=59.0.3\n Encoding=UTF-8\n Name=Mozilla Firefox\n Comment=Navegador Web\n Exec=/opt/firefox/firefox\n Icon=/opt/firefox/browser/chrome/icons/default/default128.png\n Type=Application\n Categories=Network' | sudo tee /usr/share/applications/firefox.desktop






## Network
sudo apt-get install --no-install-recommends network-manager net-tools wireless-tools wpagui curl openssh-client

## Wifi firmwares
sudo apt-get install --no-install-recommends firmware-linux-free firmware-linux-nonfree firmware-atheros firmware-iwlwifi firmware-zd1211 firmware-realtek firmware-bnx2 firmware-brcm80211 firmware-cavium firmware-ipw2x00 firmware-libertas firmware-ti-connectivity

## www / firewall
sudo apt-get install --no-install-recommends iptables lighttpd \
check for settings later







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
