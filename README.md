# DS OTA Save Backups

Automated backup script for Nintendo DS save files over FTP.

Downloads `.sav` files from a modded DS, compared them against latest local backups, and archives only the changes files with timestamped versioning.

# Requirements

**Host**
- wget

**DS**
- FTP server homebrew, such as [ftpd](https://github.com/mtheall/ftpd)

# Usage

1. Open `NDS_BACKUP` and configure the following variables:
	- `NDS_ADDR`: IP address and port of the DS
	- `NDS_DIR`: Path to the save directory on the DS
2. Ensure your computer and DS are on the same network.

> [!TIP]
> If you need help connecting to your DS Lite, read [DS Lite Private AP](https://github.com/Inevitabby/DS-Lite-Private-AP)

3. Start the FTP server on your DS.
4. Run the script:

```bash
./NDS_BACKUP
```

# Limitations

- Assumes a flat-file structure.
- Due to lack of `mtime` reporting or `cksum` command on FTP servers, script downloads *all* saves to a temporary staging directory to check for changes locally
