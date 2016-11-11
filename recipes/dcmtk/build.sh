#!/usr/bin/env bash

mkdir build
cd build

DCMTK_HOME=$PREFIX \
cmake \
    -DCMAKE_FIND_ROOT_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" ..

make -j14
make test
make install
