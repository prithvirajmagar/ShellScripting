#!/bin/bash

# Variables
SOURCE_FILE="$1"  # Source file path as first argument
TARGET_USER="$2"   # Target username as second argument
TARGET_HOST="$3"   # Target host as third argument
TARGET_DIR="${4:-/home/$TARGET_USER}"  # Target directory, default to user's home directory

# Check if all required arguments are provided
if [ -z "$SOURCE_FILE" ] || [ -z "$TARGET_USER" ] || [ -z "$TARGET_HOST" ]; then
    echo "Usage: $0 <source_file> <target_user> <target_host> [target_directory]"
    exit 1
fi

# Transfer the file using SCP
echo "Transferring $SOURCE_FILE to $TARGET_USER@$TARGET_HOST:$TARGET_DIR..."
scp "$SOURCE_FILE" "$TARGET_USER@$TARGET_HOST:$TARGET_DIR"

if [ $? -eq 0 ]; then
    echo "File transferred successfully."
else
    echo "File transfer failed."
fi
