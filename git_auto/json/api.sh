#!/bin/bash

# URL of the REST API
API_URL="https://jsonplaceholder.typicode.com/posts"

# JSON data to be submitted
json_data='{
    "title": "foo",
    "body": "bar",
    "userId": 1
}'

# Submit data using POST request
response=$(curl -s -X POST -H "Content-Type: application/json" -d "$json_data" "$API_URL")

# Check if the response is not empty
if [ -z "$response" ]; then
    echo "No response from the API."
    exit 1
fi

# Display the response
echo "Response from the API after submission:"
echo "$response" | jq '.'
