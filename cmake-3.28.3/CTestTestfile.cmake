# CMake generated Testfile for 
# Source directory: /home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3
# Build directory: /home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
include("/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/Tests/EnforceConfig.cmake")
add_test([=[SystemInformationNew]=] "/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/bin/cmake" "--system-information" "-G" "Unix Makefiles")
set_tests_properties([=[SystemInformationNew]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/CMakeLists.txt;523;add_test;/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/CMakeLists.txt;0;")
subdirs("Source/kwsys")
subdirs("Utilities/std")
subdirs("Utilities/KWIML")
subdirs("Utilities/cmlibrhash")
subdirs("Utilities/cmzlib")
subdirs("Utilities/cmcurl")
subdirs("Utilities/cmnghttp2")
subdirs("Utilities/cmexpat")
subdirs("Utilities/cmbzip2")
subdirs("Utilities/cmzstd")
subdirs("Utilities/cmliblzma")
subdirs("Utilities/cmlibarchive")
subdirs("Utilities/cmjsoncpp")
subdirs("Utilities/cmlibuv")
subdirs("Source/CursesDialog/form")
subdirs("Utilities/cmcppdap")
subdirs("Source")
subdirs("Utilities")
subdirs("Tests")
subdirs("Auxiliary")
