# Regex to match license notices at the top of module files.
set(notice_regex [[^# Distributed under the OSI-approved BSD 3-Clause License\.  See accompanying
# file Copyright\.txt or https://cmake\.org/licensing for details\.

]])
string(REPLACE "\n" "\r?\n" notice_regex "${notice_regex}")
string(REPLACE "\r\r" "\r" notice_regex "${notice_regex}")

# Modules that do not require our notice.
set(notice_exceptions
  FindCUDA.cmake # MIT License, distributed here from upstream project
  )

# Load the list of modules to check.
set(dir "/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/Modules")
file(GLOB all_modules RELATIVE "${dir}" "${dir}/*.cmake")
list(REMOVE_ITEM all_modules ${notice_exceptions})

# Check each module.
set(notice_missing)
foreach(module ${all_modules})
  message(STATUS "module: ${module}")
  file(READ "${dir}/${module}" module_content)
  if(NOT "${module_content}" MATCHES "${notice_regex}")
    string(APPEND notice_missing "  ${module}\n")
  endif()
endforeach()

# Report the list of bad modules.
if(notice_missing)
  message(FATAL_ERROR
    "Some modules do not have a valid copyright notice:\n${notice_missing}")
endif()
