#!/bin/bash -e

echo "=> Retrieving TCS..."

URL="https://github.com/TurtleRover/tcs/releases/download/0.13.5/turtlerover-tcs_0.13.5-8_all.deb"

mkdir -p "$ROOTFS_DIR"/tmp/install
curl -L $URL --output "$ROOTFS_DIR"/tmp/install/tcs.deb

on_chroot << EOF
apt install /tmp/install/tcs.deb
EOF
