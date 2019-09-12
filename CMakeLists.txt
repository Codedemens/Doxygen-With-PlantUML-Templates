

cmake_minimum_required(VERSION 2.8)
project(DoxygenWithPlantUMLTemplates)

add_compile_options(-std=c++14)
add_compile_options(-O0)

if(CMAKE_BUILD_TYPE STREQUAL "Build")
    add_compile_options(-g)
endif()

add_subdirectory(${PROJECT_SOURCE_DIR}/src/)

message(STATUS "(Codedemens' message) : CMAKE_CXX_COMPILER_VERSION = ${CMAKE_CXX_COMPILER_VERSION}")

include_directories(${PROJECT_SOURCE_DIR}/src/)
if(UNIX)
    message(STATUS "(Codedemens' message) : Compiling for UNIX")
endif(UNIX)
if(WIN32)
    message(STATUS "(Codedemens' message) : Compiling for Windows")
endif(WIN32)

add_executable(doxygen_with_plantuml
    ${SOURCE}
    ${HEADERS}
)



if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set_target_properties(doxygen_with_plantuml
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/Debug"
        )
else()
    set_target_properties(doxygen_with_plantuml
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/Release"
        ) 
endif()

