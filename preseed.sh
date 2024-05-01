#!/bin/bash

# ==============================================================================
#
#          FILE: preseed.sh
#
#         USAGE: ./preseed.sh
#
#   DESCRIPTION: Shell script for creating a Debian AutoInstall ISO.
#
#        AUTHOR: Michel Abele
#       CREATED: 2024-02-06
#       UPDATED: 2024-05-01
#      REVISION: 1.0
#       LICENSE: GNU General Public License, Version 3
#
# ==============================================================================

# bring the system up to date
clear
apt -y update
apt -y upgrade
apt -y autoremove

# install necessary packages
clear
apt -y install isolinux genisoimage whois

# variables
isoIn=debian.iso
isoOut=preseed-${isoIn}

clear

# mount the vanilla ISO file
mkdir vanilla-iso new-iso
mount -o loop $isoIn vanilla-iso

# copy the contents of the vanilla ISO to the new ISO directory and unmount the vanilla ISO
cp -rT vanilla-iso/ new-iso/
umount vanilla-iso

# copy the preseed file and the contents of the files directory to the new ISO
mkdir new-iso/files
cp preseed.cfg new-iso/
cp -r files/ new-iso/files/

# add the entry to the GRUP menu
cat >> new-iso/isolinux/adtxt.cfg <<EOF
label auto-wipe
    menu label ^Debian preseed installation
    kernel /install.amd/vmlinuz
    append auto=true priority=critical vga=788 file=/cdrom/preseed.cfg initrd=/install.amd/initrd.gz --- quiet
EOF

# create the new ISO file
genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o $isoOut new-iso
isohybrid $isoOut

# clean up
rm -rf new-iso vanilla-iso

# check if the ISO file was created successfully
clear
if [ -f "./debian-preseed.iso" ]; then
    echo "The ISO file: preseed-debian.iso was successfully created."
else
    echo "The ISO file: preseed-debian.iso could not be created."
fi
