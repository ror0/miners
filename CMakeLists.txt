cmake_minimum_required(VERSION 3.10)

project(miners
	LANGUAGES CXX
)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH};${CMAKE_SOURCE_DIR}/cmake)

include(MinersUtils)

message(${VERSION})

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

configure_file(config.h.in
	${PROJECT_BINARY_DIR}/config.h
	@ONLY
)

add_executable(miners
	src/main.cpp
)

target_include_directories(miners
	PUBLIC dep
	PUBLIC include
	PUBLIC ${PROJECT_BINARY_DIR}
)

