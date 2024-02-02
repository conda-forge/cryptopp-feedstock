:: Regular cmake build
cmake ^
    -G "NMake Makefiles" ^
    -D BUILD_TESTING=OFF ^
    -D CMAKE_BUILD_TYPE=Release ^
    -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -S cryptopp-cmake ^
    -B build
if errorlevel 1 exit 1
cd build
if errorlevel 1 exit 1
nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1
