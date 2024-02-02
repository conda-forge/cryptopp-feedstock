#!/bin/bash

if [[ "${target_platform}" == osx-* ]]; then
    # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
    CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

# Regular cmake build
cmake ${CMAKE_ARGS} \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_LIBDIR=lib \
  -D CRYPTOPP_BUILD_TESTING=OFF \
  -D CRYPTOPP_SOURCES=$PWD \
  -S cryptopp-cmake \
  -B build
make -C build -j $CPU_COUNT
make -C build install
