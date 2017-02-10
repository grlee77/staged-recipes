#!/usr/bin/env bash

mkdir build
cd build

# HDF5_C_INCLUDE_DIR specified to help cmake find hdf5.h
if [[ `uname` == 'Darwin' ]]; then
    # -stdlib=libc++ added to avoid clang error when linking to boost
    cmake .. \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DHDF5_C_INCLUDE_DIR="${PREFIX}/include" \
        -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -stdlib=libc++"
else
    export LD_LIBRARY_PATH=""
    cmake .. \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DHDF5_C_INCLUDE_DIR="${PREFIX}/include"
fi

make
make install
