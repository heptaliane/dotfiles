#!/bin/bash
REVISION=master
if [ -z $1 ]; then
    REVISION=$1
fi

SRC_DIR=/user/local/src/pyenv
CURRENT_DIR=$(pwd)

if [ ! -e ${SRC_DIR} ]; then
    git clone https://github.com/pyenv/pyenv.git ${SRC_DIR}
fi
cd ${SRC_DIR}
git checkout ${REVISION}

src/configure
make -C src

ln -sf ${SRC_DIR}/bin/* /usr/local/bin/

cd ${CURRENT_DIR}
