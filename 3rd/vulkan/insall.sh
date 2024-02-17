#!/bin/bash

# install vulkan sdk
wget -qO- https://packages.lunarg.com/lunarg-signing-key-pub.asc | sudo tee /etc/apt/trusted.gpg.d/lunarg.asc
sudo wget -qO /etc/apt/sources.list.d/lunarg-vulkan-$1-$2.list https://packages.lunarg.com/vulkan/$1/lunarg-vulkan-$1-$2.list
sudo apt update
sudo apt install vulkan-sdk