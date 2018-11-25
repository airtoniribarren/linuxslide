# edit /etc/issue
echo "Linux Slide 0.1 \n \l" | sudo tee /etc/issue

# edit /etc/motd
echo "" | sudo tee /etc/issue

# edit /etc/lsb-release
echo 'DISTRIB_ID=Slide
DISTRIB_RELEASE="0.1"
DISTRIB_DESCRIPTION="Slide 0.1 "
DISTRIB_CODENAME=unstable' | sudo tee  /etc/lsb-release

# edit /etc/hostname
echo "slide" | sudo tee /etc/hostname
