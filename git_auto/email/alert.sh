#!/bin/bash

# Email configuration
EMAIL="your_email@example.com"
SUBJECT_SUCCESS="Script Success Notification"
SUBJECT_FAILURE="Script Failure Notification"

# Command to execute (replace with your command)
COMMAND="your_command_here"

# Execute the command
if $COMMAND; then
    echo "Command executed successfully!" | mail -s "$SUBJECT_SUCCESS" "$EMAIL"
else
    echo "Command failed to execute." | mail -s "$SUBJECT_FAILURE" "$EMAIL"
fi
