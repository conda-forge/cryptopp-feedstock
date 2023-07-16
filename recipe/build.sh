#!/bin/bash

# Adding the cmake support for cryptopp, which dropped cmake in 6.0.
git clone https://github.com/noloader/cryptopp-cmake.git
cd cryptopp-cmake
git checkout CRYPTOPP_7_0_0
cd ..

cp "$PWD/cryptopp-cmake/cryptopp-config.cmake" "$PWD"
cp "$PWD/cryptopp-cmake/CMakeLists.txt" "$PWD"

# Regular cmake build
mkdir build
cd build
cmake ${CMAKE_ARGS} -D DISABLE_SSSE3=ON -D BUILD_TESTING=OFF -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_LIBDIR=lib -D CMAKE_INSTALL_PREFIX=$PREFIX ..
make
make install
