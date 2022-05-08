#!/bin/bash

FFMPEG_VERSION=5.0
FFMPEG_SOURCE_DIR=FFmpeg-n$FFMPEG_VERSION
FFMPEG_LIBS="libavcodec libavdevice libavfilter libavformat libavutil libswresample libswscale"
PREFIX=`pwd`/output
ARCH="arm64"

if [ ! -d $FFMPEG_SOURCE_DIR ]; then
  echo "Start downloading FFmpeg..."
  curl -LJO https://codeload.github.com/FFmpeg/FFmpeg/tar.gz/n$FFMPEG_VERSION || exit 1
  tar -zxvf FFmpeg-n$FFMPEG_VERSION.tar.gz || exit 1
  rm -f FFmpeg-n$FFMPEG_VERSION.tar.gz
fi

echo "Start compiling FFmpeg..."

rm -rf $PREFIX
cd $FFMPEG_SOURCE_DIR

./configure \
  --prefix=$PREFIX \
  --cc="xcrun -sdk iphoneos clang" \
  --enable-cross-compile \
  --enable-version3 \
  --disable-programs \
  --disable-audiotoolbox \
  --disable-sdl2 \
  --disable-xlib \
  --disable-doc \
  --arch=$ARCH \
  --extra-cflags="-fno-stack-check" \
  --disable-debug || exit 1

make clean
make -j8 install || exit 1

cd ..

for LIB in $FFMPEG_LIBS; do
  ./build_framework.sh $PREFIX $LIB $FFMPEG_VERSION || exit 1
done

echo "The compilation of FFmpeg is completed."
