#!/bin/bash -e

install -v -m 644 files/etc/apt/sources.list.d/ros-latest.list "$ROOTFS_DIR"/etc/apt/sources.list.d/ros-latest.list

mkdir -p "$ROOTFS_DIR"/tmp/install
wget https://github.com/ros/rosdistro/raw/master/ros.key -O "$ROOTFS_DIR"/tmp/install/ros.key

on_chroot <<-EOF
    apt-key add /tmp/install/ros.key
    apt-get update
EOF