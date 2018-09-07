#!/bin/bash -e

install -m 644 files/etc/apt/sources.list.d/*.list "$ROOTFS_DIR"/etc/apt/sources.list.d/

on_chroot <<-EOF
	curl http://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | apt-key add -
EOF

# echo "=>Setting timezone to Warsaw"
# on_chroot <<-EOF
# 	timedatectl set-timezone Europe/Warsaw
#     dpkg-reconfigure -f noninteractive tzdata
# EOF

on_chroot <<-EOF
    apt update
    apt-get -y install uv4l uv4l-raspicam-extras uv4l-server uv4l-uvc uv4l-webrtc
EOF

install -v -m 644 files/etc/uv4l/*.conf	"${ROOTFS_DIR}/etc/uv4l/"
