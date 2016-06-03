#!/bin/sh

if [ `uname` == Linux ]; then
    cd build/gcc
fi

if [ `uname` == Darwin ]; then
    cd build/mac
fi

make && make prefix=$PREFIX install
