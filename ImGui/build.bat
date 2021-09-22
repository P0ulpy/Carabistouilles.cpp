cd dear-imgui-conan-exemple
mkdir build
cd build
conan install .. -s build_type=Release --build missing
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
Release\dear-imgui-conan.exe