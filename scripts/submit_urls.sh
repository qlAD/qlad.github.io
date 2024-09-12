#!/bin/bash

# Set the path to the sitemap file
SITEMAP_PATH="../public/zh-cn/sitemap.xml"

# Ensure BAIDU_API_URL is set
if [ -z "$BAIDU_API_URL" ]; then
  echo "Error: The BAIDU_API_URL environment variable is not set."
  exit 1
fi

# Extract all URLs from sitemap.xml and save them to urls.txt
echo "Extracting URLs from sitemap.xml..."
grep -oP '(?<=<loc>).*?(?=</loc>)' "$SITEMAP_PATH" > urls.txt

URL_COUNT=$(wc -l < urls.txt)
echo "Extracted $URL_COUNT URLs and saved them to urls.txt."

# Use curl to submit all URLs in urls.txt to Baidu
echo "Submitting URLs to Baidu..."
response=$(curl -s -H 'Content-Type:text/plain' --data-binary @urls.txt "$BAIDU_API_URL")

# Print the response from the curl command
echo "Response from Baidu: $response"

echo "Submission completed!"
