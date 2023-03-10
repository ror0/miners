find_package(Git REQUIRED)

execute_process(COMMAND ${GIT_EXECUTABLE} describe --abbrev=0 --tags
	WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
	OUTPUT_VARIABLE ${PROJECT_NAME}_VERSION_MAIN
	OUTPUT_STRIP_TRAILING_WHITESPACE)

execute_process(COMMAND ${GIT_EXECUTABLE} rev-parse --short HEAD
	WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
	OUTPUT_VARIABLE ${PROJECT_NAME}_VERSION_COMMIT
	OUTPUT_STRIP_TRAILING_WHITESPACE)

set(VERSION ${${PROJECT_NAME}_VERSION_MAIN}.${${PROJECT_NAME}_VERSION_COMMIT})
