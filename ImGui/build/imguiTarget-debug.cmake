
set(imgui_INCLUDE_DIRS_DEBUG "C:/Users/Flo/.conan/data/imgui/1.79/_/_/package/d057732059ea44a47760900cb5e4855d2bea8714/include")
set(imgui_INCLUDE_DIR_DEBUG "C:/Users/Flo/.conan/data/imgui/1.79/_/_/package/d057732059ea44a47760900cb5e4855d2bea8714/include")
set(imgui_INCLUDES_DEBUG "C:/Users/Flo/.conan/data/imgui/1.79/_/_/package/d057732059ea44a47760900cb5e4855d2bea8714/include")
set(imgui_RES_DIRS_DEBUG "C:/Users/Flo/.conan/data/imgui/1.79/_/_/package/d057732059ea44a47760900cb5e4855d2bea8714/res")
set(imgui_DEFINITIONS_DEBUG )
set(imgui_LINKER_FLAGS_DEBUG_LIST
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>"
)
set(imgui_COMPILE_DEFINITIONS_DEBUG )
set(imgui_COMPILE_OPTIONS_DEBUG_LIST "" "")
set(imgui_COMPILE_OPTIONS_C_DEBUG "")
set(imgui_COMPILE_OPTIONS_CXX_DEBUG "")
set(imgui_LIBRARIES_TARGETS_DEBUG "") # Will be filled later, if CMake 3
set(imgui_LIBRARIES_DEBUG "") # Will be filled later
set(imgui_LIBS_DEBUG "") # Same as imgui_LIBRARIES
set(imgui_SYSTEM_LIBS_DEBUG )
set(imgui_FRAMEWORK_DIRS_DEBUG )
set(imgui_FRAMEWORKS_DEBUG )
set(imgui_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
set(imgui_BUILD_MODULES_PATHS_DEBUG )

conan_find_apple_frameworks(imgui_FRAMEWORKS_FOUND_DEBUG "${imgui_FRAMEWORKS_DEBUG}" "${imgui_FRAMEWORK_DIRS_DEBUG}")

mark_as_advanced(imgui_INCLUDE_DIRS_DEBUG
                 imgui_INCLUDE_DIR_DEBUG
                 imgui_INCLUDES_DEBUG
                 imgui_DEFINITIONS_DEBUG
                 imgui_LINKER_FLAGS_DEBUG_LIST
                 imgui_COMPILE_DEFINITIONS_DEBUG
                 imgui_COMPILE_OPTIONS_DEBUG_LIST
                 imgui_LIBRARIES_DEBUG
                 imgui_LIBS_DEBUG
                 imgui_LIBRARIES_TARGETS_DEBUG)

# Find the real .lib/.a and add them to imgui_LIBS and imgui_LIBRARY_LIST
set(imgui_LIBRARY_LIST_DEBUG imgui)
set(imgui_LIB_DIRS_DEBUG "C:/Users/Flo/.conan/data/imgui/1.79/_/_/package/d057732059ea44a47760900cb5e4855d2bea8714/lib")

# Gather all the libraries that should be linked to the targets (do not touch existing variables):
set(_imgui_DEPENDENCIES_DEBUG "${imgui_FRAMEWORKS_FOUND_DEBUG} ${imgui_SYSTEM_LIBS_DEBUG} ")

conan_package_library_targets("${imgui_LIBRARY_LIST_DEBUG}"  # libraries
                              "${imgui_LIB_DIRS_DEBUG}"      # package_libdir
                              "${_imgui_DEPENDENCIES_DEBUG}"  # deps
                              imgui_LIBRARIES_DEBUG            # out_libraries
                              imgui_LIBRARIES_TARGETS_DEBUG    # out_libraries_targets
                              "_DEBUG"                          # build_type
                              "imgui")                                      # package_name

set(imgui_LIBS_DEBUG ${imgui_LIBRARIES_DEBUG})

foreach(_FRAMEWORK ${imgui_FRAMEWORKS_FOUND_DEBUG})
    list(APPEND imgui_LIBRARIES_TARGETS_DEBUG ${_FRAMEWORK})
    list(APPEND imgui_LIBRARIES_DEBUG ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${imgui_SYSTEM_LIBS_DEBUG})
    list(APPEND imgui_LIBRARIES_TARGETS_DEBUG ${_SYSTEM_LIB})
    list(APPEND imgui_LIBRARIES_DEBUG ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(imgui_LIBRARIES_TARGETS_DEBUG "${imgui_LIBRARIES_TARGETS_DEBUG};")
set(imgui_LIBRARIES_DEBUG "${imgui_LIBRARIES_DEBUG};")

set(CMAKE_MODULE_PATH "C:/Users/Flo/.conan/data/imgui/1.79/_/_/package/d057732059ea44a47760900cb5e4855d2bea8714/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "C:/Users/Flo/.conan/data/imgui/1.79/_/_/package/d057732059ea44a47760900cb5e4855d2bea8714/" ${CMAKE_PREFIX_PATH})
