include(ExternalProject)

SET(BLAKE2_SEARCH_PATH
    "${PROJECT_SOURCE_DIR}/extern/libb2")

if(WIN32)
    ExternalProject_Add(
        libb2_SRC
        GIT_REPOSITORY https://github.com/mrom1/libb2
        GIT_TAG feature/cmake
        UPDATE_COMMAND ""
        PREFIX ${BLAKE2_SEARCH_PATH}
        SOURCE_DIR "${BLAKE2_SEARCH_PATH}/src/libb2"
        BUILD_IN_SOURCE 1
        INSTALL_COMMAND ""
    )
endif(WIN32)

if(UNIX)
    ExternalProject_Add(
        libb2_SRC
        GIT_REPOSITORY https://github.com/BLAKE2/libb2.git
        UPDATE_COMMAND ""
        PREFIX ${BLAKE2_SEARCH_PATH}
        SOURCE_DIR "${BLAKE2_SEARCH_PATH}/src/libb2"
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND ./autogen.sh COMMAND ./configure
        BUILD_COMMAND make
        INSTALL_COMMAND ""
    )
endif(UNIX)

set(LIBSUFFIX "${CMAKE_STATIC_LIBRARY_SUFFIX}")

ExternalProject_Get_Property(libb2_SRC source_dir)
set(BLAKE2_INCLUDES "${source_dir}/src")
    
ExternalProject_Get_Property(libb2_SRC binary_dir)

if(WIN32)
    set(BLAKE2_LIBRARY ${binary_dir}/lib/Debug/${CMAKE_FIND_LIBRARY_PREFIXES}libb2${LIBSUFFIX})
endif(WIN32)

if(UNIX)
    set(BLAKE2_LIBRARY ${binary_dir}/src/.libs/${CMAKE_FIND_LIBRARY_PREFIXES}b2${LIBSUFFIX})
endif(UNIX)

add_library(libb2 SHARED IMPORTED)

set_target_properties(libb2 PROPERTIES IMPORTED_LOCATION "${BLAKE2_LIBRARY}")