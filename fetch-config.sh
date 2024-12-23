#!/bin/bash
set -e 
echo "Fetching configuration from Azure App Configuration..."
#variables 
APP_CONFIG_CONNECTION_STRING="Endpoint=https://appconfig-init-poc.azconfig.io;Id=luRf;Secret=BvlPXVdpk0MhWCRNJAQjWlHYB8pEwJjZCmQiNx0wAhHTsB07IPIxJQQJ99ALAC5RqLJ9DKtpAAACAZAC2FqM"
OUTPUT_FILE="/shared/config.json"
# Fetch key-value pairs from App Configuration
az appconfig kv list --connection-string "$APP_CONFIG_CONNECTION_STRING" --query '[].{key:key, value:value}' -o json > "$OUTPUT_FILE"
echo "Configuration saved to $OUTPUT_FILE"
