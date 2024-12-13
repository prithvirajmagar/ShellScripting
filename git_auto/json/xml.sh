#!/bin/bash

# URL of the REST API
API_URL="https://www.w3schools.com/xml/note.xml"

# Fetch data from the API
response=$(curl -s "$API_URL")

# Check if the response is not empty
if [ -z "$response" ]; then
    echo "No data retrieved from the API."
    exit 1
fi

# Process and display the data using xmlstarlet
echo "Fetched XML data:"
echo "$response"

# Extract specific fields (e.g., from field)
from=$(echo "$response" | xmlstarlet sel -t -v "//from")

echo "From: $from"
