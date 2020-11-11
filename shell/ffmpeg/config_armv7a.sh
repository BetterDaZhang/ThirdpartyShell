#!/bin/bash
NDK_HOME=/Users/zhangjunling/Library/Android/sdk/ndk/android-ndk-r10d
PROJECT_PATH=`pwd`
echo $PROJECT_PATH
ANDROID_NDK_ROOT=$NDK_HOME
PREBUILT=$ANDROID_NDK_ROOT/toolchains/arm-linux-androideabi-4.8/prebuilt/darwin-x86_64
PLATFORM=$ANDROID_NDK_ROOT/platforms/android-9/arch-arm
PREFIX=/Users/zhangjunling/study/CrossCompileTest/thirdparty/ffmpeg/armv7a
CROSS_COMPILE_PATH=/Users/zhangjunling/study/CrossCompileTest/ffmpeg_2.8.5_android/external_libs/cross-compile-sdk

./configure \
--target-os=linux \
--arch=arm \
--enable-gpl \
--disable-shared \
--disable-stripping \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffserver \
--disable-ffprobe \
--disable-avdevice \
--disable-indevs \
--disable-devices \
--disable-debug \
--disable-asm \
--disable-yasm \
--disable-doc \
--disable-bsfs \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-indevs \
--disable-outdevs \
--enable-cross-compile \
--cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
--enable-filter=aresample \
--enable-bsf=aac_adtstoasc \
--enable-bsf=h264_mp4toannexb \
--enable-small \
--enable-dct \
--enable-dwt \
--enable-lsp \
--enable-mdct \
--enable-rdft \
--enable-fft \
--enable-static \
--enable-version3 \
--enable-nonfree \
--disable-encoders \
--enable-encoder=pcm_s16le \
--enable-encoder=aac \
--enable-encoder=libfdk_aac \
--enable-encoder=libx264 \
--enable-encoder=mp2 \
--disable-decoders \
--enable-decoder=aac \
--enable-decoder=mjpeg \
--enable-decoder=png \
--enable-decoder=gif \
--enable-decoder=mp3 \
--enable-decoder=h264 \
--enable-decoder=pcm_s16le \
--disable-parsers \
--enable-parser=mjpeg  \
--enable-parser=png  \
--enable-parser=aac  \
--enable-parser=h264  \
--enable-parser=mpeg4video  \
--enable-parser=mpegvideo  \
--enable-parser=mpegaudio  \
--disable-muxers \
--enable-muxer=avi \
--enable-muxer=flv \
--enable-muxer=mp4 \
--enable-muxer=m4v \
--enable-muxer=mp3 \
--enable-muxer=mov \
--enable-muxer=h264 \
--enable-muxer=wav \
--enable-muxer=adts \
--disable-demuxers \
--enable-demuxer=mjpeg \
--enable-demuxer=m4v \
--enable-demuxer=gif \
--enable-demuxer=mov \
--enable-demuxer=avi \
--enable-demuxer=flv \
--enable-demuxer=h264 \
--enable-demuxer=aac \
--enable-demuxer=mp3 \
--enable-demuxer=wav \
--disable-protocols \
--enable-protocol=rtmp \
--enable-protocol=file \
--enable-protocol=http \
--disable-filters \
--enable-filter=transpose \
--enable-filter=crop \
--enable-filter=vflip \
--enable-filter=hflip \
--enable-libx264 \
--enable-libfdk_aac \
--sysroot=$PLATFORM \
--extra-cflags="-marm -march=armv7-a -I$PLATFORM/usr/include -I$CROSS_COMPILE_PATH/fdk-aac/armv7a/include -I$CROSS_COMPILE_PATH/libx264/armv7a/include" \
--extra-ldflags="-marm -march=armv7-a -L$PLATFORM/usr/lib  -L$CROSS_COMPILE_PATH/fdk-aac/armv7a/lib -L$CROSS_COMPILE_PATH/libx264/armv7a/lib" \
--prefix=$PREFIX

echo $PREFIX

make clean
make -j8
make install

#FFMPEG_RTMP_OPTIONS="--enable-protocol=librtmp --enable-protocol=librtmpe --enable-protocol=librtmps --enable-protocol=librtmpt --enable-protocol=librtmpte --enable-librtmp"
#FFMPEG的可选编译参数 用于选择RTMP推流使用的库 默认使用LIBRTMP并支持RTMP RTMPT RTMPE RTMPTE RTMPS协议
#RTMP推流库选择参数:
#要使用LIBRTMP(支持RTMP RTMPT RTMPE RTMPTE RTMPS协议)需要加参数 --enable-protocol=librtmp --enable-protocol=librtmpe --enable-protocol=librtmps --enable-protocol=librtmpt --enable-protocol=librtmpte --enable-librtmp
#要使用FFMPEG NATIVE RTMP(仅支持RTMP协议)需要加参数 --enable-protocol=rtmp
#LIBRTMP与FFMPEG NATIVE RTMP只能选择其中一种 同时加两种参数时会使用LIBRTMP 建议按需要选择



