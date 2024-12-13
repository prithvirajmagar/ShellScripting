#!/bin/bash

# Variables
BACKUP_FILE="/path/to/your/backup/backup_filename.tar.gz" # Specify the backup file
RESTORE_DIR="/path/to/restore/directory"                  # Specify where to restore the data

# Make the restore directory if it doesn't exist
mkdir -p "$RESTORE_DIR"

# Restore the backup
tar -xzvf "$BACKUP_FILE" -C "$RESTORE_DIR"

# Optional: Logging
echo "Restored from $BACKUP_FILE to $RESTORE_DIR on $(date)" >> /var/log/restore.log

# Inform the user
echo "Restoration completed."
