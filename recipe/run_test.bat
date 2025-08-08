@echo off

REM Libraries
if not exist %LIBRARY_BIN%\\jsoncpp%SHLIB_EXT% exit 1

REM Package config
if not exist %LIBRARY_LIB%\\pkgconfig\jsoncpp.pc exit 1

REM Headers
if not exist %LIBRARY_INC%\\json\\allocator.h exit 1
if not exist %LIBRARY_INC%\\json\\assertions.h exit 1
if not exist %LIBRARY_INC%\\json\\config.h exit 1
if not exist %LIBRARY_INC%\\json\\forwards.h exit 1
if not exist %LIBRARY_INC%\\json\\json.h exit 1
if not exist %LIBRARY_INC%\\json\\json_features.h exit 1
if not exist %LIBRARY_INC%\\json\\reader.h exit 1
if not exist %LIBRARY_INC%\\json\\value.h exit 1
if not exist %LIBRARY_INC%\\json\\version.h exit 1
if not exist %LIBRARY_INC%\\json\\writer.h exit 1
