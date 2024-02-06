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
#       LICENSE: GNU General Public License, Version 3
#
# ==============================================================================

clear
apt -y update
apt -y upgrade
apt -y autoremove

clear
apt -y install isolinux genisoimage whois

clear
isoIn=debian.iso
isoOut=preseed-${isoIn}

mkdir vanilla-iso new-iso
mount -o loop $isoIn vanilla-iso
cp -rT vanilla-iso/ new-iso/
umount vanilla-iso

mkdir new-iso/files
cp -r files/ new-iso/files/

cp preseed.cfg new-iso/

cat >> new-iso/isolinux/adtxt.cfg <<EOF
label auto-wipe
    menu label ^Debian preseed installation
    kernel /install.amd/vmlinuz
    append auto=true priority=critical vga=788 file=/cdrom/preseed.cfg initrd=/install.amd/initrd.gz --- quiet
EOF

genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o $isoOut new-iso

isohybrid $isoOut

rm -rf new-iso vanilla-iso

clear
if [ -f "./debian-preseed.iso" ]; then
    echo "The ISO file: debian-preseed.iso was successfully created."
else
    echo "The ISO file: debian-preseed.iso could not be created."
fi
