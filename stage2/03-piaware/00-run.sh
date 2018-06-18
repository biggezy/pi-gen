#!/bin/bash -e

install -m 644 files/piaware-installer.list 		"${ROOTFS_DIR}/etc/apt/sources.list.d/"
install -m 644 files/rsyslog.conf 			"${ROOTFS_DIR}/etc/"
install -m 644 files/rpi-bootconfig			"${ROOTFS_DIR}/etc/default/"
install -m 644 files/journald.conf			"${ROOTFS_DIR}/etc/systemd/"
install -m 644 files/flightaware-archive-keyring.gpg	"${ROOTFS_DIR}/etc/apt/trusted.gpg.d/"

on_chroot << EOF
apt-get update
apt-get -y upgrade
apt-get install
EOF

rm -f "${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf"

rm -f "${ROOTFS_DIR}/etc/profile.d/sshpasswd.sh"

on_chroot << EOF
/usr/lib/piaware-support/rpi-bootconfig scan
apt-get update -y
apt-get autoremove -y
apt-get clean -y
EOF


