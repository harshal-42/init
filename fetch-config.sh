#!/bin/bash
set -e 
echo "Fetching configuration from Azure App Configuration..."
#variables 
APP_CONFIG_CONNECTION_STRING="Endpoint=https://appconfig-cis-cel-sit-02.azconfig.io;Id=KAZJ;Secret=8Mjo7PKZxOleUqdC4EpG9xyzebgQ77FtNmvh9OIsV7DQTEizqcuLJQQJ99BAAC5RqLJ9DKtpAAACAZACIuKp"
OUTPUT_FILE="/shared/config.json"
# Fetch key-value pairs from App Configuration
az appconfig kv list --connection-string "$APP_CONFIG_CONNECTION_STRING" --query '[].{key:key, value:value}' -o json > "$OUTPUT_FILE"
echo "Configuration saved to $OUTPUT_FILE"
