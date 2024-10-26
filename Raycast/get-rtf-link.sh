#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Get RTF Link
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Makes HTTP request to the link from clipboard, and converts it to RTF
# @raycast.author slasyz
# @raycast.authorURL https://syrovats.ky/

# Get the URL from the macOS clipboard
url=$(pbpaste)

# Function to check if the URL is valid
is_valid_url() {
  if [[ $1 =~ ^https?:// ]]; then
    return 0
  else
    return 1
  fi
}

# Check if the URL is valid
if ! is_valid_url "$url"; then
  echo "Invalid URL"
  exit 1
fi

# Fetch the page content using curl
page_content=$(curl -s "$url")

# Extract the page title using grep and sed
page_title=$(echo "$page_content" | grep -o '<title[^>]*>[^<]*</title>' | sed -e 's/<[^>]*>//g' | head -n 1)

# Create the rich text link in HTML format
rich_text_link="<a href=\"$url\">$page_title</a>"

# Convert the HTML to RTF and copy to clipboard
echo -n "$rich_text_link" | textutil -stdin -format html -convert rtf -stdout | pbcopy

echo "Link copied to clipboard: $page_title"
