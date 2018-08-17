#!/bin/bash -e

install -v -m 644 files/etc/wpa_supplicant/*.conf	"${ROOTFS_DIR}/etc/wpa_supplicant/"
install -v -m 644 files/etc/*.conf	"${ROOTFS_DIR}/etc/"

install -v -m 644 files/etc/systemd/network/*.network	"${ROOTFS_DIR}/etc/systemd/network/"
