![GitHub last commit](https://img.shields.io/github/last-commit/michel-abele/debian-preseed-workbench?style=for-the-badge)

# Debian preseed workbench
A workbench template for Debian Preseed creation.

![Static Badge](https://img.shields.io/badge/12-logo?style=for-the-badge&logo=Debian&logoColor=%23ffffff&label=Debian&color=%23A81D33)

## Instructions

1. Open any file manager of your choice.

2. Navigate to the home directory of your current user.

3. Execute the following commands:
   ```shell
   apt -y install git
   git clone https://github.com/michel-abele/debian-preseed-workbench.git ~/preseed
   ```
   _You may need root rights to execute the commands, use the `su` or `sudo` commands._

4. You can then copy the required files into the **~/preseed/files** directory.

5. Download the current ISO from the [Debian website] and copy it as **debian.iso** into the directory **~/preseed**.
   ```shell
   apt -y install wget
   wget -O ./debian.iso https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.5.0-amd64-netinst.iso
   ```

6. Now you can customize the **preseed.cfg** file according to your requirements.

7. Once you have completed all the previous steps, you can now make the **preseed.sh** file executable and run it.
   ```shell
   chmod +x ./preseed.sh
   ./preseed.sh
   ```
   _You may need root rights to execute the commands, use the `su` or `sudo` commands._

8. Now you can create the bootable installation medium.
   ```shell
   dd if=preseed-debian.iso of=/dev/sdX bs=4M status=progress && sync
   ```
   _You may need root rights to execute the commands, use the `su` or `sudo` commands._<br>
   _You must replace the `sdX` drive with the corresponding device._

## Support my work with a donation or simply say thank you by leaving me a star or a follow.

![GitHub followers](https://img.shields.io/github/followers/michel-abele?style=for-the-badge&logo=github&link=https%3A%2F%2Fgithub.com%2Fmichel-abele)
![GitHub Repo stars](https://img.shields.io/github/stars/michel-abele/debian-preseed-workbench?style=for-the-badge&logo=github&link=https%3A%2F%2Fgithub.com%2Fmichel-abele%2Fdebian-preseed-workbench%2Fstargazers)
![Static Badge](https://img.shields.io/badge/Me-logo?style=for-the-badge&logo=PayPal&logoColor=%23ffffff&label=PayPal&color=%23003087&link=https%3A%2F%2Fwww.paypal.com%2Fpaypalme%2FMichelAbele)
![Static Badge](https://img.shields.io/badge/Donate-logo?style=for-the-badge&logo=Ko-fi&logoColor=%23ffffff&label=Ko-fi&color=%23ff5e5b&link=https%3A%2F%2Fko-fi.com%2Fmichelabele)
![Static Badge](https://img.shields.io/badge/Membership-logo?style=for-the-badge&logo=Patreon&logoColor=%23ffffff&label=Patreon&color=%23000000&link=https%3A%2F%2Fpatreon.com%2FMichelAbele)
