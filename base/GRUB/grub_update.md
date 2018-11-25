# Boot speed

## GRUB Settings
sudo edit /etc/default/grub

#linuxslide fastboot settings \
GRUB_CMDLINE_LINUX_DEFAULT="splash quiet" \
GRUB_DEFAULT=0 \
GRUB_DISABLE_OS_PROBER=true \
GRUB_DISTRIBUTOR="`/usr/bin/lsb_release -d -s 2>/dev/null || echo Slide`" \
GRUB_GFXMODE="1024x768" \
GRUB_GFXPAYLOAD_LINUX=keep \
GRUB_HIDDEN_TIMEOUT=0 \
GRUB_HIDDEN_TIMEOUT_QUIET=true \
GRUB_RECORDFAIL_TIMEOUT=0 \
GRUB_TIMEOUT=0 \
GRUB_TIMEOUT_STYLE=hidden

## update GRUB settings
sudo update-grub


wget --no-check-certificate https://raw.githubusercontent.com/saymoncoppi/linuxslide/master/base/GRUB/grub_update.sh
