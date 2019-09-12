

cmake_minimum_required(VERSION 2.8)
project(DoxygenWithPlantUMLTemplates)

#add_compile_options(-std=c++14)
add_compile_options(-std=gnu++14)
add_compile_options(-O0)

if(CMAKE_BUILD_TYPE STREQUAL "Build")
    add_compile_options(-g)
endif()

add_subdirectory(${PROJECT_SOURCE_DIR}/src)

message(STATUS "(Codedemens' message) : CMAKE_CXX_COMPILER_VERSION = ${CMAKE_CXX_COMPILER_VERSION}")

if(UNIX)
    message(STATUS "(Codedemens' message) : Compiling for UNIX")
    message(STATUS "(Codedemens' message) : That's why we're using linux libraries")

    link_directories(${PROJECT_SOURCE_DIR}/ext/linux/lib)

    include_directories(${PROJECT_SOURCE_DIR}/src/
        ${PROJECT_SOURCE_DIR}/include
        ${PROJECT_SOURCE_DIR}/ext/linux/include/
        ${PROJECT_SOURCE_DIR}/ext/linux/include/wx-3.1
        ${PROJECT_SOURCE_DIR}/ext/linux/lib/wx/include/gtk2-unicode-3.1/
    )

add_compile_options(-D_FILE_OFFSET_BITS=64 -DWXUSINGDLL -D__WXGTK__ -pthread)
endif(UNIX)
if(WIN32)
    if(CMAKE_CXX_COMPILER_VERSION GREATER_EQUAL 8.2) 
        message(STATUS "(Codedemens' message) : Compiling for Windows")
        message(STATUS "(Codedemens' message) : CMAKE_CXX_COMPILER_VERSION is greater OR equal 8.2")
        message(STATUS "(Codedemens' message) : That's why we're using GNU 8.2.0-3 compiled libraries")

        link_directories(${PROJECT_SOURCE_DIR}/ext/windows_8_GNU_8.2.0-3/lib)

        include_directories(${PROJECT_SOURCE_DIR}/src/
            ${PROJECT_SOURCE_DIR}/include
            ${PROJECT_SOURCE_DIR}/ext/windows_8_GNU_8.2.0-3/include
            ${PROJECT_SOURCE_DIR}/ext/windows_8_GNU_8.2.0-3/lib/mswu
            )    

    else()
        message(STATUS "(Codedemens' message) : Compiling for Windows")
        message(STATUS "(Codedemens' message) : CMAKE_CXX_COMPILER_VERSION is not greater OR equal 8.2")
        message(STATUS "(Codedemens' message) : That's why we're using standard libraries for windows")
        link_directories(${PROJECT_SOURCE_DIR}/ext/windows/lib)

        include_directories(${PROJECT_SOURCE_DIR}/src/
            ${PROJECT_SOURCE_DIR}/include
            ${PROJECT_SOURCE_DIR}/ext/windows/include
            ${PROJECT_SOURCE_DIR}/ext/windows/lib/mswu
            )
    endif()
endif(WIN32)




add_executable(monitorowanie
    ${SOURCE}
    ${HEADERS}
)
add_executable(serwis_monitorowania
    ${SERVICE_SOURCE}
    ${SERVICE_HEADERS}
)


if(WIN32)
    add_custom_command(
 	 TARGET monitorowanie POST_BUILD
 	 COMMAND ${CMAKE_COMMAND} -E copy 
  	 ${CMAKE_SOURCE_DIR}/ext/windows/lib/wxbase312u_gcc_custom.dll
	  ${CMAKE_BINARY_DIR}/bin/wxbase312u_gcc_custom.dll
	)

    add_custom_command(
 	 TARGET monitorowanie POST_BUILD
 	 COMMAND ${CMAKE_COMMAND} -E copy 
  	 ${CMAKE_SOURCE_DIR}/ext/windows/lib/wxmsw312u_core_gcc_custom.dll
	  ${CMAKE_BINARY_DIR}/bin/wxmsw312u_core_gcc_custom.dll
	)
endif(WIN32)



if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set_target_properties(monitorowanie
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/Debug"
        )   
    set_target_properties(serwis_monitorowania
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/Debug"
        )   
else()
    set_target_properties(monitorowanie
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/Release"
        )  
    set_target_properties(serwis_monitorowania
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/Release"
        )   
endif()

if(UNIX)
    target_link_libraries(monitorowanie pthread wx_gtk2u_xrc-3.1 wx_gtk2u_html-3.1 wx_gtk2u_qa-3.1 wx_gtk2u_core-3.1 wx_baseu_xml-3.1 wx_baseu_net-3.1 wx_baseu-3.1)
elseif(WIN32)
    if(CMAKE_CXX_COMPILER_VERSION GREATER_EQUAL 8.2) 
        target_link_libraries(monitorowanie wxbase31u wxmsw31u_gl wxmsw31u_xrc wxbase31u_net wxmsw31u_html wxpng wxbase31u_xml wxmsw31u_media wxregexu wxexpat wxmsw31u_propgrid  wxscintilla wxjpeg wxmsw31u_ribbon wxtiff wxmsw31u_adv wxmsw31u_richtext  wxzlib wxmsw31u_aui wxmsw31u_stc wxmsw31u_core wxmsw31u_webview)
    else()
        target_link_libraries(monitorowanie wxbase31u wxexpat wxmsw31u_adv wxmsw31u_aui wxmsw31u_core wxmsw31u_gl wxmsw31u_html wxmsw31u_media wxmsw31u_propgrid wxmsw31u_qa wxmsw31u_ribbon wxmsw31u_richtext wxmsw31u_stc wxmsw31u_webview wxmsw31u_xrc wxjpeg wxpng wxregexu wxscintilla wxtiff wxzlib)
    endif()
endif()
