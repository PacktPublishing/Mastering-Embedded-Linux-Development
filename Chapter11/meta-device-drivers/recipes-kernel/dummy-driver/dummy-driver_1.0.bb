SUMMARY = "Custom Kernel Module Example"
DESCRIPTION = "An example out-of-tree kernel module for Yocto."
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = " \
    file://dummy.c \
    file://Makefile \
"

# The class 'module' simplifies building out-of-tree kernel modules
inherit module

# This is where Yocto will unpack/compile your sources
S = "${WORKDIR}"

do_compile() {
    oe_runmake 
}

do_install() {
    install -d ${D}/lib/modules/${KERNEL_VERSION}/extra
    install -m 0644 dummy.ko ${D}/lib/modules/${KERNEL_VERSION}/extra
}

FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/extra/dummy.ko"

