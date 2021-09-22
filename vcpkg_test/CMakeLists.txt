cmake_minimum_required(VERSION 3.0.0)
project(vcpkg_test VERSION 0.1.0)

find_package(SFML 2.5.1 COMPONENTS graphics audio network window REQUIRED)

# Cmake tests
include(CTest)
enable_testing()

add_executable(vcpkg_test src/main.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

TARGET_LINK_LIBRARIES(vcpkg_test sfml-graphics sfml-audio sfml-network sfml-window)