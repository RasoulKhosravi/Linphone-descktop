# CMake generated Testfile for 
# Source directory: /home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/Utilities/cmcurl
# Build directory: /home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/Utilities/cmcurl
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[curl]=] "curltest" "http://open.cdash.org/user.php")
set_tests_properties([=[curl]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/Utilities/cmcurl/CMakeLists.txt;1653;add_test;/home/khosro/Documents/porjects/Linphone/linphone-desktop/cmake-3.28.3/Utilities/cmcurl/CMakeLists.txt;0;")
subdirs("lib")
