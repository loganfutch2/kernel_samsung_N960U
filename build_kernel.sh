#!/bin/bash
export ARCH=arm64
export CROSS_COMPILE=~/toolchains/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export ANDROID_MAJOR_VERSION=o
mkdir out

make -C $(pwd) O=out -j8 ARCH=arm64 CROSS_COMPILE=~/toolchains/aarch64-linux-android-4.9/bin/aarch64-linux-android- KCFLAGS=-mno-android crownqlte_chn_open_defconfig
make -C $(pwd) O=out -j8 ARCH=arm64 CROSS_COMPILE=~/toolchains/aarch64-linux-android-4.9/bin/aarch64-linux-android- KCFLAGS=-mno-android


cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image


