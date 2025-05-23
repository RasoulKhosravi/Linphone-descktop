set(_isMultiConfig "0")
set(CTEST_SOURCE_DIRECTORY "/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/Tests/CTestConfig")
set(CTEST_BINARY_DIRECTORY "/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/Tests/CTestConfig/Debug-dashboard")

file(MAKE_DIRECTORY "${CTEST_BINARY_DIRECTORY}")

get_filename_component(dir "${CMAKE_COMMAND}" PATH)
set(CMAKE_CTEST_COMMAND "${dir}/ctest")

message("CMAKE_COMMAND='${CMAKE_COMMAND}'")
message("CMAKE_CTEST_COMMAND='${CMAKE_CTEST_COMMAND}'")

set(arg "")
if(NOT _isMultiConfig)
  set(arg "-DCMAKE_BUILD_TYPE:STRING=Debug")
else()
  set(arg "-DCMAKE_CONFIGURATION_TYPES=Debug\\;Release\\;MinSizeRel\\;RelWithDebInfo")
endif()

message("cmake initial configure")
execute_process(COMMAND ${CMAKE_COMMAND}
   ${arg}
   -G "Unix Makefiles"
   -A ""
   -T ""
   ${CTEST_SOURCE_DIRECTORY}
  WORKING_DIRECTORY ${CTEST_BINARY_DIRECTORY}
  RESULT_VARIABLE rv)
if(NOT rv STREQUAL 0)
  message(FATAL_ERROR "error calling cmake: rv='${rv}'")
endif()


function(call_ctest arg)
  message("call_ctest ${arg}")
  execute_process(COMMAND ${CMAKE_CTEST_COMMAND}
    -C "Debug" -D ${arg} -VV
    WORKING_DIRECTORY ${CTEST_BINARY_DIRECTORY}
    RESULT_VARIABLE rv)
  if(NOT rv STREQUAL 0)
    message(FATAL_ERROR "error calling ctest: rv='${rv}'")
  endif()
endfunction()


call_ctest(ExperimentalStart)
call_ctest(ExperimentalConfigure)
call_ctest(ExperimentalBuild)
call_ctest(ExperimentalTest)
