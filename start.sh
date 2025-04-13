#!/bin/bash

# Set up AdGuardHome
if [ ! -f "/opt/adguardhome/AdGuardHome" ]; then
    echo "Installing AdGuard Home..."
    mkdir -p /opt/adguardhome
    cd /opt/adguardhome
    wget https://github.com/AdguardTeam/AdGuardHome/releases/latest/download/AdGuardHome_linux_amd64.tar.gz
    tar -xzf AdGuardHome_linux_amd64.tar.gz
    rm AdGuardHome_linux_amd64.tar.gz
    mv AdGuardHome/AdGuardHome .
    rm -rf AdGuardHome
fi

# Copy default config if not exist
if [ ! -f "/opt/adguardhome/AdGuardHome.yaml" ]; then
    cp /app/adguard/AdGuardHome.yaml /opt/adguardhome/AdGuardHome.yaml
fi

# Start AdGuard Home
chmod +x /opt/adguardhome/AdGuardHome
/opt/adguardhome/AdGuardHome -c /opt/adguardhome/AdGuardHome.yaml -w /opt/adguardhome/work -l /opt/adguardhome/logs
