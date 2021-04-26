#include "blake2s_wrapper.hpp"

#include <string>
#include <array>
#include <iostream>
#include <iomanip>
#include <sstream>

#include <gtest/gtest.h>

using namespace blake2s_test;

TEST(blake2, blake2s_hash)
{
    const std::string input = "this is the password";
    const std::string expectedHash = "44784ce903d532a05dbdb8226a954094d52b60e10e0f61cf0fd26d917bc77126";

    std::array<std::uint8_t, blake2s_constant::BLAKE2S_OUTBYTES> outputHash;

    int blake2sResult = blake2s_wrapper::blake2s_hash(outputHash.data(), input.data(), nullptr, outputHash.size(), input.size(), 0);

    ASSERT_GE(blake2sResult, 0);

    std::ostringstream oss;
    oss << std::hex << std::setfill('0');
    for (int i = 0; i < blake2s_constant::BLAKE2S_OUTBYTES; i++)
    {
        oss << std::setw(2) << (unsigned int)outputHash[i];
    }
    std::string calculatedHash = oss.str();

    ASSERT_EQ(calculatedHash, expectedHash);
}