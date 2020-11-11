#!/bin/bash
NDK=/Users/zhangjunling/Library/Android/sdk/ndk/android-ndk-r10d
PLATFORM=$NDK/platforms/android-21/arch-arm64
export PREBUILT=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64
export CC="$PREBUILT/bin/aarch64-linux-android-gcc --sysroot=${PLATFORM} -march=armv8-a"
export CXX="$PREBUILT/bin/aarch64-linux-android-g++ --sysroot=${PLATFORM}"
export LD="$PREBUILT/bin/aarch64-linux-android-ld"
export AS="$PREBUILT/bin/aarch64-linux-android-gcc"
export AR="$PREBUILT/bin/aarch64-linux-android-ar"
export RANLIB="$PREBUILT/bin/aarch64-linux-android-ranlib"
export PREFIX=/Users/zhangjunling/study/CrossCompileTest/thirdparty/libx264/arm64-v8a
export PATH=$PATH:$PREBUILT/bin:$PLATFORM/usr/include:

./configure --prefix=$PREFIX \
--enable-static \
--enable-pic \
--enable-strip \
--disable-cli \
--disable-asm \
--extra-cflags= "-march=armv8-a  -mfloat-abi=softfp -mfpu=neon" \
--host=arm-linux \
--cross-prefix=$PREBUILT/bin/aarch64-linux-android- \
--sysroot=$PLATFORM

make clean
make -j8
make install
