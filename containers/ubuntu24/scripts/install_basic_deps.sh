#!/bin/bash

set -e

apt-get update

# basic tools
apt-get install --no-install-recommends -y \
    sudo \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    nano \
    cmake \
    ninja-build \
    pkg-config \
    dpkg-dev \
    libc6-dev \
    make \
    gcc-14 g++-14 gdb \
    python3 \
    python3-pip \
    python3-dev \
    ssh \
    git \
    wget \
    curl \
    unzip \
    zip

# use gcc-14 and g++-14
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 140
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 140

# install llvm-21
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
    && echo "deb https://apt.llvm.org/noble/ llvm-toolchain-noble-21 main" >> /etc/apt/sources.list.d/llvm.list \
    && echo "deb-src https://apt.llvm.org/noble/ llvm-toolchain-noble-21 main" >> /etc/apt/sources.list.d/llvm.list

apt-get update && apt-get install --no-install-recommends -y \
    clang-21 \
    clangd-21 \
    clang-tidy-21 \
    clang-format-21 \
    clang-tools-21 \
    lld-21 \
    lldb-21 \
    libc++-21-dev \
    libc++abi-21-dev

update-alternatives --install /usr/bin/clang clang /usr/bin/clang-21 100 \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-21 100 \
    && update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-21 100 \
    && update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-21 100 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-21 100 \
    && update-alternatives --install /usr/bin/lld lld /usr/bin/lld-21 100 \
    && update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-21 100

apt-get clean && rm -rf /var/lib/apt/lists/*
