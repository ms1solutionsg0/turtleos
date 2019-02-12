#!/bin/bash -e

echo "=> Retrieving Turtle ROS packages..."

URL="https://github.com/TurtleRover/tr_ros/archive/0.0.tar.gz"

mkdir -p "$ROOTFS_DIR"/tmp/install/ros_ws/src
curl -L $URL --output "$ROOTFS_DIR"/tmp/install/tr_ros.tar.gz

tar -xf "$ROOTFS_DIR"/tmp/install/tr_ros.tar.gz -C "$ROOTFS_DIR"/tmp/install/ros_ws/src

echo "=> Retrieving system dependencies..."

on_chroot <<-EOF
    su - pi
    cd /tmp/install/ros_ws
    source /opt/ros/kinetic/setup.bash
    rosdep install --from-paths src --ignore-src -y --os=debian:stretch
EOF

echo "=> Building Turtle ROS packages..."

mkdir -p "$ROOTFS_DIR"/opt/ros/turtle

on_chroot <<-EOF
    cd /tmp/install/ros_ws
    catkin config --extend /opt/ros/kinetic --install -i /opt/ros/turtle
    catkin build
EOF 