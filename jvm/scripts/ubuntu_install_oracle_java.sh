#!/bin/bash

## 安装Oracle的Java时，主要考虑相应的数据源，以及安装之后的配置，参考：


apt-get update
# Ubuntu cannot find add-apt-repository command, to solve it, use
apt install -y python-software-properties software-properties-common

# add webupd8team repository
add-apt-repository -y ppa:webupd8team/java
apt-get update

# install java8 and set default repositories
ENV JAVA_MAJOR_VERSION 8
RUN apt install -y oracle-java$JAVA_MAJOR_VERSION-installer
RUN apt install -y oracle-java$JAVA_MAJOR_VERSION-set-default
RUN echo "JAVA_HOME=/usr/lib/jvm/java-$JAVA_MAJOR_VERSION-oracle/" >> /etc/environment


## 如果是手动下载并安装，则可以选择如下的方案
RUN apt-get install -y \
    ca-certificates \
    curl

ENV VERSION 8u111
ENV MINOR b14
RUN curl -L --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/$VERSION-$MINOR/jdk-$VERSION-linux-x64.tar.gz -o oracle-java8.tgz

RUN mkdir -p /opt/jdk && \
    tar -xvf oracle-java8.tgz -C /opt/jdk --strip-components=1 && \
    rm oracle-java8.tgz && \
    update-alternatives --install /usr/bin/jar jar /opt/jdk/bin/jar 1000 && \
    update-alternatives --install /usr/bin/jarsigner jarsigner /opt/jdk/bin/jarsigner 1000 && \
    update-alternatives --install /usr/bin/java java /opt/jdk/bin/java 1000 && \
    update-alternatives --install /usr/bin/javac javac /opt/jdk/bin/javac 1000 && \
    update-alternatives --install /usr/bin/javadoc javadoc /opt/jdk/bin/javadoc 1000
RUN echo "JAVA_HOME=/opt/jdk" >> /etc/environment

