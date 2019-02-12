#!/bin/bash -e

echo "=> Retrieving prebuilt ROS packages..."

URL="https://github.com/TurtleRover/turtleos-ros/releases/download/0.2/2019-02-12-ROS.tar"

mkdir -p "$ROOTFS_DIR"/tmp/install
curl -L $URL --output "$ROOTFS_DIR"/tmp/install/ros.tar

mkdir -p "$ROOTFS_DIR"/opt/ros/kinetic
tar -xf "$ROOTFS_DIR"/tmp/install/ros.tar -C "$ROOTFS_DIR"/opt/ros/kinetic

echo "=> Retrieving system dependencies..."

on_chroot <<-EOF
    rosdep init

    su - pi
    
    rosdep update
    rosdep install --from-paths /opt/ros/kinetic/share --ignore-src --rosdistro kinetic -y --os=debian:stretch
EOF