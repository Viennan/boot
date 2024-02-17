#!/bin/bash

set -e

executable_dir=$(dirname "$0")
ffmpeg_dir=$(realpath "$PWD/ffmpeg")

sudo_prefix=""
if [[ $EUID -ne 0 ]]; then # 判断当前用户是否有管理员权限（非root）
    sudo_prefix="sudo" # If not add "sudo " prefix
fi

# download ffmpeg
git clone --branch n6.1.1 https://github.com/FFmpeg/FFmpeg.git "$ffmpeg_dir"

# $sudo_prefix apt update

# install dependencies
$sudo_prefix apt install -y \
    nasm \
    yasm \
    libdrm-dev \
    libopenjp2-7-dev \
    libwebp-dev \
    frei0r-plugins-dev \
    libaom-dev \
    libass-dev \
    libcodec2-dev \
    libdav1d-dev \
    libmfx-dev \
    libgsm1-dev \
    libmp3lame-dev \
    libopus-dev \
    librsvg2-dev \
    librtmp-dev \
    libshine-dev \
    libsnappy-dev \
    libspeex-dev \
    libtheora-dev \
    libtwolame-dev \
    libvorbis-dev \
    libvpx-dev \
    libx264-dev \
    libx265-dev \
    libxvidcore-dev \
    libzvbi-dev \
    libxml2-dev \
    ocl-icd-opencl-dev \
    libssl-dev \
    libvpl-dev \
    libva-dev

# install ffmpeg nv-codec-headers
# cuda tools should be installed previously
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
cd nv-codec-headers && $sudo_prefix make install && cd -
$sudo_prefix apt install -y build-essential yasm cmake libtool libc6 libc6-dev libnuma1 libnuma-dev
rm -rf nv-codec-headers

# compile ffmpeg
cd "$ffmpeg_dir"
./configure --enable-gpl \
    --enable-version3 \
    --enable-nonfree \
    --enable-shared \
    --disable-static \
    --extra-cflags=-I/usr/local/cuda/include \
    --extra-ldflags=-L/usr/local/cuda/lib64 \
    --enable-cuda-nvcc \
    --enable-libnpp \
    --enable-gray \
    --disable-htmlpages \
    --disable-podpages \
    --disable-txtpages \
    --enable-libaom \
    --enable-libcodec2 \
    --enable-libdav1d \
    --enable-libgsm \
    --enable-libmfx \
    --enable-libmp3lame \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-librsvg \
    --enable-libshine \
    --enable-libsnappy \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libtwolame \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxvid \
    --enable-libzvbi \
    --enable-opencl \
    --enable-openssl \
    --enable-librtmp \
    --enable-libxml2 \
    --enable-cuda-nvcc \
    --enable-libdrm \
    --enable-frei0r \
    --enable-libass \
    --enable-opengl

make -j 8 && $sudo_prefix make install && cd -
rm -rf "$ffmpeg_dir"