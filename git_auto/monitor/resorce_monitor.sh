#!/bin/bash

# Define date format for report filenames
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="performance_report_${DATE}.txt"
ORPHAN_PROCESSES_FILE="orphan_processes_${DATE}.txt"

# Function to monitor system resources
monitor_resources() {
    echo "=== Resource Usage Report ===" > "$REPORT_FILE"
    echo "Date: $(date)" >> "$REPORT_FILE"
    echo >> "$REPORT_FILE"

    # CPU usage
    echo "CPU Usage:" >> "$REPORT_FILE"
    mpstat 1 1 | tail -n +4 >> "$REPORT_FILE"  # Requires sysstat package
    echo >> "$REPORT_FILE"

    # Memory usage
    echo "Memory Usage:" >> "$REPORT_FILE"
    free -h >> "$REPORT_FILE"
    echo >> "$REPORT_FILE"

    # Disk usage
    echo "Disk Usage:" >> "$REPORT_FILE"
    df -h >> "$REPORT_FILE"
    echo >> "$REPORT_FILE"

    echo "Report generated: $REPORT_FILE"
}

# Function to identify and clean up orphan processes
cleanup_orphan_processes() {
    # Find orphan processes (zombie processes)
    echo "=== Orphan Processes Report ===" > "$ORPHAN_PROCESSES_FILE"
    echo "Date: $(date)" >> "$ORPHAN_PROCESSES_FILE"
    
    # List orphan processes (zombie processes)
    orphan_processes=$(ps aux | awk '{ if ($8 == "Z") print }')

    if [ -n "$orphan_processes" ]; then
        echo "$orphan_processes" >> "$ORPHAN_PROCESSES_FILE"
        echo "Orphan processes found and logged: $ORPHAN_PROCESSES_FILE"
        
        # Attempt to clean orphan processes (this only works if the parent process is found)
        echo "Attempting to clean up orphan processes..."
        
        pids=$(echo "$orphan_processes" | awk '{print $2}')
        for pid in $pids; do
            echo "Killing parent of orphan with PID: $pid"
            # This command will attempt to kill the parent process
            # Uncomment the following line to enable killing (use with caution)
            # kill -9 $(ps -o ppid= -p $pid)
        done
    else
        echo "No orphan processes found." >> "$ORPHAN_PROCESSES_FILE"
    fi
}

# Main Execution
monitor_resources
cleanup_orphan_processes
