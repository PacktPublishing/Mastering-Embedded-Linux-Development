#!/bin/sh
BOARD_DIR="$(dirname $0)"

cp ${BUILD_DIR}/ti-k3-image-gen-08.06.00.007/tiboot3-am62x-gp-evm.bin $BINARIES_DIR/tiboot3.bin

GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg" GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

genimage \
    --rootpath "${TARGET_DIR}" \
    --tmppath "${GENIMAGE_TMP}" \
    --inputpath "${BINARIES_DIR}" \
    --outputpath "${BINARIES_DIR}" \
    --config "${GENIMAGE_CFG}"
