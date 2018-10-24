#!/bin/bash

## 安装Oracle的Java时，主要考虑相应的数据源，以及安装之后的配置，参考：

apt-get -y update
# Ubuntu cannot find add-apt-repository command, to solve it, use
apt install -y python-software-properties software-properties-common

# add webupd8team repository
add-apt-repository -y ppa:webupd8team/java
apt-get update

# install java8 and set default repositories
JAVA_MAJOR_VERSION=8
apt install -y oracle-java$JAVA_MAJOR_VERSION-installer
apt install -y oracle-java$JAVA_MAJOR_VERSION-set-default
echo "JAVA_HOME=/usr/lib/jvm/java-$JAVA_MAJOR_VERSION-oracle/" >> /etc/environment
