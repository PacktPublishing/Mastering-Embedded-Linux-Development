SUMMARY = "Custom Kernel Module Example"
DESCRIPTION = "An example out-of-tree kernel module for Yocto"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = " \
    file://dummy.c \
    file://Makefile \
"

# The 'module' class simplifies building out-of-tree kernel modules
inherit module

S = "${WORKDIR}"
UNPACKDIR = "${S}"

# The inherit of module.bbclass will automatically name module packages with
# "kernel-module-" prefix as required by the oe-core build environment.
RPROVIDES:${PN} += "kernel-module-dummy"
