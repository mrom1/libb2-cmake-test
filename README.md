# libb2-cmake-test

![windows-build](https://github.com/mrom1/libb2-cmake-test/actions/workflows/windows.yml/badge.svg)
![linux-build](https://github.com/mrom1/libb2-cmake-test/actions/workflows/linux.yml/badge.svg)

This is a simple repository testing the cross-platform build of [blake2s](https://github.com/BLAKE2/libb2) with CMake.

The Linux build compiles a current version in source from the blake2 github repository.

**The Windows build uses a fork targeting a older blake2 version. Thanks to [BurningEnlightment](https://github.com/BurningEnlightenment/libb2) for creating the CMake files.**

If you need a more recent version of blake2 with cmake support for windows consider using another library (e.g. [libsodium](https://github.com/jedisct1/libsodium)). Most libraries support blake2b (like sodium) but not blake2s which is why I created this repository.

## How to build

```
cmake -S. -Bbuild
cmake --build build
```

## Run tests
```
cd build
ctest
```
