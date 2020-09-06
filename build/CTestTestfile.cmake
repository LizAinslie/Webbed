# CMake generated Testfile for 
# Source directory: /home/rail/code/webbed
# Build directory: /home/rail/code/webbed/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(appstreamtest "/usr/bin/cmake" "-DAPPSTREAMCLI=/usr/bin/appstreamcli" "-DINSTALL_FILES=/home/rail/code/webbed/build/install_manifest.txt" "-P" "/usr/local/share/ECM/kde-modules/appstreamtest.cmake")
set_tests_properties(appstreamtest PROPERTIES  _BACKTRACE_TRIPLES "/usr/local/share/ECM/kde-modules/KDECMakeSettings.cmake;163;add_test;/usr/local/share/ECM/kde-modules/KDECMakeSettings.cmake;181;appstreamtest;/usr/local/share/ECM/kde-modules/KDECMakeSettings.cmake;0;;/home/rail/code/webbed/CMakeLists.txt;14;include;/home/rail/code/webbed/CMakeLists.txt;0;")
subdirs("src")
