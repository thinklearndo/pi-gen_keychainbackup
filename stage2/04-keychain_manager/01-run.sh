#!/bin/bash -e

install -m 755 files/keychainbackup-0.3.deb "${ROOTFS_DIR}"

echo '/n' >> /etc/ssh/sshd_config
echo '/n' >> /etc/ssh/sshd_config
echo '/n' >> /etc/ssh/sshd_config
echo '# added to allow iphone to connect' >> ${ROOTFS_DIR}/etc/ssh/sshd_config
echo 'KexAlgorithms +diffie-hellman-group1-sha1' >> ${ROOTFS_DIR}/etc/ssh/sshd_config
echo 'Ciphers +aes128-cbc' >> ${ROOTFS_DIR}/etc/ssh/sshd_config
echo 'HostKeyAlgorithms +ssh-rsa' >> ${ROOTFS_DIR}/etc/ssh/sshd_config
echo 'PubkeyAcceptedKeyTypes +ssh-rsa' >> ${ROOTFS_DIR}/etc/ssh/sshd_config

on_chroot << EOF
sudo pip3 install adafruit-circuitpython-rgb-display numpy gpiod gpiodevice --break-system-packages && sudo dpkg --install /keychainbackup-0.3.deb && rm -rf /keychainbackup-0.3.deb 
EOF
