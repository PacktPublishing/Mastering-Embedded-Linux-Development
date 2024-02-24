#!/bin/bash
# Replace 2023.08-1 with the actual version of your Bootlin toolchain

set -e

git clone --depth=1 -b rpi-6.1.y https://github.com/raspberrypi/linux.git
svn export https://github.com/raspberrypi/firmware/trunk/boot

rm boot/kernel*
rm boot/*.dtb
rm boot/overlays/*.dtbo

PATH=${HOME}/aarch64--glibc--stable-2023.08-1/bin/:$PATH

cd linux

make ARCH=arm64 CROSS_COMPILE=aarch64-buildroot-linux-gnu- bcm2711_defconfig
make -j4 ARCH=arm64 CROSS_COMPILE=aarch64-buildroot-linux-gnu-

cp arch/arm64/boot/Image ../boot/kernel8.img
cp arch/arm64/boot/dts/overlays/*.dtbo ../boot/overlays/
cp arch/arm64/boot/dts/broadcom/*.dtb ../boot/

cat << EOF > ../boot/config.txt
enable_uart=1
arm_64bit=1
EOF

cat << EOF > ../boot/cmdline.txt
console=serial0,115200 console=tty1 root=/dev/mmcblk0p2 rootwait
EOF
