#!/bin/bash

# Set the path to the sitemap file
SITEMAP_PATH="zh-cn/sitemap.xml"

# Ensure BAIDU_API_URL is set
if [ -z "$BAIDU_API_URL" ]; then
  echo "Error: The BAIDU_API_URL environment variable is not set."
  exit 1
fi

# Extract URLs from sitemap.xml
echo "Extracting URLs from sitemap.xml..."
grep -oP '(?<=<loc>).*?(?=</loc>)' "$SITEMAP_PATH" > urls.txt

URL_COUNT=$(wc -l < urls.txt)
echo "Extracted $URL_COUNT URLs and saved them to urls.txt."

# Select the top 10 URLs (assuming sitemap.xml is already time-sorted)
echo "Selecting the top 10 URLs..."
head -n 10 urls.txt > recent_urls.txt

SELECTED_URL_COUNT=$(wc -l < recent_urls.txt)
echo "Selected $SELECTED_URL_COUNT URLs and saved them to recent_urls.txt."

# Use curl to submit the selected URLs to Baidu
echo "Submitting recent URLs to Baidu..."
response=$(curl -s -H 'Content-Type:text/plain' --data-binary @recent_urls.txt "$BAIDU_API_URL")

# Print the response from the curl command
echo "Response from Baidu: $response"

echo "Submission completed!"
