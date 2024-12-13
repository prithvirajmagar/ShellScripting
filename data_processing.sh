#!/bin/bash

total_age=0
count=0

while IFS=',' read -r name age city; do
  if [[ "$name" != "Name" ]]; then  # Skip header
    total_age=$((total_age + age))
    count=$((count + 1))
  fi
done < data.csv

if (( count > 0 )); then
  average_age=$(echo "scale=2; $total_age / $count" | bc)
  echo "Average Age: $average_age"
else
  echo "No data to process."
fi

####################################

#!/bin/bash
#counting ip addresses

echo "Counting unique IP addresses in access.log"
unique_ips=$(awk '{print $1}' access.log | sort | uniq | wc -l)
echo "Unique IP Addresses: $unique_ips"

#####################################
#!/bin/bash
# rename files in bulk
for i in {1..10}; do
  mv "file$i.txt" "document$i.txt"
done

echo "Files renamed successfully."
