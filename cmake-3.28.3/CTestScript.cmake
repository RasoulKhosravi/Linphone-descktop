cmake_minimum_required(VERSION 2.4)

# This is a template for the CTest script for this system

set(CTEST_SITE                          "khosro")
set(CTEST_BUILD_NAME                    "Linux-g++")

# ---
set(CTEST_SOURCE_DIRECTORY              "/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3")
set(CTEST_BINARY_DIRECTORY              "/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3")
set(CTEST_UPDATE_COMMAND                "")
set(CTEST_UPDATE_OPTIONS                "")
set(CTEST_CMAKE_GENERATOR               "Unix Makefiles")
set(CTEST_BUILD_CONFIGURATION           "Release")
#set(CTEST_MEMORYCHECK_COMMAND           "MEMORYCHECK_COMMAND-NOTFOUND")
#set(CTEST_MEMORYCHECK_SUPPRESSIONS_FILE "")
#set(CTEST_MEMORYCHECK_COMMAND_OPTIONS   "")
#set(CTEST_COVERAGE_COMMAND              "/usr/bin/gcov")
set(CTEST_NOTES_FILES                   "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}")

#CTEST_EMPTY_BINARY_DIRECTORY(${CTEST_BINARY_DIRECTORY})

set(CTEST_DROP_METHOD "http")

CTEST_START(Experimental TRACK Weekly)
CTEST_UPDATE(SOURCE "${CTEST_SOURCE_DIRECTORY}")
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_READ_CUSTOM_FILES("${CTEST_BINARY_DIRECTORY}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_TEST(BUILD "${CTEST_BINARY_DIRECTORY}")
#CTEST_MEMCHECK(BUILD "${CTEST_BINARY_DIRECTORY}")
#CTEST_COVERAGE(BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_SUBMIT()
