#!/usr/bin/env bash

export LBFGS_FLOAT=64  # double precision (default)

./configure  --enable-sse2 --prefix=${PREFIX}
make
./sample/sample  # run sample program
make install
