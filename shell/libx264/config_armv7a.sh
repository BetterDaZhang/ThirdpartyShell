#!/bin/bash
NDK=/Users/zhangjunling/Library/Android/sdk/ndk/android-ndk-r10d
export PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.6/prebuilt/darwin-x86_64
export CC="$PREBUILT/bin/arm-linux-androideabi-gcc --sysroot=${PLATFORM} -march=armv7-a"
export LD="$PREBUILT/bin/arm-linux-androideabi-ld"
export AS="$PREBUILT/bin/arm-linux-androideabi-gcc"
export AR="$PREBUILT/bin/arm-linux-androideabi-ar"
export RANLIB="$PREBUILT/bin/arm-linux-androideabi-ranlib"
export PLATFORM=$NDK/platforms/android-9/arch-arm 
export PREFIX=/Users/zhangjunling/study/CrossCompileTest/thirdparty/libx264/armv7a/
export PATH=$PATH:$PREBUILT/bin:$PLATFORM/usr/include:

./configure --prefix=$PREFIX \
--enable-static \
--enable-pic \
--enable-strip \
--disable-cli \
--disable-asm \
--extra-cflags= "-march=armv7-a  -mfloat-abi=softfp -mfpu=neon" \
--host=arm-linux \
--cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
--sysroot=$PLATFORM

make clean
make -j8
make install
