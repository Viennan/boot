#!/bin/bash

set -e

sudo_prefix=""
if [[ $EUID -ne 0 ]]; then # 判断当前用户是否有管理员权限（非root）
    sudo_prefix="sudo" # 若没有管理员权限则在命令前面添加"sudo "
fi

# install vulkan sdk
wget -qO- https://packages.lunarg.com/lunarg-signing-key-pub.asc | $sudo_prefix tee /etc/apt/trusted.gpg.d/lunarg.asc
$sudo_prefix wget -qO /etc/apt/sources.list.d/lunarg-vulkan-$1-$2.list https://packages.lunarg.com/vulkan/$1/lunarg-vulkan-$1-$2.list
$sudo_prefix apt update
$sudo_prefix apt install -y vulkan-sdk