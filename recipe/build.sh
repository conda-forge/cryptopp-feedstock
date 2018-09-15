#!/bin/bash

# cryptopp files are stored with CRLF eol, making impossible to patch them the conda way
# can be remover in the enxt release of cryptopp since its cmakelists will have an option
# to remove march=generic flag
#sed -i s/$/$'\r'/ $RECIPE_DIR/0001-cmake-mtune-fix.patch
#git apply --binary $RECIPE_DIR/0001-cmake-mtune-fix.patch

export CXXFLAGS="$CXXFLAGS -std=c++11"

mkdir build
cd build
cmake -D BUILD_SHARED=OFF -D DISABLE_SSSE3=ON -D BUILD_TESTING=OFF -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_LIBDIR=lib -D CMAKE_INSTALL_PREFIX=$PREFIX ..
make
make install
