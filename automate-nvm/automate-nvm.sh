#!/bin/bash

owner="nvm-sh"
repo="nvm"

# Get the latest release tag using the GitHub API
latest_release_tag=$(curl -s "https://api.github.com/repos/$owner/$repo/releases/latest" | grep -oP '"tag_name": "\K[^"]+')

if [ -z "$latest_release_tag" ]; then
    echo "Failed to retrieve the latest release tag."
    exit 1
fi

# Construct the raw content URL for the install.sh file
install_sh_url="https://raw.githubusercontent.com/$owner/$repo/$latest_release_tag/install.sh"

# Download the latest install.sh script
curl -Lo install.sh "$install_sh_url"

# Make the script executable (if needed)
chmod +x install.sh

echo "Latest install.sh downloaded."

