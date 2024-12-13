#!/bin/bash

# URL of the REST API
API_URL="https://jsonplaceholder.typicode.com/posts"

# Fetch data from the API
response=$(curl -s "$API_URL")

# Check if the response is not empty
if [ -z "$response" ]; then
    echo "No data retrieved from the API."
    exit 1
fi

# Process and display the data using jq
echo "Fetched JSON data:"
echo "$response" | jq '.'

# Extract specific fields (e.g., title of first post)
title=$(echo "$response" | jq -r '.[0].title')

echo "Title of the first post: $title"
