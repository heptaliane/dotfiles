#!/usr/bin/bash

# Install versions
VIM_VERSION="v9.0.1959"
PYENV_VERSION="v2.3.27"
PYTHON_VERSION="3.11.5"

# Install apt packages
sudo apt update -y
apt_packages=$(cat packages/apt.txt)
sudo apt install -y ${apt_packages}

# Install vim
if [ -z $(which vim) ]; then
    sudo bash installer/vim.sh ${VIM_VERSION}
fi

# Install pyenv
if [ -z $(which pyenv) ]; then
    sudo bash installer/pyenv.sh ${PYENV_VERSION}
fi

# Install python
pyenv install ${PYTHON_VERSION}
pyenv global ${PYTHON_VERSION}
