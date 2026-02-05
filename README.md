# DS OTA Backup

Automated backup script for Nintendo DS save files over FTP.

Downloads new/changed `.sav` files from your modded DS (via ftpd), creates timestamped snapshots using hard-links, and preserves every unique save state.

# Usage

Configure `NDS_IP`, `NDS_PORT`, and `REMOTE_DIR` at the top of `backup.sh`, then run it whenever you want to capture your current save states.

> [!TIP]
> If you need help connecting to your DS Lite, read [DS Lite Private AP](https://github.com/Inevitabby/DS-Lite-Private-AP)

# Limitations

- Assumes a flat-file structure.
- Initial sync may be slow depending on game library size.
