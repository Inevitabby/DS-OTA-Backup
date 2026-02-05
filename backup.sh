#!/usr/bin/env bash
cd "$(dirname "$0")" || exit

# DS OTA Save Backups

# Configuration
NDS_IP="196.168.1.230"
NDS_PORT="5000"
REMOTE_DIR="/roms/games/" # Directory on the NDS to scan
BACKUP_ROOT="./backups"  # Where to store backups locally

# Directory Structure
MIRROR_DIR="${BACKUP_ROOT}/latest"
TIMESTAMP=$(date +%Y-%m-%d_%H%M)
SNAPSHOT_DIR="${BACKUP_ROOT}/${TIMESTAMP}"

mkdir -p "${MIRROR_DIR}"

# Download new saves
echo "[1/3] Syncing to mirror..."
wget -N --unlink \
     -r -l1 -nd -A "*.sav" --ignore-case \
     -P "${MIRROR_DIR}" \
     "ftp://${NDS_IP}:${NDS_PORT}${REMOTE_DIR}"

# Create timestamped snapshot
echo "[2/3] Creating timestamped snapshot..."
mkdir -p "${SNAPSHOT_DIR}"
cp -al "${MIRROR_DIR}/." "${SNAPSHOT_DIR}/"

echo "[3/3] Backup complete: ${SNAPSHOT_DIR}"
