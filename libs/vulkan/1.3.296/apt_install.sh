#!/bin/bash

set -e

wget -qO - https://packages.lunarg.com/lunarg-signing-key-pub.asc | sudo apt-key add -
sudo wget -qO /etc/apt/sources.list.d/lunarg-vulkan-1.3.296-noble.list https://packages.lunarg.com/vulkan/1.3.296/lunarg-vulkan-1.3.296-noble.list
sudo apt-get update
sudo apt-get install -y vulkan-sdk
sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*