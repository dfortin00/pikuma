
message("-- Downloading ImGui...")

# Fetch ImGui
FetchContent_Declare(
    imgui
    GIT_REPOSITORY  https://github.com/ocornut/imgui
    GIT_TAG         v1.91.9
)
FetchContent_MakeAvailable(imgui)

# Define the ImGui static library.
add_library(imgui_static STATIC
    ${imgui_SOURCE_DIR}/imgui.cpp
    ${imgui_SOURCE_DIR}/imgui_demo.cpp
    ${imgui_SOURCE_DIR}/imgui_draw.cpp
    ${imgui_SOURCE_DIR}/imgui_tables.cpp
    ${imgui_SOURCE_DIR}/imgui_widgets.cpp
)

# Include header file directory for ImGui.
target_include_directories(imgui_static PUBLIC ${imgui_SOURCE_DIR})
