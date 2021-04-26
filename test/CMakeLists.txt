######################################################################################
## Find thirdparty packages
######################################################################################
find_package(GTest REQUIRED)
find_package(Blake2 REQUIRED)
include(GoogleTest)


######################################################################################
## Add Test
######################################################################################
add_executable(blake2s_test blake2s_test.cpp blake2s_wrapper.hpp)
add_dependencies(blake2s_test libb2)
target_include_directories(blake2s_test PRIVATE ${BLAKE2_INCLUDES} ${GTEST_INCLUDES})
target_link_libraries(blake2s_test PRIVATE gtest_main ${BLAKE2_LIBRARY})
gtest_discover_tests(blake2s_test)