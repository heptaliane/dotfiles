#!/bin/bash
REVISION="master"
if [ -z $1 ]; then
    REVISION=$1
fi

SRC_DIR=/usr/local/src/vim
CURRENT_DIR=$(pwd)

if [ ! -e ${SRC_DIR} ]; then
    git clone https://github.com/neovim/neovim.git ${SRC_DIR}
fi
cd ${SRC_DIR}

git checkout ${REVISION}

make CMAKE_BUILD_TYPE=RelWithDebInfo
make install

cd ${CURRENT_DIR}
