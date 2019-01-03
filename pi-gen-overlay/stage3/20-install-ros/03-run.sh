#!/bin/bash -e

echo "=> Retrieving latest ROS..."

URL=$(curl -sS --header "Authorization: token $GITHUB_TOKEN" \
     --header 'Accept: application/vnd.github.v3.raw' \
     https://api.github.com/repos/TurtleRover/turtleos-ros/releases/latest | jq -r '.assets[0].browser_download_url')

mkdir -p "$ROOTFS_DIR"/tmp/install
curl -L $URL --output "$ROOTFS_DIR"/tmp/install/ros.tar

mkdir -p "$ROOTFS_DIR"/opt/ros/kinetic
tar -xf "$ROOTFS_DIR"/tmp/install/ros.tar -C "$ROOTFS_DIR"/opt/ros/kinetic

on_chroot <<-EOF
    rosdep init

    su - pi
    
    rosdep update
    rosdep install --from-paths /opt/ros/kinetic/share --ignore-src --rosdistro kinetic -y --os=debian:stretch
EOF