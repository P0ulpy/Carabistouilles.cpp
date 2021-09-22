
set(opengl_INCLUDE_DIRS_DEBUG )
set(opengl_INCLUDE_DIR_DEBUG "")
set(opengl_INCLUDES_DEBUG )
set(opengl_RES_DIRS_DEBUG )
set(opengl_DEFINITIONS_DEBUG )
set(opengl_LINKER_FLAGS_DEBUG_LIST
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>"
)
set(opengl_COMPILE_DEFINITIONS_DEBUG )
set(opengl_COMPILE_OPTIONS_DEBUG_LIST "" "")
set(opengl_COMPILE_OPTIONS_C_DEBUG "")
set(opengl_COMPILE_OPTIONS_CXX_DEBUG "")
set(opengl_LIBRARIES_TARGETS_DEBUG "") # Will be filled later, if CMake 3
set(opengl_LIBRARIES_DEBUG "") # Will be filled later
set(opengl_LIBS_DEBUG "") # Same as opengl_LIBRARIES
set(opengl_SYSTEM_LIBS_DEBUG opengl32)
set(opengl_FRAMEWORK_DIRS_DEBUG )
set(opengl_FRAMEWORKS_DEBUG )
set(opengl_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
set(opengl_BUILD_MODULES_PATHS_DEBUG )

conan_find_apple_frameworks(opengl_FRAMEWORKS_FOUND_DEBUG "${opengl_FRAMEWORKS_DEBUG}" "${opengl_FRAMEWORK_DIRS_DEBUG}")

mark_as_advanced(opengl_INCLUDE_DIRS_DEBUG
                 opengl_INCLUDE_DIR_DEBUG
                 opengl_INCLUDES_DEBUG
                 opengl_DEFINITIONS_DEBUG
                 opengl_LINKER_FLAGS_DEBUG_LIST
                 opengl_COMPILE_DEFINITIONS_DEBUG
                 opengl_COMPILE_OPTIONS_DEBUG_LIST
                 opengl_LIBRARIES_DEBUG
                 opengl_LIBS_DEBUG
                 opengl_LIBRARIES_TARGETS_DEBUG)

# Find the real .lib/.a and add them to opengl_LIBS and opengl_LIBRARY_LIST
set(opengl_LIBRARY_LIST_DEBUG )
set(opengl_LIB_DIRS_DEBUG )

# Gather all the libraries that should be linked to the targets (do not touch existing variables):
set(_opengl_DEPENDENCIES_DEBUG "${opengl_FRAMEWORKS_FOUND_DEBUG} ${opengl_SYSTEM_LIBS_DEBUG} ")

conan_package_library_targets("${opengl_LIBRARY_LIST_DEBUG}"  # libraries
                              "${opengl_LIB_DIRS_DEBUG}"      # package_libdir
                              "${_opengl_DEPENDENCIES_DEBUG}"  # deps
                              opengl_LIBRARIES_DEBUG            # out_libraries
                              opengl_LIBRARIES_TARGETS_DEBUG    # out_libraries_targets
                              "_DEBUG"                          # build_type
                              "opengl")                                      # package_name

set(opengl_LIBS_DEBUG ${opengl_LIBRARIES_DEBUG})

foreach(_FRAMEWORK ${opengl_FRAMEWORKS_FOUND_DEBUG})
    list(APPEND opengl_LIBRARIES_TARGETS_DEBUG ${_FRAMEWORK})
    list(APPEND opengl_LIBRARIES_DEBUG ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${opengl_SYSTEM_LIBS_DEBUG})
    list(APPEND opengl_LIBRARIES_TARGETS_DEBUG ${_SYSTEM_LIB})
    list(APPEND opengl_LIBRARIES_DEBUG ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(opengl_LIBRARIES_TARGETS_DEBUG "${opengl_LIBRARIES_TARGETS_DEBUG};")
set(opengl_LIBRARIES_DEBUG "${opengl_LIBRARIES_DEBUG};")

set(CMAKE_MODULE_PATH "C:/Users/Flo/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "C:/Users/Flo/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" ${CMAKE_PREFIX_PATH})
