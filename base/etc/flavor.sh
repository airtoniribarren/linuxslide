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
