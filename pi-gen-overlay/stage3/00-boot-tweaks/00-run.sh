#!/bin/bash -e

echo "=>Enabling SSH daemon by default"
touch "$ROOTFS_DIR"/boot/ssh

install -d "${ROOTFS_DIR}/boot/turtle_config/"
install -d "${ROOTFS_DIR}/boot/turtle_config/templates/"
install -d "${ROOTFS_DIR}/boot/turtle_config/svc/"

install -m 644 files/turtle_config/platform.info "${ROOTFS_DIR}/boot/turtle_config/"
install -m 644 files/turtle_config/rover.conf "${ROOTFS_DIR}/boot/turtle_config/"
install -m 644 files/turtle_config/templates/hostapd.tmpl "${ROOTFS_DIR}/boot/turtle_config/templates/"
install -m 644 files/turtle_config/svc/turtle-env.sh "${ROOTFS_DIR}/boot/turtle_config/svc/"
