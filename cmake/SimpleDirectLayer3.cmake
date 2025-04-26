# Tell SDL3_mixer NOT to fetch SDL3_image itself
set(SDL3MIXER_USE_BUILTIN_SDL3IMAGE OFF CACHE BOOL "" FORCE)

# Control SDL3_image build options before fetching it
set(SDL3IMAGE_VENDORED_DAV1D OFF CACHE BOOL "" FORCE)
set(SDL3IMAGE_AVIF OFF CACHE BOOL "" FORCE)

set(SDL3MIXER_SAMPLES OFF CACHE BOOL "" FORCE)
set(SDL3MIXER_INSTALL OFF CACHE BOOL "" FORCE)


message("-- Downloading SDL3 repository...")

FetchContent_Declare(
    SDL3
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL.git
    GIT_TAG         release-3.2.8
)
FetchContent_MakeAvailable(SDL3)

message("-- Downloading SDL3_image repository...")
FetchContent_Declare(
    SDL3_image
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL_image.git
    GIT_TAG         release-3.2.4
)
FetchContent_MakeAvailable(SDL3_image)


message("-- Downloading SDL3_ttf repository...")
FetchContent_Declare(
    SDL3_ttf
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL_ttf.git
    GIT_TAG         release-3.2.2
)
FetchContent_MakeAvailable(SDL3_ttf)

message("-- Downloading SDL3_mixer repository...")
FetchContent_Declare(
    SDL3_mixer
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL_mixer.git
    GIT_TAG         main
)
FetchContent_MakeAvailable(SDL3_mixer)



