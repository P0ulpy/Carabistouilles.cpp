
set(glfw_INCLUDE_DIRS_RELEASE "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/d3cffeefc8c8bcb6be8abdd182cb1b56fc81bacc/include")
set(glfw_INCLUDE_DIR_RELEASE "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/d3cffeefc8c8bcb6be8abdd182cb1b56fc81bacc/include")
set(glfw_INCLUDES_RELEASE "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/d3cffeefc8c8bcb6be8abdd182cb1b56fc81bacc/include")
set(glfw_RES_DIRS_RELEASE )
set(glfw_DEFINITIONS_RELEASE )
set(glfw_LINKER_FLAGS_RELEASE_LIST
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>"
)
set(glfw_COMPILE_DEFINITIONS_RELEASE )
set(glfw_COMPILE_OPTIONS_RELEASE_LIST "" "")
set(glfw_COMPILE_OPTIONS_C_RELEASE "")
set(glfw_COMPILE_OPTIONS_CXX_RELEASE "")
set(glfw_LIBRARIES_TARGETS_RELEASE "") # Will be filled later, if CMake 3
set(glfw_LIBRARIES_RELEASE "") # Will be filled later
set(glfw_LIBS_RELEASE "") # Same as glfw_LIBRARIES
set(glfw_SYSTEM_LIBS_RELEASE gdi32)
set(glfw_FRAMEWORK_DIRS_RELEASE )
set(glfw_FRAMEWORKS_RELEASE )
set(glfw_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
set(glfw_BUILD_MODULES_PATHS_RELEASE "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/d3cffeefc8c8bcb6be8abdd182cb1b56fc81bacc/lib/cmake/conan-official-glfw-targets.cmake")

conan_find_apple_frameworks(glfw_FRAMEWORKS_FOUND_RELEASE "${glfw_FRAMEWORKS_RELEASE}" "${glfw_FRAMEWORK_DIRS_RELEASE}")

mark_as_advanced(glfw_INCLUDE_DIRS_RELEASE
                 glfw_INCLUDE_DIR_RELEASE
                 glfw_INCLUDES_RELEASE
                 glfw_DEFINITIONS_RELEASE
                 glfw_LINKER_FLAGS_RELEASE_LIST
                 glfw_COMPILE_DEFINITIONS_RELEASE
                 glfw_COMPILE_OPTIONS_RELEASE_LIST
                 glfw_LIBRARIES_RELEASE
                 glfw_LIBS_RELEASE
                 glfw_LIBRARIES_TARGETS_RELEASE)

# Find the real .lib/.a and add them to glfw_LIBS and glfw_LIBRARY_LIST
set(glfw_LIBRARY_LIST_RELEASE glfw3)
set(glfw_LIB_DIRS_RELEASE "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/d3cffeefc8c8bcb6be8abdd182cb1b56fc81bacc/lib")

# Gather all the libraries that should be linked to the targets (do not touch existing variables):
set(_glfw_DEPENDENCIES_RELEASE "${glfw_FRAMEWORKS_FOUND_RELEASE} ${glfw_SYSTEM_LIBS_RELEASE} opengl::opengl")

conan_package_library_targets("${glfw_LIBRARY_LIST_RELEASE}"  # libraries
                              "${glfw_LIB_DIRS_RELEASE}"      # package_libdir
                              "${_glfw_DEPENDENCIES_RELEASE}"  # deps
                              glfw_LIBRARIES_RELEASE            # out_libraries
                              glfw_LIBRARIES_TARGETS_RELEASE    # out_libraries_targets
                              "_RELEASE"                          # build_type
                              "glfw")                                      # package_name

set(glfw_LIBS_RELEASE ${glfw_LIBRARIES_RELEASE})

foreach(_FRAMEWORK ${glfw_FRAMEWORKS_FOUND_RELEASE})
    list(APPEND glfw_LIBRARIES_TARGETS_RELEASE ${_FRAMEWORK})
    list(APPEND glfw_LIBRARIES_RELEASE ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${glfw_SYSTEM_LIBS_RELEASE})
    list(APPEND glfw_LIBRARIES_TARGETS_RELEASE ${_SYSTEM_LIB})
    list(APPEND glfw_LIBRARIES_RELEASE ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(glfw_LIBRARIES_TARGETS_RELEASE "${glfw_LIBRARIES_TARGETS_RELEASE};opengl::opengl")
set(glfw_LIBRARIES_RELEASE "${glfw_LIBRARIES_RELEASE};opengl::opengl")

set(CMAKE_MODULE_PATH "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/d3cffeefc8c8bcb6be8abdd182cb1b56fc81bacc/"
			"C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/d3cffeefc8c8bcb6be8abdd182cb1b56fc81bacc/lib/cmake" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/d3cffeefc8c8bcb6be8abdd182cb1b56fc81bacc/"
			"C:/Users/Flo/.conan/data/glfw/3.3.2/_/_/package/d3cffeefc8c8bcb6be8abdd182cb1b56fc81bacc/lib/cmake" ${CMAKE_PREFIX_PATH})
