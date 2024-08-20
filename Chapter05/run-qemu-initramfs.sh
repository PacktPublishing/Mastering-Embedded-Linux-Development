#!/bin/bash
# Copy this script to and run it from your linux-stable directory

KERNEL=arch/arm64/boot/Image
INITRAMFS=${HOME}/initramfs.cpio.gz

if [ ! -f ${KERNEL} ]; then
	echo "${KERNEL} does not exist"
	exit 1
fi

if [ ! -f ${INITRAMFS} ]; then
	echo "${INITRAMFS} does not exist"
	exit 1
fi

QEMU_AUDIO_DRV=none \
qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel ${KERNEL} -append "console=ttyAMA0 rdinit=/bin/sh" -initrd ${INITRAMFS}
