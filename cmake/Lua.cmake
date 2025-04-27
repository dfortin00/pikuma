

#Fetch Lua from the GitHub repository.
message("-- Downloading Lua repository...")

FetchContent_Declare(
    lua
    GIT_REPOSITORY  https://github.com/lua/lua.git
    GIT_TAG         v5.4.7
)

# Fetch SOL3 Lua C++ API from repository.
message("-- Downloading SOL3 repository...")

FetchContent_Declare(
    sol3
    GIT_REPOSITORY  https://github.com/ThePhD/sol2.git
    GIT_TAG         v3.5.0
)

if(BUILD_EXTERNAL_LIBS)
    message("-- Building all external Lua libs from source")

    message("-- Building Lua library")
    FetchContent_MakeAvailable(lua)

    add_library(lua_static STATIC
        ${lua_SOURCE_DIR}/lapi.c
        ${lua_SOURCE_DIR}/lcode.c
        ${lua_SOURCE_DIR}/lctype.c
        ${lua_SOURCE_DIR}/ldebug.c
        ${lua_SOURCE_DIR}/ldo.c
        ${lua_SOURCE_DIR}/ldump.c
        ${lua_SOURCE_DIR}/lfunc.c
        ${lua_SOURCE_DIR}/lgc.c
        ${lua_SOURCE_DIR}/llex.c
        ${lua_SOURCE_DIR}/lmem.c
        ${lua_SOURCE_DIR}/lobject.c
        ${lua_SOURCE_DIR}/lopcodes.c
        ${lua_SOURCE_DIR}/lparser.c
        ${lua_SOURCE_DIR}/lstate.c
        ${lua_SOURCE_DIR}/lstring.c
        ${lua_SOURCE_DIR}/ltable.c
        ${lua_SOURCE_DIR}/ltm.c
        ${lua_SOURCE_DIR}/lundump.c
        ${lua_SOURCE_DIR}/lvm.c
        ${lua_SOURCE_DIR}/lzio.c
        ${lua_SOURCE_DIR}/lauxlib.c
        ${lua_SOURCE_DIR}/lbaselib.c
        ${lua_SOURCE_DIR}/lcorolib.c
        ${lua_SOURCE_DIR}/ldblib.c
        ${lua_SOURCE_DIR}/liolib.c
        ${lua_SOURCE_DIR}/lmathlib.c
        ${lua_SOURCE_DIR}/loslib.c
        ${lua_SOURCE_DIR}/lstrlib.c
        ${lua_SOURCE_DIR}/ltablib.c
        ${lua_SOURCE_DIR}/lutf8lib.c
        ${lua_SOURCE_DIR}/loadlib.c
        ${lua_SOURCE_DIR}/linit.c
    )

    target_include_directories(lua_static PUBLIC ${lua_SOURCE_DIR})

    message("-- Building SOL3 library")
    FetchContent_MakeAvailable(sol3)
else()
    message("-- Skipping Lua library builds, assuming external libraries are already available")
endif()
