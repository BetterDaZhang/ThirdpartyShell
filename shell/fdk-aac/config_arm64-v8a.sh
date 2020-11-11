#!/bin/bash
#Type Your NDK Root Path
NDK=/Users/zhangjunling/Library/Android/sdk/ndk/android-ndk-r10d
PREBUILT=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64
PLATFORM=$NDK/platforms/android-21/arch-arm64
export PATH=$PATH:$PREBUILT/bin:$PLATFORM/usr/include:

#export LDFLAGS="-nostdlib -Bdynamic -Wl,--whole-archive -Wl,--no-undefined -Wl,-z,noexecstack  -Wl,-z,nocopyreloc -Wl,-soname,/system/lib/libz.so -Wl,-rpath-link=$ARM_LIB,-dynamic-linker=/system/bin/linker -L$PLATFORM/usr/lib -L$PREBUILT/arm-linux-androideabi/lib -L$NDK/sources/cxx-stl/gnu-libstdc++/4.6/libs/armeabi -lgnustl_static -L$NDK/sources/cxx-stl/stlport/libs/armeabi -lstlport_static -lc -lgcc -lm -ldl "
#export CFLAGS="-I$NDK/sources/cxx-stl/gnu-libstdc++/4.6/include -I$NDK/sources/cxx-stl/stlport/stlport -I$PLATFORM/usr/include -fpic -DANDROID -fpic -mthumb-interwork -ffunction-sections -funwind-tables -fstack-protector -fno-short-enums -D__ARM_ARCH_5__ -D__ARM_ARCH_5T__ -D__ARM_ARCH_5E__ -D__ARM_ARCH_5TE__  -Wno-psabi -march=armv5te -mtune=xscale -msoft-float -mthumb -Os -fomit-frame-pointer -fno-strict-aliasing -finline-limit=64 -DANDROID  -Wa,--noexecstack -MMD -MP"

export LDFLAGS="-L$PLATFORM/usr/lib  -O3"
export CFLAGS="-I$PLATFORM/usr/include -O3"

export CPPFLAGS="$CFLAGS"
export CFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="$LDFLAGS"

export AS=$PREBUILT/bin/aarch64-linux-android-as
export LD=$PREBUILT/bin/aarch64-linux-android-ld
export CXX="$PREBUILT/bin/aarch64-linux-android-g++ --sysroot=${PLATFORM}"
export CC="$PREBUILT/bin/aarch64-linux-android-gcc --sysroot=${PLATFORM}"
export NM=$PREBUILT/bin/aarch64-linux-android-nm
export STRIP=$PREBUILT/bin/aarch64-linux-android-strip
export RANLIB=$PREBUILT/bin/aarch64-linux-android-ranlib
export AR=$PREBUILT/bin/aarch64-linux-android-ar

./configure --host=aarch64-linux \
--target=android \
--enable-static \
--disable-shared \
--with-sysroot=${PLATFORM} \
--prefix=/Users/zhangjunling/study/CrossCompileTest/thirdparty/fdk-aac/arm64-v8a/


make clean
make -j8
make install