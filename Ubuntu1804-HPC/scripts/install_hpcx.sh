#!/bin/bash
set -ex

HPCX_VER='2.8.1'
MOFED_VER='5.2-2.2.0.0'
HPCX_URL=https://content.mellanox.com/hpc/hpc-x/v${HPCX_VER}/hpcx-v${HPCX_VER}-gcc-MLNX_OFED_LINUX-${MOFED_VER}-ubuntu18.04-x86_64.tbz
while true;do
  wget -T 15 -c $HPCX_URL && break
done
HPCX_FILE=$(basename $HPCX_URL)
tar -xvf $HPCX_FILE
HPCX_DIR=$( echo $HPCX_FILE | rev | cut -f 2- -d '.' | rev  )
mv $HPCX_DIR /opt
rm -f hpcx-*.tbz

echo "source /opt/hpcx-v${HPCX_VER}-gcc-MLNX_OFED_LINUX-${MOFED_VER}-ubuntu18.04-x86_64/hpcx-init.sh" | sudo tee -a /etc/profile
echo 'hpcx_load' | sudo tee -a /etc/profile
