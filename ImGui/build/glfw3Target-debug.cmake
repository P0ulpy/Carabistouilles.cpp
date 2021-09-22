
set(glfw_INCLUDE_DIRS_DEBUG "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/72e84aac9213a09dfb0f59578ae9423a2eb326e7/include")
set(glfw_INCLUDE_DIR_DEBUG "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/72e84aac9213a09dfb0f59578ae9423a2eb326e7/include")
set(glfw_INCLUDES_DEBUG "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/72e84aac9213a09dfb0f59578ae9423a2eb326e7/include")
set(glfw_RES_DIRS_DEBUG )
set(glfw_DEFINITIONS_DEBUG )
set(glfw_LINKER_FLAGS_DEBUG_LIST
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>"
)
set(glfw_COMPILE_DEFINITIONS_DEBUG )
set(glfw_COMPILE_OPTIONS_DEBUG_LIST "" "")
set(glfw_COMPILE_OPTIONS_C_DEBUG "")
set(glfw_COMPILE_OPTIONS_CXX_DEBUG "")
set(glfw_LIBRARIES_TARGETS_DEBUG "") # Will be filled later, if CMake 3
set(glfw_LIBRARIES_DEBUG "") # Will be filled later
set(glfw_LIBS_DEBUG "") # Same as glfw_LIBRARIES
set(glfw_SYSTEM_LIBS_DEBUG gdi32)
set(glfw_FRAMEWORK_DIRS_DEBUG )
set(glfw_FRAMEWORKS_DEBUG )
set(glfw_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
set(glfw_BUILD_MODULES_PATHS_DEBUG "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/72e84aac9213a09dfb0f59578ae9423a2eb326e7/lib/cmake/conan-official-glfw-targets.cmake")

conan_find_apple_frameworks(glfw_FRAMEWORKS_FOUND_DEBUG "${glfw_FRAMEWORKS_DEBUG}" "${glfw_FRAMEWORK_DIRS_DEBUG}")

mark_as_advanced(glfw_INCLUDE_DIRS_DEBUG
                 glfw_INCLUDE_DIR_DEBUG
                 glfw_INCLUDES_DEBUG
                 glfw_DEFINITIONS_DEBUG
                 glfw_LINKER_FLAGS_DEBUG_LIST
                 glfw_COMPILE_DEFINITIONS_DEBUG
                 glfw_COMPILE_OPTIONS_DEBUG_LIST
                 glfw_LIBRARIES_DEBUG
                 glfw_LIBS_DEBUG
                 glfw_LIBRARIES_TARGETS_DEBUG)

# Find the real .lib/.a and add them to glfw_LIBS and glfw_LIBRARY_LIST
set(glfw_LIBRARY_LIST_DEBUG glfw3)
set(glfw_LIB_DIRS_DEBUG "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/72e84aac9213a09dfb0f59578ae9423a2eb326e7/lib")

# Gather all the libraries that should be linked to the targets (do not touch existing variables):
set(_glfw_DEPENDENCIES_DEBUG "${glfw_FRAMEWORKS_FOUND_DEBUG} ${glfw_SYSTEM_LIBS_DEBUG} opengl::opengl")

conan_package_library_targets("${glfw_LIBRARY_LIST_DEBUG}"  # libraries
                              "${glfw_LIB_DIRS_DEBUG}"      # package_libdir
                              "${_glfw_DEPENDENCIES_DEBUG}"  # deps
                              glfw_LIBRARIES_DEBUG            # out_libraries
                              glfw_LIBRARIES_TARGETS_DEBUG    # out_libraries_targets
                              "_DEBUG"                          # build_type
                              "glfw")                                      # package_name

set(glfw_LIBS_DEBUG ${glfw_LIBRARIES_DEBUG})

foreach(_FRAMEWORK ${glfw_FRAMEWORKS_FOUND_DEBUG})
    list(APPEND glfw_LIBRARIES_TARGETS_DEBUG ${_FRAMEWORK})
    list(APPEND glfw_LIBRARIES_DEBUG ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${glfw_SYSTEM_LIBS_DEBUG})
    list(APPEND glfw_LIBRARIES_TARGETS_DEBUG ${_SYSTEM_LIB})
    list(APPEND glfw_LIBRARIES_DEBUG ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(glfw_LIBRARIES_TARGETS_DEBUG "${glfw_LIBRARIES_TARGETS_DEBUG};opengl::opengl")
set(glfw_LIBRARIES_DEBUG "${glfw_LIBRARIES_DEBUG};opengl::opengl")

set(CMAKE_MODULE_PATH "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/72e84aac9213a09dfb0f59578ae9423a2eb326e7/"
			"C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/72e84aac9213a09dfb0f59578ae9423a2eb326e7/lib/cmake" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/72e84aac9213a09dfb0f59578ae9423a2eb326e7/"
			"C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/72e84aac9213a09dfb0f59578ae9423a2eb326e7/lib/cmake" ${CMAKE_PREFIX_PATH})
