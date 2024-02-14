![GitHub last commit](https://img.shields.io/github/last-commit/michel-abele/debian-preseed-workbench?style=for-the-badge)

# Debian preseed workbench
A workbench template for creating Debian Preseeds.

![Static Badge](https://img.shields.io/badge/12-logo?style=for-the-badge&logo=Debian&logoColor=%23ffffff&label=Debian&color=%23A81D33)

:de: [Deutsche Version >>](https://github.com/michel-abele/debian-preseed-workbench/blob/main/readme.de.md)

## Instructions

1. Open any file manager of your choice.

1. Navigate to the home directory of your current user.

1. Right-click in the directory area and select "Run terminal here" (or similar).

1. Update the system with the following commands:
   ```shell
   apt -y update
   apt -y upgrade
   ```

1. Download the Git repository with the following commands:
   ```shell
   apt -y install git
   git clone https://github.com/michel-abele/debian-preseed-workbench.git ~/preseed
   ```
   _You may need root privileges to execute the commands, use the commands `su` or `sudo`._

1. If you need files to be copied into the ISO file, copy them into the directory: `~/preseed/files`. All files in this folder will automatically be copied to the ISO file and will be located under : `/cdrom/files`, available during installation.

1. Download the latest ISO file from the Debian website and save it as `debian.iso`, in the directory `~/preseed`.

   - Complete ISO file:
     ```shell
     apt -y install wget
     wget -O ./debian.iso https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/debian-12.5.0-amd64-DVD-1.iso
     ```
     _You may need root privileges to execute the commands, use the commands `su` or `sudo`._

     or

   - minimal ISO file (Net-install):
     ```shell
     apt -y install wget
     wget -O ./debian.iso https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.5.0-amd64-netinst.iso
     ```
     _You may need root privileges to execute the commands, use the commands `su` or `sudo`._

1. Now you can customize the file `preseed.cfg` according to your needs.

1. If you have completed all the previous steps, you can now make the file `preseed.sh` executable and run it.
   ```shell
   chmod +x ./preseed.sh
   ./preseed.sh
   ```
   _You may need root privileges to execute the commands, use the commands `su` or `sudo`._

1. If you do not need the ISO file for a VM, you still need to create a bootable installation medium.
   ```shell
   dd if=./preseed-debian.iso of=/dev/sdX bs=4M status=progress && sync
   ```
   _You must replace the drive directory `sdX` with the corresponding device directory._
   _You may need root privileges to execute the commands, use the commands `su` or `sudo`._

## Support

If you would like to support my work, you are welcome to donate, give me a star or follow me.

![GitHub followers](https://img.shields.io/github/followers/michel-abele?style=for-the-badge&logo=github&link=https%3A%2F%2Fgithub.com%2Fmichel-abele)
![GitHub Repo stars](https://img.shields.io/github/stars/michel-abele/debian-preseed-workbench?style=for-the-badge&logo=github&link=https%3A%2F%2Fgithub.com%2Fmichel-abele%2Fdebian-preseed-workbench%2Fstargazers)
![Static Badge](https://img.shields.io/badge/Me-logo?style=for-the-badge&logo=PayPal&logoColor=%23ffffff&label=PayPal&color=%23003087&link=https%3A%2F%2Fwww.paypal.com%2Fpaypalme%2FMichelAbele)
![Static Badge](https://img.shields.io/badge/Donate-logo?style=for-the-badge&logo=Ko-fi&logoColor=%23ffffff&label=Ko-fi&color=%23ff5e5b&link=https%3A%2F%2Fko-fi.com%2Fmichelabele)

If you need help:

- For small requests, just send me an e-mail and I will respond.
- For larger requests or orders, use one of the following links.

![Static Badge](https://img.shields.io/badge/Membership-logo?style=for-the-badge&logo=Patreon&logoColor=%23ffffff&label=Patreon&color=%23000000&link=https%3A%2F%2Fpatreon.com%2FMichelAbele)
