#!/bin/bash

# Function to validate input
validate_input() {
    local input="$1"
    if [[ "$input" =~ ^[0-9]+$ ]]; then
        return 0  # Valid input
    else
        return 1  # Invalid input
    fi
}

# Prompting user for input
echo "Welcome to the interactive script!"
read -p "Please enter a positive integer: " user_input

# Validate user input
if validate_input "$user_input"; then
    echo "Thank you for entering a valid number: $user_input"
else
    echo "Error: '$user_input' is not a valid positive integer!"
    exit 1
fi

# Providing output messages/logs
echo "Processing your input..."
sleep 1  # Simulate some processing time
echo "You have entered the number: $user_input"

# Example additional processing or logging
log_file="user_input_log.txt"
echo "$(date '+%Y-%m-%d %H:%M:%S') - User entered: $user_input" >> "$log_file"

echo "Your input has been logged. Thank you!"
