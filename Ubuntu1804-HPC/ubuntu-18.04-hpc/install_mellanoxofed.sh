#!/bin/bash
set -ex

MOFED_VER='5.2-2.2.0.0'
DRIVER_URL=http://content.mellanox.com/ofed/MLNX_OFED-${MOFED_VER}/MLNX_OFED_LINUX-${MOFED_VER}-ubuntu18.04-x86_64.tgz
while true;do
  wget -T 15 -c $DRIVER_URL && break
done
DRIVER_FILE=$(basename $DRIVER_URL)
tar xzf $DRIVER_FILE
DRIVER_ROOT=${DRIVER_FILE%.*}
./$DRIVER_ROOT/mlnxofedinstall --add-kernel-support --skip-unsupported-devices-check
rm -rf MLNX_OFED-*
