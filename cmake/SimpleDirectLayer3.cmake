message("-- Downloading SDL3 repository...")

FetchContent_Declare(
    SDL3
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL.git
    GIT_TAG         release-3.2.8
)

message("-- Downloading SDL3_image repository...")

FetchContent_Declare(
    SDL3_image
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL_image.git
    GIT_TAG         release-3.2.4
)

message("-- Downloading SDL3_ttf repository...")

FetchContent_Declare(
    SDL3_ttf
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL_ttf.git
    GIT_TAG         release-3.2.2
)

message("-- Downloading SDL3_mixer repository...")

FetchContent_Declare(
    SDL3_mixer
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL_mixer.git
    GIT_TAG         main
    CMAKE_ARGS
        -DSDL3IMAGE_VENDORED_DAV1D=OFF
        -DSDL3IMAGE_AVIF=OFF
)

if(BUILD_EXTERNAL_LIBS)
    message("-- Building all external SDL3 libs from source")

    set(DAV1D_ASM OFF CACHE BOOL "" FORCE)

    message("-- Building SDL3 library")
    FetchContent_MakeAvailable(SDL3)

    message("-- Building SDL3_image library")
    FetchContent_MakeAvailable(SDL3_image)

    message("-- Building SDL3_ttf library")
    FetchContent_MakeAvailable(SDL3_ttf)

    message("-- Building SDL3_mixer library")
    FetchContent_MakeAvailable(SDL3_mixer)
else()
    message("-- Skipping SDL3 library builds, assuming external libraries are already available")
endif()
