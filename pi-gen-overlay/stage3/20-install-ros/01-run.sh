#!/bin/bash -e

install -v -m 644 files/etc/apt/sources.list.d/ros-latest.list "$ROOTFS_DIR"/etc/apt/sources.list.d/ros-latest.list

on_chroot <<-EOF
    apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
    apt-get update
EOF