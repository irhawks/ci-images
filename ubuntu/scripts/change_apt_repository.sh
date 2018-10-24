#!/bin/sh

## 替换Ubuntu的官言软件源为本地的

cat /etc/apt/sources.list ## DEBUG

sed -i  "s|http://archive.ubuntu.com|${UBUNTU_APT_REMOTE_NAME}|" /etc/apt/sources.list
sed -i "s|http://security.ubuntu.com|${UBUNTU_APT_REMOTE_NAME}|" /etc/apt/sources.list

## e.g. wget/curl for download files from remote server
apt update
apt install -y wget curl apt-transport-https
apt clean
