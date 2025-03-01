DESCRIPTION = "A program that prints the MAC address of a network interface" 
PRIORITY = "optional" 
SECTION = "examples" 
LICENSE = "MIT" 
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "file://show-mac-address.c" 

S = "${WORKDIR}"

do_compile() { 
	${CC} ${CFLAGS} ${LDFLAGS} show-mac-address.c -o show-mac-address 
} 

do_install() { 
	install -d ${D}${bindir} 
	install -m 0755 show-mac-address ${D}${bindir} 
}

