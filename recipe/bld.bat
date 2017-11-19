mkdir build && cd build

set CMAKE_CONFIG=Release

cmake ^
  -G "NMake Makefiles" ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE="%CMAKE_CONFIG%" ^
  -DBUILD_STATIC_LIBS=ON ^
  -DBUILD_SHARED_LIBS=ON ^
  -DJSONCPP_WITH_TESTS=ON ^
  -DJSONCPP_WITH_POST_BUILD_UNITTEST=ON ^
  -DJSONCPP_WITH_PKGCONFIG_SUPPORT=ON ^
  -DJSONCPP_WITH_CMAKE_PACKAGE=ON ^
  -DPYTHON_EXECUTABLE="%SYS_PYTHON%" ^
  ..
if errorlevel 1 exit 1

cmake --build . --config %CMAKE_CONFIG% --target install
if errorlevel 1 exit 1
