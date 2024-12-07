#!/bin/bash
#!/bin/bash

# This script gets the first 10 biggest files in the specified file system path
if [ $# -ne 1 ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

path="$1"
echo "Scanning for the largest files in: $path"

# Use du to get sizes, sort them, and take the top 10
du -ah "$path" 2>/dev/null | sort -hr | head -n 10 > /tmp/filesize.txt

echo "This is the list of the top 10 biggest files in the file system $path:"
cat /tmp/filesize.txt

