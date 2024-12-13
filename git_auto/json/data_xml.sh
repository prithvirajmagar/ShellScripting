#!/bin/bash

# URL of the REST API
API_URL="http://www.example.com/xml-endpoint"

# XML data to be submitted
xml_data='<note>
    <to>Tove</to>
    <from>Jani</from>
    <heading>Reminder</heading>
    <body>Don\'t forget me this weekend!</body>
</note>'

# Submit data using POST request
response=$(curl -s -X POST -H "Content-Type: application/xml" -d "$xml_data" "$API_URL")

# Check if the response is not empty
if [ -z "$response" ]; then
    echo "No response from the API."
    exit 1
fi

# Display the response
echo "Response from the API after submission:"
echo "$response" | xmlstarlet fo
