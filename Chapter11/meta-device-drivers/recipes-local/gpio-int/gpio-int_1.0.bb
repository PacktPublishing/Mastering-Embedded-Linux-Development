DESCRIPTION = "A program that waits for GPIO interrupts from a button press" 
PRIORITY = "optional" 
SECTION = "examples" 
LICENSE = "MIT" 
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = " \
        file://gpio-int.c \
        file://config-gpio.sh \
"

S = "${WORKDIR}"

do_compile() { 
	${CC} ${CFLAGS} ${LDFLAGS} gpio-int.c -o gpio-int 
} 

do_install() { 
	install -d ${D}${bindir} 
	install -m 0755 gpio-int ${D}${bindir} 
        install -m 0755 config-gpio.sh ${D}${bindir}
}

