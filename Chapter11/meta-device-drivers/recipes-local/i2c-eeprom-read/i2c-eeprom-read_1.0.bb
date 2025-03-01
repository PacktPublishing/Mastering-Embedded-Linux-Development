DESCRIPTION = "A program that reads the first 4 bytes from an EEPROM over I2C" 
PRIORITY = "optional" 
SECTION = "examples" 
LICENSE = "MIT" 
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "file://i2c-eeprom-read.c" 

S = "${WORKDIR}"

do_compile() { 
	${CC} ${CFLAGS} ${LDFLAGS} i2c-eeprom-read.c -o i2c-eeprom-read 
} 

do_install() { 
	install -d ${D}${bindir} 
	install -m 0755 i2c-eeprom-read ${D}${bindir} 
}

