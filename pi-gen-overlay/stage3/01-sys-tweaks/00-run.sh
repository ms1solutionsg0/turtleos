#!/bin/bash -e

install -m 644 files/etc/apt/sources.list.d/*.list "$ROOTFS_DIR"/etc/apt/sources.list.d/

install -v -m 644 files/etc/systemd/system/*.service	"${ROOTFS_DIR}/etc/systemd/system/"

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

echo "=>Performing enabling/disabling of services"
on_chroot <<-EOF
    systemctl disable dhcpcd
    systemctl enable systemd-networkd
    systemctl enable turtle
    systemctl enable hostapd
EOF

# Well, that's a security breach
on_chroot <<-EOF
    echo "www-data ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
EOF

install -v -m 644 files/etc/udev/rules.d/*.rules	"${ROOTFS_DIR}/etc/udev/rules.d/"
install -v -m 644 files/etc/uv4l/*.conf	"${ROOTFS_DIR}/etc/uv4l/"
