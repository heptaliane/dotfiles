#!/usr/bin/bash

# Install versions
VIM_VERSION="v9.0.1959"

# Install apt packages
sudo apt update -y
apt_packages=$(cat apt-packages.txt)
sudo apt install -y ${apt_packages}

# Install vim
sudo bash installer/vim.sh ${VIM_VERSION}
