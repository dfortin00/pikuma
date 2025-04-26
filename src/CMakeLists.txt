add_executable(pikuma WIN32 main.cpp)

target_include_directories(pikuma PRIVATE ${SDL3_SOURCE_DIR}/include)

# Simple DirectMedia Layer v3
target_link_libraries(pikuma PRIVATE
    SDL3::SDL3
    SDL3_image::SDL3_image
    SDL3_ttf::SDL3_ttf
    SDL3_mixer::SDL3_mixer
)

# Move SDL3 shared library into target build folder.
get_target_property(SDL3_SHARED SDL3::SDL3 TYPE)
if (WIN32 AND SDL3_SHARED STREQUAL "SHARED_LIBRARY")
    add_custom_command(
        TARGET pikuma POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        $<TARGET_FILE:SDL3::SDL3-shared>
        $<TARGET_FILE_DIR:pikuma>
    )
endif()

# OpenGL Mathematics
target_include_directories(pikuma PRIVATE ${glm_SOURCE_DIR})

# Lua
target_link_libraries(pikuma PRIVATE lua_static)

# SOL3
target_include_directories(pikuma PRIVATE ${sol3_SOURCE_DIR}/include)

# ImGui
target_link_libraries(pikuma PRIVATE imgui_static)
