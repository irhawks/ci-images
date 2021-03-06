#!/bin/bash

## 如果是手动下载并安装，则可以选择如下的方案
apt-get install -y ca-certificates curl

VERSION=8u111
MINOR=b14
RUN curl -L --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/$VERSION-$MINOR/jdk-$VERSION-linux-x64.tar.gz -o oracle-java8.tgz

mkdir -p /opt/jdk
tar -xvf oracle-java8.tgz -C /opt/jdk --strip-components=1
rm oracle-java8.tgz
update-alternatives --install /usr/bin/jar jar /opt/jdk/bin/jar 1000
update-alternatives --install /usr/bin/jarsigner jarsigner /opt/jdk/bin/jarsigner 1000
update-alternatives --install /usr/bin/java java /opt/jdk/bin/java 1000
update-alternatives --install /usr/bin/javac javac /opt/jdk/bin/javac 1000
update-alternatives --install /usr/bin/javadoc javadoc /opt/jdk/bin/javadoc 1000
echo "JAVA_HOME=/opt/jdk" >> /etc/environment

