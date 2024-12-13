#!/bin/bash

# Variables
KEY_NAME="${1:-id_rsa}"  # Default key name to id_rsa
KEY_PATH="$HOME/.ssh/$KEY_NAME"
TARGET_USER="$2"          # Target username for keys distribution
TARGET_HOST="$3"          # Target host for keys distribution

# Generate SSH key pair if it doesn't already exist
if [ ! -f "$KEY_PATH" ]; then
    echo "Generating SSH key pair..."
    ssh-keygen -t rsa -b 4096 -f "$KEY_PATH" -N ""
    echo "SSH key pair created: $KEY_PATH and ${KEY_PATH}.pub"
else
    echo "SSH key pair already exists at $KEY_PATH."
fi

# Copy public key to target host (using SSH)
if [[ -n "$TARGET_USER" && -n "$TARGET_HOST" ]]; then
    echo "Copying public key to $TARGET_USER@$TARGET_HOST..."
    ssh-copy-id -i "${KEY_PATH}.pub" "$TARGET_USER@$TARGET_HOST"
    echo "Public key copied successfully."
fi

echo "SSH key management completed."
