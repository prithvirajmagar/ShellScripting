#!/bin/bash

# Variables
TARGET="$1"  # Take target from command line argument
OUTPUT_FILE="scan_results.txt"

# Check if target is provided
if [ -z "$TARGET" ]; then
    echo "Usage: $0 <target_ip_or_hostname>"
    exit 1
fi

# Run Nmap security scan
echo "Starting security scan on $TARGET..."
nmap -sV -oN "$OUTPUT_FILE" "$TARGET"

# Report results
echo "Security scan completed. Results saved in $OUTPUT_FILE."
