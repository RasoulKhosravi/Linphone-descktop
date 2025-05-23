# Choose a configuration with which to drive CTest tests.
if(CTEST_CONFIGURATION_TYPE)
  set(CTestTest_CONFIG "${CTEST_CONFIGURATION_TYPE}")
else()
  set(CTestTest_CONFIG "Release")
endif()

# Choose a configuration that was built if none is given.
if(NOT CTEST_CONFIGURATION_TYPE)
  set(CTEST_CMD "/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/bin/ctest")
  get_filename_component(CTEST_DIR "${CTEST_CMD}" PATH)
  get_filename_component(CTEST_EXE "${CTEST_CMD}" NAME)
  foreach(cfg IN ITEMS Release Debug MinSizeRel RelWithDebInfo)
    if(NOT CTEST_CONFIGURATION_TYPE)
      if(EXISTS "${CTEST_DIR}/${cfg}/${CTEST_EXE}")
        set(CTEST_CONFIGURATION_TYPE ${cfg})
      endif()
    endif()
  endforeach()
  if(NOT CTEST_CONFIGURATION_TYPE)
    if("GNU;;GNU" STREQUAL "Clang;MSVC;GNU")
      # A valid configuration is required for this compiler in tests that do not set CMP0091 to NEW.
      set(CTEST_CONFIGURATION_TYPE Debug)
    else()
      set(CTEST_CONFIGURATION_TYPE NoConfig)
    endif()
  endif()
  message("Guessing configuration ${CTEST_CONFIGURATION_TYPE}")
endif()

# Isolate tests from user configuration in the environment.
unset(ENV{CMAKE_GENERATOR})
unset(ENV{CMAKE_GENERATOR_INSTANCE})
unset(ENV{CMAKE_GENERATOR_PLATFORM})
unset(ENV{CMAKE_GENERATOR_TOOLSET})
unset(ENV{CMAKE_EXPORT_COMPILE_COMMANDS})

# Verify that our module implementations do not recurse too much.
set(ENV{CMAKE_MAXIMUM_RECURSION_DEPTH} 100)

# Fake a user home directory to avoid polluting the real one.
# But provide original ENV{HOME} value in ENV{CTEST_REAL_HOME} for tests that
# need access to the real HOME directory.
if(DEFINED ENV{HOME} AND NOT DEFINED ENV{CTEST_REAL_HOME})
  set(ENV{CTEST_REAL_HOME} "$ENV{HOME}")
endif()
set(ENV{HOME} "/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/Tests/CMakeFiles/TestHome")


