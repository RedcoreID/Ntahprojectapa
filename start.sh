#!/bin/bash

# Set up AdGuard Home
if [ ! -f "/opt/adguardhome/AdGuardHome" ]; then
    echo "Installing AdGuard Home..."
    mkdir -p /opt/adguardhome
    cd /opt/adguardhome
    wget https://github.com/AdguardTeam/AdGuardHome/releases/latest/download/AdGuardHome_linux_amd64.tar.gz
    tar -xzf AdGuardHome_linux_amd64.tar.gz --strip-components=1
    rm AdGuardHome_linux_amd64.tar.gz
fi

# Copy default config if not exist
if [ ! -f "/opt/adguardhome/AdGuardHome.yaml" ]; then
    cp /app/adguard/AdGuardHome.yaml /opt/adguardhome/AdGuardHome.yaml
fi

# Start AdGuard Home
/opt/adguardhome/AdGuardHome -c /opt/adguardhome/AdGuardHome.yaml -w /opt/adguardhome/work -l /opt/adguardhome/logs
