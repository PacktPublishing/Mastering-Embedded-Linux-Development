#!/bin/sh
BOARD_DIR="$(dirname $0)"

cp ${BUILD_DIR}/ti-k3-r5-loader-2022.10/tiboot3.bin $BINARIES_DIR/tiboot3.bin

GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg" GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

genimage \
    --rootpath "${TARGET_DIR}" \
    --tmppath "${GENIMAGE_TMP}" \
    --inputpath "${BINARIES_DIR}" \
    --outputpath "${BINARIES_DIR}" \
    --config "${GENIMAGE_CFG}"
