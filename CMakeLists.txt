cmake_minimum_required(VERSION 3.26)
project(Pikuma VERSION 0.0.1 LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(NoInSourceBuilds)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# User option: Should we rebuild external libraries?
option(BUILD_EXTERNAL_LIBS "Force rebuilding external libraries" OFF)

include(FetchContent)

include(SimpleDirectLayer3)
include(OpenGLMath)
include(Lua)
include(ImGui)

add_subdirectory(src bin)


