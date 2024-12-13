#!/bin/bash

# Variables
BACKUP_SOURCE="/path/to/data"
BACKUP_DEST="/path/to/backup/directory"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILENAME="backup_$TIMESTAMP.tar.gz"

# Create a backup
tar -czvf "$BACKUP_DEST/$BACKUP_FILENAME" "$BACKUP_SOURCE"

# Optional: delete backups older than 7 days
find "$BACKUP_DEST" -type f -name "backup_*.tar.gz" -mtime +7 -exec rm {} \;
