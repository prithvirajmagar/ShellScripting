#!/bin/bash

# Log file path
LOG_FILE="/var/log/backup_script.log"
# Email address for notifications
EMAIL="your_email@example.com"

# Function to log messages with a timestamp
log_message() {
    local MESSAGE="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $MESSAGE" >> "$LOG_FILE"
}

# Function to send email notification
send_notification() {
    local SUBJECT="$1"
    local BODY="$2"
    echo "$BODY" | mail -s "$SUBJECT" "$EMAIL"
}

# Function to perform backup
perform_backup() {
    local SOURCE_DIR="$1"
    local DEST_DIR="$2"
    local TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
    local BACKUP_FILE="${DEST_DIR}/backup_${TIMESTAMP}.tar.gz"

    # Check if source directory exists
    if [[ ! -d "$SOURCE_DIR" ]]; then
        log_message "ERROR: Source directory $SOURCE_DIR does not exist."
        send_notification "Backup Failure Alert" "Source directory $SOURCE_DIR does not exist. Backup failed."
        exit 1
    fi

    # Perform the backup
    tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" . 2>>"$LOG_FILE"
    if [[ $? -eq 0 ]]; then
        log_message "SUCCESS: Backup of $SOURCE_DIR completed successfully. Backup file: $BACKUP_FILE"
    else
        log_message "ERROR: Backup of $SOURCE_DIR failed."
        send_notification "Backup Failure Alert" "Backup of $SOURCE_DIR failed. Check logs at $LOG_FILE for details."
    fi
}

# Usage information
show_usage() {
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
}

# Check the number of arguments
if [[ $# -ne 2 ]]; then
    show_usage
fi

SOURCE_DIR="$1"
DEST_DIR="$2"

# Perform the backup
perform_backup "$SOURCE_DIR" "$DEST_DIR"
