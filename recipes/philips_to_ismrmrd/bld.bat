mkdir build
cd build

cmake .. ^
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" ^
    -DHDF5_C_INCLUDE_DIR="${PREFIX}\include"
    :: -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -stdlib=libc++"

make
make install
