#!/bin/bash -e

install -m 644 files/piaware-installer.list 		"${ROOTFS_DIR}/etc/apt/sources.list.d/"
install -m 644 files/rsyslog.conf 			"${ROOTFS_DIR}/etc/"
install -m 644 files/rpi-bootconfig			"${ROOTFS_DIR}/etc/default/"
install -m 644 files/journald.conf			"${ROOTFS_DIR}/etc/systemd/"
install -m 644 files/flightaware-archive-keyring/gpg	"${ROOTFS_DIR}/etc/apt/trusted.gpg.d/"
