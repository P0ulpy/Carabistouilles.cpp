
set(glu_INCLUDE_DIRS_DEBUG )
set(glu_INCLUDE_DIR_DEBUG "")
set(glu_INCLUDES_DEBUG )
set(glu_RES_DIRS_DEBUG )
set(glu_DEFINITIONS_DEBUG )
set(glu_LINKER_FLAGS_DEBUG_LIST
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>"
)
set(glu_COMPILE_DEFINITIONS_DEBUG )
set(glu_COMPILE_OPTIONS_DEBUG_LIST "" "")
set(glu_COMPILE_OPTIONS_C_DEBUG "")
set(glu_COMPILE_OPTIONS_CXX_DEBUG "")
set(glu_LIBRARIES_TARGETS_DEBUG "") # Will be filled later, if CMake 3
set(glu_LIBRARIES_DEBUG "") # Will be filled later
set(glu_LIBS_DEBUG "") # Same as glu_LIBRARIES
set(glu_SYSTEM_LIBS_DEBUG Glu32)
set(glu_FRAMEWORK_DIRS_DEBUG )
set(glu_FRAMEWORKS_DEBUG )
set(glu_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
set(glu_BUILD_MODULES_PATHS_DEBUG )

conan_find_apple_frameworks(glu_FRAMEWORKS_FOUND_DEBUG "${glu_FRAMEWORKS_DEBUG}" "${glu_FRAMEWORK_DIRS_DEBUG}")

mark_as_advanced(glu_INCLUDE_DIRS_DEBUG
                 glu_INCLUDE_DIR_DEBUG
                 glu_INCLUDES_DEBUG
                 glu_DEFINITIONS_DEBUG
                 glu_LINKER_FLAGS_DEBUG_LIST
                 glu_COMPILE_DEFINITIONS_DEBUG
                 glu_COMPILE_OPTIONS_DEBUG_LIST
                 glu_LIBRARIES_DEBUG
                 glu_LIBS_DEBUG
                 glu_LIBRARIES_TARGETS_DEBUG)

# Find the real .lib/.a and add them to glu_LIBS and glu_LIBRARY_LIST
set(glu_LIBRARY_LIST_DEBUG )
set(glu_LIB_DIRS_DEBUG )

# Gather all the libraries that should be linked to the targets (do not touch existing variables):
set(_glu_DEPENDENCIES_DEBUG "${glu_FRAMEWORKS_FOUND_DEBUG} ${glu_SYSTEM_LIBS_DEBUG} opengl::opengl")

conan_package_library_targets("${glu_LIBRARY_LIST_DEBUG}"  # libraries
                              "${glu_LIB_DIRS_DEBUG}"      # package_libdir
                              "${_glu_DEPENDENCIES_DEBUG}"  # deps
                              glu_LIBRARIES_DEBUG            # out_libraries
                              glu_LIBRARIES_TARGETS_DEBUG    # out_libraries_targets
                              "_DEBUG"                          # build_type
                              "glu")                                      # package_name

set(glu_LIBS_DEBUG ${glu_LIBRARIES_DEBUG})

foreach(_FRAMEWORK ${glu_FRAMEWORKS_FOUND_DEBUG})
    list(APPEND glu_LIBRARIES_TARGETS_DEBUG ${_FRAMEWORK})
    list(APPEND glu_LIBRARIES_DEBUG ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${glu_SYSTEM_LIBS_DEBUG})
    list(APPEND glu_LIBRARIES_TARGETS_DEBUG ${_SYSTEM_LIB})
    list(APPEND glu_LIBRARIES_DEBUG ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(glu_LIBRARIES_TARGETS_DEBUG "${glu_LIBRARIES_TARGETS_DEBUG};opengl::opengl")
set(glu_LIBRARIES_DEBUG "${glu_LIBRARIES_DEBUG};opengl::opengl")

set(CMAKE_MODULE_PATH "C:/Users/Flo/.conan/data/glu/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "C:/Users/Flo/.conan/data/glu/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" ${CMAKE_PREFIX_PATH})
