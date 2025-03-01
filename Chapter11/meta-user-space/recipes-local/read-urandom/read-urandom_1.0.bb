DESCRIPTION = "A program that reads a word of pseudorandom data" 
PRIORITY = "optional" 
SECTION = "examples" 
LICENSE = "MIT" 
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "file://read-urandom.c" 

S = "${WORKDIR}"

do_compile() { 
	${CC} ${CFLAGS} ${LDFLAGS} read-urandom.c -o read-urandom 
} 

do_install() { 
	install -d ${D}${bindir} 
	install -m 0755 read-urandom ${D}${bindir} 
}

