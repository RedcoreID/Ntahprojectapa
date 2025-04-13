#!/bin/bash

set -e

# Set up AdGuard Home
if [ ! -f "/opt/adguardhome/AdGuardHome" ]; then
    echo "Installing AdGuard Home..."
    mkdir -p /opt/adguardhome
    cd /opt/adguardhome || exit 1
    wget https://github.com/AdguardTeam/AdGuardHome/releases/latest/download/AdGuardHome_linux_amd64.tar.gz
    tar -xzf AdGuardHome_linux_amd64.tar.gz
    rm AdGuardHome_linux_amd64.tar.gz

    # Cek apakah file AdGuardHome sudah ada
    if [ ! -f "AdGuardHome" ]; then
        echo "Error: File AdGuardHome tidak ditemukan setelah ekstrak."
        exit 1
    fi
fi

# Copy default config if not exist
if [ ! -f "/opt/adguardhome/AdGuardHome.yaml" ]; then
    cp /app/adguard/AdGuardHome.yaml /opt/adguardhome/AdGuardHome.yaml
fi

# Buat folder work dan logs jika belum ada
mkdir -p /opt/adguardhome/work
mkdir -p /opt/adguardhome/logs

# Start AdGuard Home
chmod +x /opt/adguardhome/AdGuardHome
/opt/adguardhome/AdGuardHome -c /opt/adguardhome/AdGuardHome.yaml -w /opt/adguardhome/work -l /opt/adguardhome/logs
