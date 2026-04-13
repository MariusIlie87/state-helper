#!/bin/bash

# Remove spaces before/after text
trim() {
    echo "$1" | awk '{$1=$1};1'
}

# Hostname prompt
read -p "Hostname/s: " HOSTS_RAW

# Normalize text
HOSTS=$(echo "$HOSTS_RAW" | tr '[:upper:]' '[:lower:]' | sed 's/,/ /g' | awk '{$1=$1};1' | tr ' ' ',')

# Extract region from hostname
FIRST_HOST=$(echo "$HOSTS" | cut -d',' -f1)
REGION="${FIRST_HOST:0:3}"

# Final script 
CMD="ncpcli -r $REGION devices list-state --device-names-matching $HOSTS"

echo
echo "Running command:"
echo "$CMD"
eval "$CMD"
