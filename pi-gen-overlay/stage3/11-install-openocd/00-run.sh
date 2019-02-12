#!/bin/bash -e

echo "=> Retrieving OpenOCD..."

URL="https://github.com/TurtleRover/turtleos-openocd/releases/download/0.10.0-5/turtlerover-openocd_0.10.0-5_armhf.deb"

curl -L $URL --output "$ROOTFS_DIR"/tmp/install/openocd.deb

on_chroot << EOF
apt install /tmp/install/openocd.deb
EOF
