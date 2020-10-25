#!/bin/bash

mkdir /tmp/a

## set GALLIUMOS_ROOT according to your model and original install method
# GALLIUMOS_ROOT=/dev/sda7       ## chrx Haswell or Broadwell
# GALLIUMOS_ROOT=/dev/sda1       ## ISO  Haswell or Broadwell
GALLIUMOS_ROOT=/dev/mmcblk0p7  ## chrx Bay Trail, Braswell, Skylake
# GALLIUMOS_ROOT=/dev/mmcblk0p1  ## ISO  Bay Trail, Braswell, Skylake

mount $GALLIUMOS_ROOT  /tmp/a
mount -o bind /proc    /tmp/a/proc
mount -o bind /dev     /tmp/a/dev
mount -o bind /dev/pts /tmp/a/dev/pts
mount -o bind /sys     /tmp/a/sys
mount -o bind /run     /tmp/a/run

## then
chroot --groups=0 /tmp/a /bin/bash

## reinstall GRUB: internal DISK device only :)
## /dev/mmcblk0 ONLY, or /dev/sda ONLY, depending on model
# dpkg-reconfigure grub-pc

## You might also get some additional prompts:
##  - empty "Linux command line" (OK)
##  - keep the local version of the GRUB config (YES)

exit

# reboot
