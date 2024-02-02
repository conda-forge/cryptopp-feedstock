#!/bin/bash

cp "$PWD/cryptopp-cmake/cryptopp-config.cmake" "$PWD"
cp "$PWD/cryptopp-cmake/CMakeLists.txt" "$PWD"

if [[ "${target_platform}" == osx-* ]]; then
    # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
    CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

# Regular cmake build
mkdir build
cd build
cmake ${CMAKE_ARGS} \
  -D BUILD_TESTING=OFF \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_LIBDIR=lib \
  ..
make -j $CPU_COUNT
make install
