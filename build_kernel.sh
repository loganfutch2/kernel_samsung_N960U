#!/bin/bash
export ARCH=arm64
export CROSS_COMPILE=~/toolchains/note9/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export ANDROID_MAJOR_VERSION=o
mkdir out

make -C $(pwd) O=out -j8 ARCH=arm64 CROSS_COMPILE=~/toolchains/note9/aarch64-linux-android-4.9/bin/aarch64-linux-android- KCFLAGS=-mno-android crownqlte_chn_open_defconfig
make -C $(pwd) O=out -j8 ARCH=arm64 CROSS_COMPILE=~/toolchains/note9/aarch64-linux-android-4.9/bin/aarch64-linux-android- KCFLAGS=-mno-android


cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image

cp $(pwd)/out/arch/arm64/boot/Image.gz $(pwd)/prebuilt_dtb/Image.gz

cd $(pwd)/prebuilt_dtb
cp Image.gz Image.gz-dtb
cat dt.img >> Image.gz-dtb

echo "Find the Image.gz-dtb in prebuilt_dtb"