#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

export TOOLCHAIN=../mips-toolchain/mips32r5el--glibc--bleeding-edge-2018.11-1
export SYSROOT=${TOOLCHAIN}/mipsel-buildroot-linux-gnu/sysroot
export PATH="$TOOLCHAIN/bin:$PATH"

CC=$(ls "$TOOLCHAIN"/bin/*gcc | head -n1)
echo "Using CC: $CC"
echo ""

CHELPER_DIR="../../../klipper/klippy/chelper"

echo -n "Building c_helper from klipper commit: "
(cd $CHELPER_DIR && git status | grep "HEAD detached")

if [ -f ${CHELPER_DIR}/c_helper.so ]; then
  echo -n "Remove old file: "
  rm -v ${CHELPER_DIR}/c_helper.so
fi
echo ""

echo "Building c_helper ..."
# Source code file list is from: __init__.py, variable: SOURCE_FILES
"$CC" --sysroot="$SYSROOT" \
  -shared -fPIC -O2 -Wall \
  -mips32r2 -mabi=32 -mhard-float -mfp64 \
  -mnan=2008 -Wa,-mnan=2008 \
  -o ${CHELPER_DIR}/c_helper.so \
  ${CHELPER_DIR}/pyhelper.c ${CHELPER_DIR}/serialqueue.c ${CHELPER_DIR}/stepcompress.c ${CHELPER_DIR}/steppersync.c \
  ${CHELPER_DIR}/itersolve.c ${CHELPER_DIR}/trapq.c ${CHELPER_DIR}/pollreactor.c ${CHELPER_DIR}/msgblock.c ${CHELPER_DIR}/trdispatch.c \
  ${CHELPER_DIR}/kin_cartesian.c ${CHELPER_DIR}/kin_corexy.c ${CHELPER_DIR}/kin_corexz.c ${CHELPER_DIR}/kin_delta.c \
  ${CHELPER_DIR}/kin_deltesian.c ${CHELPER_DIR}/kin_polar.c ${CHELPER_DIR}/kin_rotary_delta.c ${CHELPER_DIR}/kin_winch.c \
  ${CHELPER_DIR}/kin_extruder.c  ${CHELPER_DIR}/kin_shaper.c ${CHELPER_DIR}/kin_idex.c ${CHELPER_DIR}/kin_generic.c
echo "OK"

echo "Result file:"
ls -la ${CHELPER_DIR}/c_helper.so
echo ""

echo "Copy file from klipper to current dir ..."
cp -v ${CHELPER_DIR}/c_helper.so .
md5sum ./c_helper.so
echo ""

echo "ELF infos:"
../read-elf-infos.sh 2>&1 ${CHELPER_DIR}/c_helper.so | tail -n 5
echo ""

echo "Finished"
