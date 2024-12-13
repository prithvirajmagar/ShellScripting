#!/bin/bash

# Variables
BACKUP_SOURCE="/path/to/your/backup/"               # Path to the backup location
RESTORE_DIR="/path/to/restore/directory/"           # Directory to restore files to
EXCLUDE_FILE="/path/to/exclude/file.txt"            # Optional: specify a file with rules to exclude certain files/directories

# Make the restore directory if it doesn't exist
mkdir -p "$RESTORE_DIR"

# Restore using rsync
rsync -av --delete "$BACKUP_SOURCE" "$RESTORE_DIR"   # Remove --delete if you don't want to delete existing files in RESTORE_DIR

# Optional: Log the output
echo "Restored from $BACKUP_SOURCE to $RESTORE_DIR on $(date)" >> /var/log/restore.log

# Inform the user
echo "Restoration completed."
