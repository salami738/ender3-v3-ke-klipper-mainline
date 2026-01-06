#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(dirname "$0")"
cd "$SCRIPT_DIR"
SCRIPT_DIR="$(pwd)"

# echo "SCRIPT_DIR: $SCRIPT_DIR"
KLIPPER_DIR="$(cd "${SCRIPT_DIR}/../../../klipper" && pwd)"
# echo "KLIPPER_DIR: $KLIPPER_DIR"

TC="$(cd ../../../mips-toolchain/mips32r5el--glibc--bleeding-edge-2018.11-1 && pwd)"
echo "TC: $TC"

if [ ! -e "${TC}/bin/mipsel-buildroot-linux-gnu-gcc" ]; then
  echo "Invalid TC dir: $TC, gcc missing, ABORTING"
  exit 2
fi

export CROSS_BIN="${TC}/mipsel-buildroot-linux-gnu/bin"
export CROSS_PREFIX="${TC}/bin/mipsel-buildroot-linux-gnu-"

pushd "$KLIPPER_DIR" >/dev/null
make clean KCONFIG_CONFIG="${SCRIPT_DIR}/klipper-host-mcu.config" >/dev/null
# set Linux / Linux process
make menuconfig KCONFIG_CONFIG="${SCRIPT_DIR}/klipper-host-mcu.config"
make -j$(nproc) KCONFIG_CONFIG="${SCRIPT_DIR}/klipper-host-mcu.config" >/dev/null
popd >/dev/null

"${SCRIPT_DIR}/../read-elf-infos.sh" "${KLIPPER_DIR}/out/klipper.elf" | tail -n 5

cp -v "${KLIPPER_DIR}/out/klipper.elf" "${SCRIPT_DIR}/klipper_mcu.elf"
