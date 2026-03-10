#!/bin/bash

# backup original file
if [ -f /etc/apt/sources.list.d/ubuntu.sources ]; then
    cp /etc/apt/sources.list.d/ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources.bak
fi

# setup aliyun apt source
tee /etc/apt/sources.list.d/ubuntu.sources > /dev/null << 'EOF'
Types: deb deb-src
URIs: https://mirrors.aliyun.com/ubuntu/
Suites: noble noble-security noble-updates noble-backports
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF