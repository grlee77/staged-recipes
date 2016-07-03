#!/bin/bash
# export LDFLAGS="$LDFLAGS -Wl,-rpath,$PREFIX/lib"
export CYLP_USE_CYTHON=""
export COIN_INSTALL_DIR="${PREFIX}"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${COIN_INSTALL_DIR}"
python setup.py install --single-version-externally-managed --record record.txt
