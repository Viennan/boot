#!/bin/bash

set -e

mkdir -p ${USER_REPOS_PATH}/nv-codec-headers
wget -O ${USER_REPOS_PATH}/nv-codec-headers/n13.0.19.0.tar.gz https://github.com/FFmpeg/nv-codec-headers/archive/refs/tags/n13.0.19.0.tar.gz

mkdir -p ${USER_REPOS_PATH}/nv-codec-headers/13.0.19
tar -xzvf ${USER_REPOS_PATH}/nv-codec-headers/n13.0.19.0.tar.gz --strip-components=1 -C ${USER_REPOS_PATH}/nv-codec-headers/13.0.19

cd ${USER_REPOS_PATH}/nv-codec-headers/13.0.19
make install PREFIX=${USER_LIB_PATH}/ffnvcodec/13.0.19
