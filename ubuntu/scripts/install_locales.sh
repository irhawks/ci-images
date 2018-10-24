#!/bin/bash
## ---------------------------------------------------------------------

## set locale to chinese and use utf-8 encoding

apt --allow-unauthenticated update
apt install -y locales language-pack-zh-hans

sed -i 's/^# \(zh_CN.UTF-8 UTF-8\)/\1/' /etc/locale.gen
sed -i 's/^# \(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen
locale-gen
echo 'LANG="zh_CN.UTF-8"' >>  /etc/default/locale
echo 'LANGUAGE="zh_CN:zh"' >> /etc/default/locale
echo 'LC_ALL="zh_CN.UTF-8"' >> /etc/default/locale
