if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(FATAL_ERROR
        "\n"
        "In-source builds are not allowed with this project. Instead, provide a path to the build tree, for example:\n"
        "cmake -S <source> -B <destination>\n"
    )
endif()