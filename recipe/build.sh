#!/bin/bash

mkdir build_yaafe
cd build_yaafe

if [[ "$c_compiler" == "gcc" ]]; then
  export PATH="${PATH}:${BUILD_PREFIX}/${HOST}/sysroot/usr/lib:${BUILD_PREFIX}/${HOST}/sysroot/usr/include"
fi

cmake \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DCMAKE_BUILD_TYPE=Release \
  -DWITH_FFTW3=ON -DWITH_HDF5=ON \
  -DWITH_LAPACK=ON \
  -DWITH_MPG123=ON \
  -DWITH_EIGEN_LIBRARY=ON \
  ..

make -j${CPU_COUNT}
make install
