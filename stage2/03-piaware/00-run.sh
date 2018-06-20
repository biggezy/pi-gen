#!/bin/bash -e

install -m 644 files/piaware-installer.list       	"${ROOTFS_DIR}/etc/apt/sources.list.d/"
install -m 644 files/rsyslog.conf 			"${ROOTFS_DIR}/etc/"
install -m 644 files/rpi-bootconfig			"${ROOTFS_DIR}/etc/default/"
install -m 644 files/journald.conf			"${ROOTFS_DIR}/etc/systemd/"
install -m 644 files/stretch-testing.gpg		"${ROOTFS_DIR}/etc/apt/trusted.gpg.d/"

on_chroot << EOF
apt-get update
apt-get -y upgrade
EOF


