#!/usr/bin/bash

# Install versions
VIM_VERSION="v9.1.1136"
NEOVIM_VERSION="v0.10.4"
PYENV_VERSION="v2.5.3"
PYTHON_VERSION="3.12.8"

# Install apt packages
sudo apt update -y
apt_packages=$(cat packages/apt.txt)
sudo apt install -y ${apt_packages}

# Install vim
if [ -z $(which vim) ]; then
    sudo bash installer/vim.sh ${VIM_VERSION}
fi

# Install neovim
if [ -z $(which nvim) ]; then
    sudo bash installer/neovim.sh ${NEOVIM_VERSION}
fi

# Install pyenv
if [ -z $(which pyenv) ]; then
    sudo bash installer/pyenv.sh ${PYENV_VERSION}
fi

# Install python
pyenv install ${PYTHON_VERSION}
pyenv global ${PYTHON_VERSION}
