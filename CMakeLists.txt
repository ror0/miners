cmake_minimum_required(VERSION 3.10)

project(miners LANGUAGES CXX)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH};${CMAKE_SOURCE_DIR}/cmake)

include(MinersUtils)

message(${VERSION})

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(Vulkan REQUIRED FATAL_ERROR)
target_include_directories($(PROJECT_NAME) $(Vulkan_INCLUDE_DIRS))
target_link_libraries($(PROJECT_NAME) $(Vulkane_LIBRARIES))

find_package(SDL REQUIRED FATAL_ERROR)
target_include_directories($(PROJECT_NAME) $(SDL_INCLUDE_DIRS))
target_link_libraries($(PROJECT_NAME) $(SDL_LIBRARIES))

find_package(glm REQUIRED)
target_include_directories($(PROJECT_NAME) $(GLM_INCLUDE_DIRS))

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

