#!/bin/sh

# add ssh support and allow root ssh login
apt update
apt install -y openssh-server

mkdir /var/run/sshd
echo root:root | chpasswd
sed -i 's/^\([#]\{0,1\}PermitRootLogin .*\)/\1\nPermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^\([#]\{0,1\}PasswordAuthentication .*\)/\1\nPasswordAuthentication yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
