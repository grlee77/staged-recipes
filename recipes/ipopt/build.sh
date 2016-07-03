#!/usr/bin/env bash
set -e

UNAME="$(uname)"
export CFLAGS="${CFLAGS} -O3"
export CXXFLAGS="${CXXFLAGS} -O3"

if [ "${UNAME}" == "Darwin" ]; then
  # for Mac OSX
  export CC=gcc
  export CXX=g++
else
  # for Linux
  export CC=
  export CXX=
fi

WITH_BLAS_LIB="-L${PREFIX}/lib -lopenblas"
WITH_LAPACK_LIB="-L${PREFIX}/lib -lopenblas"

#ls



CC="${CC}" CXX="${CXX}" ADD_CFLAGS="-fopenmp" ADD_FLAGS="-fopenmp" \
  ADD_CPPFLAGS="-fopenmp" ./configure --prefix="${PREFIX}" \
  --exec-prefix="${PREFIX}" \
  --with-blas-lib="${WITH_BLAS_LIB}" \
  --with-lapack-lib="${WITH_LAPACK_LIB}" \
  || { cat config.log; exit 1; }

  # --enable-static \
  # --with-pardiso= \
  # --with-wsmp= \
  # --with-mumps-incdir=
  # --with-mumps-lib=

make
#if [ "${UNAME}" == "Linux" ]; then
make test
#fi
make install
