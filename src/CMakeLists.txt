add_executable(pikuma main.cpp)

# Simple DirectMedia Layer v3
target_include_directories(pikuma PRIVATE ${SDL3_SOURCE_DIR}/include)
target_link_libraries(pikuma PRIVATE SDL3::SDL3)
get_target_property(SDL3_SHARED SDL3::SDL3 TYPE)
if (SDL3_SHARED STREQUAL "SHARED_LIBRARY")
    add_custom_command(TARGET pikuma POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    $<TARGET_FILE:SDL3::SDL3>
    $<TARGET_FILE_DIR:pikuma>
)
endif()

# OpenGL Mathematics
target_include_directories(pikuma PRIVATE ${glm_SOURCE_DIR})

# Lua
target_link_libraries(pikuma PRIVATE lua_static)

# ImGui
target_link_libraries(pikuma PRIVATE imgui_static)
