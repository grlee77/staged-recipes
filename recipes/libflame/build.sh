# export CC=gcc
# OSX build failed with gcc 4.8.  need newer version?
# OSX build succeeds with clang

# --enable-vector-intrinsics=sse doesn't work with clang

if [ `uname` == Linux ]; then

    ./configure \
      --prefix=$PREFIX \
      --enable-multithreading=pthreads \
      --enable-vector-intrinsics=sse \
      --enable-static-build \
      --enable-dynamic-build \
      --enable-cblas-interfaces \
      --with-cc=$CC
      # --with-ranlib=${PREFIX}/lib/gcc-ranlib-6  # smallk build instructions use gcc6 and set this

      #--with-extra-cflags=-fPIC \
      # --enable-gpu
      # --enable-verbose-make-output

fi

if [ `uname` == Darwin ]; then

    ./configure \
      --prefix=$PREFIX \
      --enable-multithreading=pthreads \
      --enable-static-build \
      --enable-dynamic-build \
      --enable-cblas-interfaces \
      --with-cc=$CC
      # --enable-vector-intrinsics=sse \
      # --with-ranlib=${PREFIX}/lib/gcc-ranlib-6   # smallk build instructions use gcc6 and set this
fi

make -j${CPU_COUNT}
make install
