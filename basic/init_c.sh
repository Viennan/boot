#!/bin/bash

set -e

sudo_prefix=""
if [[ $EUID -ne 0 ]]; then # 判断当前用户是否有管理员权限（非root）
    sudo_prefix="sudo" # 若没有管理员权限则在命令前面添加"sudo "
fi

sudo_prefix apt install -y build-essential cmake wget git unzip