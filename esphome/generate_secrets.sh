#!/bin/bash

# Function to generate a secure Base64 key (32 bytes, for api_key)
generate_base64_key() {
  head -c 32 /dev/urandom | base64
}

# Function to generate a secure alphanumeric password with printable ASCII characters
generate_password() {
  openssl rand -base64 48 | cut -c1-${1}
}

# Prompt for WiFi SSID and Password or use placeholders
read -p "Enter your WiFi SSID (default: YourWiFiSSID): " wifi_ssid
wifi_ssid=${wifi_ssid:-YourWiFiSSID}

read -p "Enter your WiFi Password (default: YourWiFiPassword): " wifi_password
wifi_password=${wifi_password:-YourWiFiPassword}

# Generate the other values
api_key=$(generate_base64_key)
ota_password=$(generate_password 16)
ap_password=$(generate_password 16)

# Populate the secrets.yaml file
cat <<EOF > secrets.yaml
# NOTE:
# Auto-generated secrets.yaml file. Do not share this file publicly.

api_key: "$api_key"
ota_password: "$ota_password"
wifi_ssid: "$wifi_ssid"
wifi_password: "$wifi_password"
ap_password: "$ap_password"
EOF

echo "secrets.yaml has been successfully created with secure values."

