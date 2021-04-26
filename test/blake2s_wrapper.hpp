#pragma once

#include <blake2.h>

namespace blake2s_test
{

class blake2s_wrapper final
{
public:
    static int blake2s_hash(uint8_t* out, const void* in, const void* key, size_t outlen, size_t inlen, size_t keylen)
    {
#ifdef _WIN32
        return blake2s(out, outlen, in, inlen, key, keylen);
#elif __linux__
        return blake2s(out, in, key, outlen, inlen, keylen);
#else
        return -1;
#endif
    }

private:
    blake2s_wrapper() = default;
};

} // namespace blake2s_test