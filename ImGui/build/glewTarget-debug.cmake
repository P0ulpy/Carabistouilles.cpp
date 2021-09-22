########## MACROS ###########################################################################
#############################################################################################


macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS FRAMEWORKS_DIRS)
    if(APPLE)
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${FRAMEWORKS_DIRS} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${FRAMEWORKS_DIRS}")
            endif()
        endforeach()
    endif()
endmacro()


function(conan_package_library_targets libraries package_libdir deps out_libraries out_libraries_target build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            list(APPEND _out_libraries ${CONAN_FOUND_LIBRARY})
            if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
                # Create a micro-target for each lib/a found
                set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
                if(NOT TARGET ${_LIB_NAME})
                    # Create a micro-target for each lib/a found
                    add_library(${_LIB_NAME} UNKNOWN IMPORTED)
                    set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
                    set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
                else()
                    conan_message(STATUS "Skipping already existing target: ${_LIB_NAME}")
                endif()
                list(APPEND _out_libraries_target ${_LIB_NAME})
            endif()
            conan_message(STATUS "Found: ${CONAN_FOUND_LIBRARY}")
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            list(APPEND _out_libraries_target ${_LIBRARY_NAME})
            list(APPEND _out_libraries ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
        # Add all dependencies to all targets
        string(REPLACE " " ";" deps_list "${deps}")
        foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
            set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
        endforeach()
    endif()

    set(${out_libraries} ${_out_libraries} PARENT_SCOPE)
    set(${out_libraries_target} ${_out_libraries_target} PARENT_SCOPE)
endfunction()


########### VARIABLES #######################################################################
#############################################################################################


set(GLEW_INCLUDE_DIRS_DEBUG "C:/Users/Flo/.conan/data/glew/2.1.0/_/_/package/2cd10aa7b17419a389740c9a9a85afec1178e5cf/include")
set(GLEW_INCLUDE_DIR_DEBUG "C:/Users/Flo/.conan/data/glew/2.1.0/_/_/package/2cd10aa7b17419a389740c9a9a85afec1178e5cf/include")
set(GLEW_INCLUDES_DEBUG "C:/Users/Flo/.conan/data/glew/2.1.0/_/_/package/2cd10aa7b17419a389740c9a9a85afec1178e5cf/include")
set(GLEW_RES_DIRS_DEBUG )
set(GLEW_DEFINITIONS_DEBUG "-DGLEW_STATIC")
set(GLEW_LINKER_FLAGS_DEBUG_LIST
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>"
)
set(GLEW_COMPILE_DEFINITIONS_DEBUG "GLEW_STATIC")
set(GLEW_COMPILE_OPTIONS_DEBUG_LIST "" "")
set(GLEW_COMPILE_OPTIONS_C_DEBUG "")
set(GLEW_COMPILE_OPTIONS_CXX_DEBUG "")
set(GLEW_LIBRARIES_TARGETS_DEBUG "") # Will be filled later, if CMake 3
set(GLEW_LIBRARIES_DEBUG "") # Will be filled later
set(GLEW_LIBS_DEBUG "") # Same as GLEW_LIBRARIES
set(GLEW_SYSTEM_LIBS_DEBUG )
set(GLEW_FRAMEWORK_DIRS_DEBUG )
set(GLEW_FRAMEWORKS_DEBUG )
set(GLEW_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
set(GLEW_BUILD_MODULES_PATHS_DEBUG )

conan_find_apple_frameworks(GLEW_FRAMEWORKS_FOUND_DEBUG "${GLEW_FRAMEWORKS_DEBUG}" "${GLEW_FRAMEWORK_DIRS_DEBUG}")

mark_as_advanced(GLEW_INCLUDE_DIRS_DEBUG
                 GLEW_INCLUDE_DIR_DEBUG
                 GLEW_INCLUDES_DEBUG
                 GLEW_DEFINITIONS_DEBUG
                 GLEW_LINKER_FLAGS_DEBUG_LIST
                 GLEW_COMPILE_DEFINITIONS_DEBUG
                 GLEW_COMPILE_OPTIONS_DEBUG_LIST
                 GLEW_LIBRARIES_DEBUG
                 GLEW_LIBS_DEBUG
                 GLEW_LIBRARIES_TARGETS_DEBUG)

# Find the real .lib/.a and add them to GLEW_LIBS and GLEW_LIBRARY_LIST
set(GLEW_LIBRARY_LIST_DEBUG libglew32d)
set(GLEW_LIB_DIRS_DEBUG "C:/Users/Flo/.conan/data/glew/2.1.0/_/_/package/2cd10aa7b17419a389740c9a9a85afec1178e5cf/lib")

# Gather all the libraries that should be linked to the targets (do not touch existing variables):
set(_GLEW_DEPENDENCIES_DEBUG "${GLEW_FRAMEWORKS_FOUND_DEBUG} ${GLEW_SYSTEM_LIBS_DEBUG} opengl::opengl;glu::glu")

conan_package_library_targets("${GLEW_LIBRARY_LIST_DEBUG}"  # libraries
                              "${GLEW_LIB_DIRS_DEBUG}"      # package_libdir
                              "${_GLEW_DEPENDENCIES_DEBUG}"  # deps
                              GLEW_LIBRARIES_DEBUG            # out_libraries
                              GLEW_LIBRARIES_TARGETS_DEBUG    # out_libraries_targets
                              "_DEBUG"                          # build_type
                              "GLEW")                                      # package_name

set(GLEW_LIBS_DEBUG ${GLEW_LIBRARIES_DEBUG})

foreach(_FRAMEWORK ${GLEW_FRAMEWORKS_FOUND_DEBUG})
    list(APPEND GLEW_LIBRARIES_TARGETS_DEBUG ${_FRAMEWORK})
    list(APPEND GLEW_LIBRARIES_DEBUG ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${GLEW_SYSTEM_LIBS_DEBUG})
    list(APPEND GLEW_LIBRARIES_TARGETS_DEBUG ${_SYSTEM_LIB})
    list(APPEND GLEW_LIBRARIES_DEBUG ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(GLEW_LIBRARIES_TARGETS_DEBUG "${GLEW_LIBRARIES_TARGETS_DEBUG};opengl::opengl;glu::glu")
set(GLEW_LIBRARIES_DEBUG "${GLEW_LIBRARIES_DEBUG};opengl::opengl;glu::glu")

set(CMAKE_MODULE_PATH "C:/Users/Flo/.conan/data/glew/2.1.0/_/_/package/2cd10aa7b17419a389740c9a9a85afec1178e5cf/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "C:/Users/Flo/.conan/data/glew/2.1.0/_/_/package/2cd10aa7b17419a389740c9a9a85afec1178e5cf/" ${CMAKE_PREFIX_PATH})

set(GLEW_COMPONENTS_DEBUG GLEW::glew_s)

########### COMPONENT glew_s VARIABLES #############################################

set(GLEW_glew_s_INCLUDE_DIRS_DEBUG "C:/Users/Flo/.conan/data/glew/2.1.0/_/_/package/2cd10aa7b17419a389740c9a9a85afec1178e5cf/include")
set(GLEW_glew_s_INCLUDE_DIR_DEBUG "C:/Users/Flo/.conan/data/glew/2.1.0/_/_/package/2cd10aa7b17419a389740c9a9a85afec1178e5cf/include")
set(GLEW_glew_s_INCLUDES_DEBUG "C:/Users/Flo/.conan/data/glew/2.1.0/_/_/package/2cd10aa7b17419a389740c9a9a85afec1178e5cf/include")
set(GLEW_glew_s_LIB_DIRS_DEBUG "C:/Users/Flo/.conan/data/glew/2.1.0/_/_/package/2cd10aa7b17419a389740c9a9a85afec1178e5cf/lib")
set(GLEW_glew_s_RES_DIRS_DEBUG )
set(GLEW_glew_s_DEFINITIONS_DEBUG "-DGLEW_STATIC")
set(GLEW_glew_s_COMPILE_DEFINITIONS_DEBUG "GLEW_STATIC")
set(GLEW_glew_s_COMPILE_OPTIONS_C_DEBUG "")
set(GLEW_glew_s_COMPILE_OPTIONS_CXX_DEBUG "")
set(GLEW_glew_s_LIBS_DEBUG libglew32d)
set(GLEW_glew_s_SYSTEM_LIBS_DEBUG )
set(GLEW_glew_s_FRAMEWORK_DIRS_DEBUG )
set(GLEW_glew_s_FRAMEWORKS_DEBUG )
set(GLEW_glew_s_BUILD_MODULES_PATHS_DEBUG )
set(GLEW_glew_s_DEPENDENCIES_DEBUG opengl::opengl glu::glu)
set(GLEW_glew_s_LINKER_FLAGS_LIST_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT glew_s FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(GLEW_glew_s_FRAMEWORKS_FOUND_DEBUG "")
conan_find_apple_frameworks(GLEW_glew_s_FRAMEWORKS_FOUND_DEBUG "${GLEW_glew_s_FRAMEWORKS_DEBUG}" "${GLEW_glew_s_FRAMEWORK_DIRS_DEBUG}")

set(GLEW_glew_s_LIB_TARGETS_DEBUG "")
set(GLEW_glew_s_NOT_USED_DEBUG "")
set(GLEW_glew_s_LIBS_FRAMEWORKS_DEPS_DEBUG ${GLEW_glew_s_FRAMEWORKS_FOUND_DEBUG} ${GLEW_glew_s_SYSTEM_LIBS_DEBUG} ${GLEW_glew_s_DEPENDENCIES_DEBUG})
conan_package_library_targets("${GLEW_glew_s_LIBS_DEBUG}"
                              "${GLEW_glew_s_LIB_DIRS_DEBUG}"
                              "${GLEW_glew_s_LIBS_FRAMEWORKS_DEPS_DEBUG}"
                              GLEW_glew_s_NOT_USED_DEBUG
                              GLEW_glew_s_LIB_TARGETS_DEBUG
                              "DEBUG"
                              "GLEW_glew_s")

set(GLEW_glew_s_LINK_LIBS_DEBUG ${GLEW_glew_s_LIB_TARGETS_DEBUG} ${GLEW_glew_s_LIBS_FRAMEWORKS_DEPS_DEBUG})