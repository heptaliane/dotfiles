#!/bin/bash
REVISION="master"
if [ -z $1 ]; then
    REVISION=$1
fi

SRC_DIR=/usr/local/src/vim
CURRENT_DIR=$(pwd)

if [ ! -e ${SRC_DIR} ]; then
    git clone https://github.com/vim/vim.git ${SRC_DIR}
fi
cd ${SRC_DIR}

git checkout ${REVISION}

make clean
make && make install

cd ${CURRENT_DIR}
