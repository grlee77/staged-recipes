#!/usr/bin/env bash

make
make shared
make test

# apparently no make install, so manually copy
mkdir -p ${PREFIX}/bin
cp ./bin/zfp ${PREFIX}/bin/
mkdir -p ${PREFIX}/lib
cp ./lib/libzfp* ${PREFIX}/lib/
mkdir -p ${PREFIX}/include
cp ./include/*.h ${PREFIX}/include/
cp -r ./include/zfp ${PREFIX}/include/
