#!/bin/bash

# Email configuration
EMAIL="your_email@example.com"
SUBJECT="Resource Alert Notification"

# Define thresholds
CPU_THRESHOLD=80  # in percentage
MEMORY_THRESHOLD=80  # in percentage

# Get current CPU and memory usage
CURRENT_CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
CURRENT_MEMORY=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Check CPU usage
if (( $(echo "$CURRENT_CPU > $CPU_THRESHOLD" | bc -l) )); then
    echo "High CPU usage detected: ${CURRENT_CPU}% used" | mail -s "$SUBJECT" "$EMAIL"
fi

# Check Memory usage
if (( $(echo "$CURRENT_MEMORY > $MEMORY_THRESHOLD" | bc -l) )); then
    echo "High memory usage detected: ${CURRENT_MEMORY}% used" | mail -s "$SUBJECT" "$EMAIL"
fi

echo "Resource monitoring completed."
