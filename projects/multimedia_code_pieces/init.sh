#!/bin/bash

set -e

executable_dir=$(dirname "$0")
basic_script=$(realpath "$executable_dir/../../basic/init_c.sh")
vulkan_script=$(realpath "$executable_dir/../../3rd/vulkan/install.sh")
ffmpeg_script=$(realpath "$executable_dir/../../3rd/ffmpeg/6.1.1/build.sh")

# install basic dependencies
bash "$basic_script"

# install vulkan sdk
bash "$vulkan_script" 1.3.275 jammy

# install ffmpeg
# cuda tools should be installed previously (it is your turn to install it)
bash "$ffmpeg_script"
