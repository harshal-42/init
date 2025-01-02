#!/bin/bash
set -e 
echo "Fetching configuration from Azure App Configuration..."
#variables 
APP_CONFIG_CONNECTION_STRING="Endpoint=https://appconfig-cis-cel-sit-02.azconfig.io;Id=KAZJ;Secret=8Mjo7PKZxOleUqdC4EpG9xyzebgQ77FtNmvh9OIsV7DQTEizqcuLJQQJ99BAAC5RqLJ9DKtpAAACAZACIuKp"
OUTPUT_FILE="/shared/config.json"
# Fetch key-value pairs from App Configuration
CONFIG_VALUES=$(az appconfig kv list --connection-string "$APP_CONFIG_CONNECTION_STRING" --query '[].{key:key, value:value}' -o json)

# Parse and export as environment variables
echo "$CONFIG_VALUES" | jq -r '.[] | "\(.key)=\(.value)"' > /shared/config.env

echo "Configuration saved to $/shared/config.env"
