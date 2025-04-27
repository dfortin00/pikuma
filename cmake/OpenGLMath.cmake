message("-- Downloading GLM repository...")

FetchContent_Declare(
    glm
    GIT_REPOSITORY  https://github.com/g-truc/glm.git
    GIT_TAG         1.0.1
)

if(BUILD_EXTERNAL_LIBS)
    message("-- Building all external GLM libs from source")

    message("-- Building GLM library")
    FetchContent_MakeAvailable(glm)
else()
    message("-- Skipping GLM library builds, assuming external libraries are already available")
endif()


