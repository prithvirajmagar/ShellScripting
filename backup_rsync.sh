#!/bin/bash
# rsync used for increamental backup
# Variables
BACKUP_SOURCE="/path/to/data/"
BACKUP_DEST="/path/to/backup/directory/"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Run the rsync command
rsync -avz --delete "$BACKUP_SOURCE" "$BACKUP_DEST" 

# Optional: Log the output
echo "Backup completed at $TIMESTAMP" >> /var/log/backup.log
