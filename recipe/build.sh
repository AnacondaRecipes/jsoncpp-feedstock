#!/bin/bash

set -x

# FIXME: This is a hack to make sure the environment is activated.
# The reason this is required is due to the conda-build issue
# mentioned below.
#
# https://github.com/conda/conda-build/issues/910
#
source activate "${CONDA_DEFAULT_ENV}"

if [ "$(uname)" == "Darwin" ]
then
    export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
else
    export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi

export VERBOSE=1

cmake -B build ${CMAKE_ARGS} \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR="${PREFIX}/lib" \
  -DCMAKE_PREFIX_PATH="${PREFIX}" \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DBUILD_SHARED_LIBS=ON \
  -DBUILD_STATIC_LIBS=OFF \
  -DBUILD_OBJECT_LIBS=OFF \
  -DPYTHON_EXECUTABLE="${BUILD_PREFIX}/bin/python" \
  -DJSONCPP_WITH_POST_BUILD_UNITTEST=off \
  .

cmake --build build -- -j${CPU_COUNT}
if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
  eval ${LIBRARY_SEARCH_VAR}=$PREFIX/lib cmake --build build --target jsoncpp_check -- -j${CPU_COUNT}
fi
cmake --build build --target install -- -j${CPU_COUNT}

