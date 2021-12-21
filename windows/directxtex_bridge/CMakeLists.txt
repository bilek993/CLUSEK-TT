cmake_minimum_required(VERSION 3.19)
project(directxtex_bridge)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)

add_library(directxtex_bridge SHARED bridge.cpp)

add_subdirectory(DirectXTex)
target_link_libraries(${PROJECT_NAME} DirectXTex)
include_directories(DirectXTex/DirectXTex)