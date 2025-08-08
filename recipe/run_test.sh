#!/bin/bash

set -exuo pipefail

jsoncpp_libraries=(
    "libjsoncpp"
)

jsoncpp_headers=(
    "json/allocator.h"
    "json/assertions.h"
    "json/config.h"
    "json/forwards.h"
    "json/json.h"
    "json/json_features.h"
    "json/reader.h"
    "json/value.h"
    "json/version.h"
    "json/writer.h"
)

jsoncpp_package_config=(
    "jsoncpp.pc"
)

for each_library in "${jsoncpp_libraries[@]}"; do
    test -f ${PREFIX}/lib/"$each_library"${SHLIB_EXT}
done

for each_header in "${jsoncpp_headers[@]}"; do
    test -f ${PREFIX}/include/"$each_header"
done

for each_package_config in "${jsoncpp_package_config[@]}"; do
    test -f ${PREFIX}/lib/pkgconfig/"$each_package_config"
done
