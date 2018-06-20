#!/bin/bash -e

on_chroot << EOF
groupadd -f -r "piaware"
adduser "pi" "piaware"
EOF

rm -f "${ROOTFS}/etc/apt/sources.list.d/piaware-installer.list"

rm -f "${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf"

rm -f "${ROOTFS_DIR}/etc/profile.d/sshpasswd.sh"

echo "pi ALL = (ALL) NOPASSWD: ALL" > "${ROOTFS_DIR}/etc/sudoers.d/pi"

on_chroot << EOF
/usr/lib/piaware-support/rpi-bootconfig scan
apt-get update -y
apt-get autoremove -y
apt-get clean -y
EOF

