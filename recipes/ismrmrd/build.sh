#!/usr/bin/env bash

mkdir build
cd build

# HDF5_C_INCLUDE_DIR specified to help cmake find hdf5.h
if [[ `uname` == 'Darwin' ]]; then
    # -stdlib=libc++ added to avoid clang error when linking to boost
    cmake .. \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DHDF5_C_INCLUDE_DIR="${PREFIX}/include" \
        -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -stdlib=libc++" \
        -DBoost_INCLUDE_DIR="${PREFIX}/include" \
        -DBoost_LIBRARY_DIR_RELEASE="${PREFIX}/lib"
else
    export LD_LIBRARY_PATH=""
    cmake .. \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DHDF5_C_INCLUDE_DIR="${PREFIX}/include" \
        -DBoost_INCLUDE_DIR="${PREFIX}/include" \
        -DBoost_LIBRARY_DIR_RELEASE="${PREFIX}/lib"
fi

make -j$CPU_COUNT
make install

./tests/test_ismrmrd
