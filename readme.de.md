[<< zurück](https://github.com/michel-abele/debian-preseed-workbench)

![GitHub last commit (branch)](https://img.shields.io/github/last-commit/michel-abele/debian-preseed-workbench/main?logo=github&label=last%20commit%3A%20main)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/michel-abele/debian-preseed-workbench/work?logo=github&label=last%20commit%3A%20work)

# Debian-Preseed-Werkbank
Eine Werkbankvorlage für die Erstellung von Debian-Preseed-ISOs.

![Static Badge](https://img.shields.io/badge/12-logo?logo=Debian&logoColor=%23ffffff&label=Debian&color=%23A81D33)

## Anweisungen

1. Öffne einen beliebigen Dateimanager deiner Wahl.

1. Wechsel in das Home-Verzeichnis deines aktuellen Benutzers.

1. Klicke mit der rechten Maustaste in den Verzeichnisbereich und wähle "Terminal hier ausführen" (oder ähnlich) aus.

1. Bringe mit den folgenden Kommandos das System auf den neusten Stand:
   ```shell
   apt -y update
   apt -y upgrade
   ```

1. Lade mit den folgenden Kommandos das Git-Repository herunter:
   ```shell
   apt -y install git
   git clone https://github.com/michel-abele/debian-preseed-workbench.git ~/preseed
   ```
   _Du benötigst möglicherweise root-Rechte, um die Kommandos auszuführen, verwende dazu die Befehle `su` oder `sudo`._

1. Wenn Du Dateien benötigst, die in die ISO-Datei kopiert werden müssen, kopiere diese in das Verzeichnis: `~/preseed/files`. Alle Dateien in diesem Ordner werden automatisch mit in die ISO-Datei kopiert und stehen wärend der Installation unter: `/cdrom/files`, zur Verfügung.

1. Lade die aktuelle ISO-Datei von der Debian-Webseite herunter und speichere es als `debian.iso`, im Verzeichnis `~/preseed`, ab.

   - Vollständige ISO-Datei:
     ```shell
     apt -y install wget
     wget -O ./debian.iso https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/debian-12.5.0-amd64-DVD-1.iso
     ```
     _Du benötigst möglicherweise root-Rechte, um die Kommandos auszuführen, verwende dazu die Befehle `su` oder `sudo`._

     oder

   - minimale ISO-Datei (Net-install):
     ```shell
     apt -y install wget
     wget -O ./debian.iso https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.5.0-amd64-netinst.iso
     ```
     _Du benötigst möglicherweise root-Rechte, um die Kommandos auszuführen, verwende dazu die Befehle `su` oder `sudo`._

1. Nun kannst Du die Datei `preseed.cfg` nach deinen Bedürfnissen anpassen.

1. Wenn Du alle vorherigen Schritte durchgeführt hast, kannst Du jetzt die Datei `preseed.sh` ausführbar machen und ausführen:
   ```shell
   chmod +x ./preseed.sh
   ./preseed.sh
   ```
   _Du benötigst möglicherweise root-Rechte, um die Kommandos auszuführen, verwende dazu die Befehle `su` oder `sudo`._

1. Wenn Du die ISO-Datei nicht für eine VM benötigst, musst Du noch ein bootfähiges Installationsmedium erstellen.
   ```shell
   dd if=./preseed-debian.iso of=/dev/sdX bs=4M status=progress && sync
   ```
   _Du musst das Laufwerksverzeichnis `sdX` durch das entsprechende Geräteverzeichnis ersetzen._
   _Du benötigst möglicherweise root-Rechte, um die Kommandos auszuführen, verwende dazu die Befehle `su` oder `sudo`._
