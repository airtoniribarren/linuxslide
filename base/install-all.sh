#!/bin/bash

ROOT_UID=0

# check command avalibility
function has_command() {
    command -v $1 > /dev/null
}

# Load common properties and functions in the current script.
. ./common.sh
	if [ "$UID" -eq "$ROOT_UID" ]; then






# NEW APT SETTINGS
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo 'APT
{
  NeverAutoRemove
  {
	"^firmware-linux.*";
	"^linux-firmware$";
  };
  VersionedKernelPackages
  {
	# linux kernels
	"linux-image";
	"linux-headers";
	"linux-image-extra";
	"linux-signed-image";
	# kfreebsd kernels
	"kfreebsd-image";
	"kfreebsd-headers";
	# hurd kernels
	"gnumach-image";
	# (out-of-tree) modules
	".*-modules";
	".*-kernel";
	"linux-backports-modules-.*";
        # tools
        "linux-tools";
  };
  Never-MarkAuto-Sections
  {
	"metapackages";
	"contrib/metapackages";
	"non-free/metapackages";
	"restricted/metapackages";
	"universe/metapackages";
	"multiverse/metapackages";
  };
  Move-Autobit-Sections
  {
	"oldlibs";
	"contrib/oldlibs";
	"non-free/oldlibs";
	"restricted/oldlibs";
	"universe/oldlibs";
	"multiverse/oldlibs";
  };
};
APT::Install-Recommends "0" ;
APT::Install-Suggests "0" ;
Acquire::Languages { "none";
Apt::AutoRemove::SuggestsImportant "false";
Acquire::GzipIndexes "true";
Acquire::CompressionTypes::Order:: "gz";
DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };
APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };
Dir::Cache::pkgcache "";
Dir::Cache::srcpkgcache "";' > /etc/apt/apt.conf.d/01_custom_slide


# no docs
echo "
path-exclude /usr/share/doc/*
# we need to keep copyright files for legal reasons
path-include /usr/share/doc/*/copyright
path-exclude /usr/share/man/*
path-exclude /usr/share/groff/*
path-exclude /usr/share/info/*
# lintian stuff is small, but really unnecessary
path-exclude /usr/share/lintian/*
path-exclude /usr/share/linda/*
path-exclude /usr/share/locale/*
path-include /usr/share/locale/en*
" > /etc/dpkg/dpkg.cfg.d/01_nodoc

#update /etc/apt/sources.list
echo "
#add non-free packages
deb http://ftp.us.debian.org/debian/ stretch main contrib non-free
deb-src http://ftp.us.debian.org/debian/ stretch main contrib non-free
deb http://security.debian.org/debian-security stretch/updates main contrib non-free
deb-src http://security.debian.org/debian-security stretch/updates main contrib non-free
# stretch-updates, previously known as 'volatile'
deb http://ftp.us.debian.org/debian/ stretch-updates main contrib non-free
deb-src http://ftp.us.debian.org/debian/ stretch-updates main contrib non-free
#get unstable software like firefox
#deb http://http.debian.net/debian unstable main
#https://backports.debian.org/Instructions/
deb http://ftp.debian.org/debian stretch-backports main
" > /etc/apt/sources.list





# NEW FLAVOR
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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






# NEW GRUB SETTINGS
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo '#linuxslide fastboot settings
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
#for the future
#GRUB_CMDLINE_LINUX_DEFAULT="quiet splash zswap.enabled=1 zswap.compressor=zstd zswap.zpool=z3fold"
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
#echo zstd >> /etc/initramfs-tools/modules
#echo z3fold >> /etc/initramfs-tools/modules
#update-initramfs -u





# NEW X
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

clear
  apt-get install --no-install-recommends \
  xserver-xorg-core \
  xserver-xorg-legacy \
  xserver-xorg-video-vesa \
  xserver-xorg-video-vmware \
  xserver-xorg-input-all \
  xinit \ 
  xfonts-base \
  x11-utils \
  libxcursor1 \
  libdrm-intel1 \
  libgl1-mesa-dri \
  libglu1-mesa
  
  # install x11 server utils, apt-get would add cpp dependency, bullshit!
  cd /tmp
  apt-get download x11-xserver-utils
  dpkg -x x11-xserver-utils*.deb /tmp/x11utils
  cd /tmp/x11utils
  cp -aR * /
  




# NEW DESKTOP
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  apt-get install --yes --no-install-recommends \
    openbox \
    compton \
    tint2 \
    feh \
    scrot \
    xterm \
    wmctrl \
    xdotool
    #libnotify4 


# NEW DESKTOP SETTINGS
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# make wallpapers folder
mkdir -p /usr/share/wallpapers/slide

# dowload the default wallpapers
cd /usr/share/wallpapers/slide
wget --no-check-certificate https://github.com/saymoncoppi/linuxslide/raw/master/custom/wallpapers/wallpapers.zip
apt install unzip
unzip wallpapers.zip
rm -rf wallpapers.zip
clear

# install white cursor
apt install dmz-cursor-theme

# get watch-startup cursor
cd /usr/share/icons
wget --no-check-certificate https://github.com/saymoncoppi/linuxslide/blob/master/custom/icons/watch-startup

# make folder .config/openbox
mkdir -p ~/.config/openbox/
cd ~/.config/openbox/
clear

# get xresources
cd ~/
wget --no-check-certificate https://raw.githubusercontent.com/saymoncoppi/linuxslide/master/custom/.Xresources
wget --no-check-certificate https://raw.githubusercontent.com/solarized/xresources/master/Xresources.dark

#to change resolution
#https://raw.githubusercontent.com/saymoncoppi/linuxslide/master/custom/fbscreensize

echo "#Set resolution 
# merge xresource settings
xrdb -merge ~/.Xresources
# set background color and big wait mouse cursor
xsetroot -solid '#111111'
xsetroot -xcf /usr/share/icons/watch-startup 37
#Set the wallpaper (check later/usr/share/backgrounds/default_background.jpg)
feh --bg-scale /usr/share/wallpapers/slide/Road.png
#start tint2 
tint2 &" > autostart


# auto startx

echo '[Unit]
Description=X-Window
ConditionKernelCommandLine=!text
After=systemd-user-sessions.service
[Service]
ExecStart=/bin/su --login -c "/usr/bin/startx -- :0 vt7"
[Install]
WantedBy=multi-user.target' > /etc/systemd/system/display-manager.service
systemctl daemon-reload
systemctl enable display-manager


	else
		# Message  
		echo -e "Please run this script as root..."
	fi
