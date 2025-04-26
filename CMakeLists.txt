cmake_minimum_required(VERSION 3.26)
project(Pikuma VERSION 0.0.1 LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set these early to control build options

include(FetchContent)

include(NoInSourceBuilds)
include(SimpleDirectLayer3)
include(OpenGLMath)
include(Lua)
include(ImGui)

add_subdirectory(src bin)


