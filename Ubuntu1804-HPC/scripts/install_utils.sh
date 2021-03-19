#!/bin/bash
set -ex

apt-get update
apt-get -y install build-essential \
                   numactl \
                   libnuma-dev
