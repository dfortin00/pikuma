message("-- Downloading SDL3 repository...")

FetchContent_Declare(
    SDL3
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL.git
    GIT_TAG         release-3.2.8
)
FetchContent_MakeAvailable(SDL3)

