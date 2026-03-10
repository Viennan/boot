#!/bin/bash

set -e

sudo apt-get update

# assembly tools
sudo apt-get install --no-install-recommends -y \
    nasm \
    yasm

# graphics
sudo apt-get install --no-install-recommends -y \
    libopenal-dev \
    ocl-icd-opencl-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libdrm-dev

# hardware acceleration
# vulkan and ffnvcodec should be installed previously (use script in the folder with the same name).
sudo apt-get install --no-install-recommends -y \
    libvpl-dev

# multimedia codec
sudo apt-get install --no-install-recommends -y \
    libaom-dev \
    libass-dev \
    libbs2b-dev \
    libcaca-dev \
    libcodec2-dev \
    libdav1d-dev \
    flite1-dev \
    libfontconfig-dev \
    libfreetype-dev \
    libfribidi-dev \
    libgme-dev \
    libgsm1-dev \
    libharfbuzz-dev \
    libmp3lame-dev \
    libmysofa-dev \
    libopenjp2-7-dev \
    libopenmpt-dev \
    libopus-dev \
    librubberband-dev \
    libshine-dev \
    libsnappy-dev \
    libsoxr-dev \
    libspeex-dev \
    libtheora-dev \
    libtwolame-dev \
    libvidstab-dev \
    libvorbis-dev \
    libvpx-dev \
    libwebp-dev \
    libx264-dev \
    libx265-dev \
    libxvidcore-dev \
    libxml2-dev \
    libzimg-dev

# media services and streaming
sudo apt-get install --no-install-recommends -y \
    libjack-jackd2-dev \
    libpulse-dev \
    librabbitmq-dev \
    librist-dev \
    libsrt-gnutls-dev \
    libssh-dev \
    libzmq3-dev \
    libzvbi-dev \
    libsndio-dev \
    libgnutls28-dev

# effect, image processing and advanced codec
sudo apt-get install --no-install-recommends -y \
    glslang-dev \
    frei0r-plugins-dev \
    ladspa-sdk \
    lv2-dev \
    liblilv-dev \
    librsvg2-dev \
    libjxl-dev \
    libplacebo-dev \
    libsvtav1-dev \
    libsvtav1enc-dev \
    librav1e-dev \
    libchromaprint-dev \
    libplacebo-dev

sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*