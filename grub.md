# Fast boot
edit /etc/default/grub

#slide fastboot
GRUB_CMDLINE_LINUX_DEFAULT="splash quiet"
GRUB_DEFAULT=0
GRUB_DISABLE_OS_PROBER=true
GRUB_DISTRIBUTOR="`/usr/bin/lsb_release -d -s 2>/dev/null || echo slide`"
GRUB_GFXMODE="1024x768"
GRUB_HIDDEN_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_RECORDFAIL_TIMEOUT=0
GRUB_TIMEOUT=0
GRUB_TIMEOUT_STYLE=hidden

## update grub settings
update-grub
