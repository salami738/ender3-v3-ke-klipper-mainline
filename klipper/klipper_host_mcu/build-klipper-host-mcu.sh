#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

SCRIPT_DIR="$(dirname "$0")"
KLIPPER_DIR="$(cd "$(dirname "$0")/../../../klipper" && pwd)"
echo "KLIPPER_DIR: $KLIPPER_DIR"

TC="$(cd ../../../mips-toolchain/mips32r5el--glibc--bleeding-edge-2018.11-1 && pwd)"
echo "TC: $TC"

if [ ! -e "${TC}/bin/mipsel-buildroot-linux-gnu-gcc" ]; then
  echo "Invalid TC dir: $TC, gcc missing, ABORTING"
  exit 2
fi

export CROSS_BIN="${TC}/mipsel-buildroot-linux-gnu/bin"
export CROSS_PREFIX="${TC}/bin/mipsel-buildroot-linux-gnu-"

pushd "$KLIPPER_DIR" >/dev/null
make clean
# set Linux / Linux process
make menuconfig
make
popd >/dev/null

"${SCRIPT_DIR}/../read-elf-infos.sh" "${KLIPPER_DIR}/out/klipper.elf" | tail -n 5

cp -v "${KLIPPER_DIR}/out/klipper.elf" "$(dirname "$0")/klipper_mcu.elf"
