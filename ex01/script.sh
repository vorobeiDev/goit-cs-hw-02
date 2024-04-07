#!/bin/bash

sites=("https://google.com" "https://facebook.com" "https://twitter.com")

filename="website_status.log"

> "$filename"

for site in "${sites[@]}"
do
    if curl -o /dev/null -s -L --head --request GET -w "%{http_code}\n" "$site" | grep "200" > /dev/null
    then
        echo "$site is UP" >> "$filename"
    else
        echo "$site is DOWN" >> "$filename"
    fi
done

echo "Result written to $filename"