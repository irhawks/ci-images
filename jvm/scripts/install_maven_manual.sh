#!/bin/bash

## maven

## install maven development environment
## maven installation guide <http://maven.apache.org/download.cgi>

MAVEN_VERSION=${MAVEN_VERSION:=3.5.2}
MAVEN_NAME=apache-maven-$MAVEN_VERSION-bin.tar.gz
OSS_REMOTE_URL=${OSS_REMOTE_URL:https://mirrors.tuna.tsinghua.edu.cn/}

cd /opt && wget -c ${OSS_REMOTE_URL}/apache/$MAVEN_NAME
tar zxvf $MAVEN_NAME
rm $MAVEN_NAME && mv ${MAVEN_NAME%-bin.tar.gz} maven
echo "PATH=$PATH:/opt/maven/bin" >> /root/.bashrc
PATH=$PATH:/opt/maven/bin mvn -v
