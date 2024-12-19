#!/bin/bash
set -e 
echo "Fetching configuration from Azure App Configuration..."
#variables 
APP_CONFIG_CONNECTION_STRING="Endpoint=https://appconfig-init-poc-01.azconfig.io;Id=blUn;Secret=FGPe94y7BZs52OJzdZlnFCPtM3qwFQiPj2hgWREHQneYYFSs1MI3JQQJ99ALAC5RqLJ9DKtpAAACAZAC9y9d"
OUTPUT_FILE="/shared/config.json"
# Fetch key-value pairs from App Configuration
az appconfig kv list --connection-string "$APP_CONFIG_CONNECTION_STRING" --query '[].{key:key, value:value}' -o json > "$OUTPUT_FILE"
echo "Configuration saved to $OUTPUT_FILE"
