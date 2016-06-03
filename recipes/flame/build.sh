if [ `uname` == Linux ]; then

    ./configure \
      --prefix=$PREFIX \
      --enable-multithreading=pthreads \
      --enable-vector-intrinsics=sse \
      --enable-static-build \
      --enable-dynamic-build \
      --enable-cblas-interfaces

      #--with-extra-cflags=-fPIC \
      # --enable-gpu
      # --enable-verbose-make-output

fi

if [ `uname` == Darwin ]; then

    ./configure \
      --prefix=$PREFIX \
      --enable-multithreading=pthreads \
      --enable-vector-intrinsics=sse \
      --enable-static-build \
      --enable-dynamic-build \
      --enable-cblas-interfaces
fi

make -j${CPU_COUNT}
make install
