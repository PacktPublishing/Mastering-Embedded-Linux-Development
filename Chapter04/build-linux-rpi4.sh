#!/bin/bash
# Replace 2024.02-1 with the actual version of your Bootlin toolchain

set -e

$ git clone --depth=1 -b rpi-6.6.y https://github.com/raspberrypi/linux.git linux-rpi
$ git clone --depth=1 -b 1.20240529 https://github.com/raspberrypi/firmware.git firmware-rpi

mv firmware-rpi/boot .
rm -rf firmware-rpi

rm boot/kernel*
rm boot/*.dtb
rm boot/overlays/*.dtbo

PATH=${HOME}/aarch64--glibc--stable-2024.02-1/bin/:$PATH

cd linux-rpi
mkdir ../build_rpi

make ARCH=arm64 CROSS_COMPILE=aarch64-buildroot-linux-gnu- bcm2711_defconfig O=../build_rpi
make -j4 ARCH=arm64 CROSS_COMPILE=aarch64-buildroot-linux-gnu- O=../build_rpi

cp ../build_rpi/arch/arm64/boot/Image ../boot/kernel8.img
cp ../build_rpi/arch/arm64/boot/dts/overlays/*.dtbo ../boot/overlays/
cp ../build_rpi/arch/arm64/boot/dts/broadcom/*.dtb ../boot/

cat << EOF > ../boot/config.txt
enable_uart=1
arm_64bit=1
EOF

cat << EOF > ../boot/cmdline.txt
console=serial0,115200 console=tty1 root=/dev/mmcblk0p2 rootwait
EOF
