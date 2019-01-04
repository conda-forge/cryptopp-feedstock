:: Adding the cmake support for cryptopp, which dropped cmake in 6.0.
git clone https://github.com/noloader/cryptopp-cmake.git
cd cryptopp-cmake
git checkout CRYPTOPP_7_0_0
cd ..

COPY cryptopp-cmake\cryptopp-config.cmake
COPY cryptopp-cmake\CMakeLists.txt

:: Regular cmake build
mkdir build
cd build
cmake -G "NMake Makefiles" -D DISABLE_SSSE3=ON -D BUILD_TESTING=OFF -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ..
if errorlevel 1 exit 1
nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1
