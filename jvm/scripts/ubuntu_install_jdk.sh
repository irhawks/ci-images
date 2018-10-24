#!/bin/bash

apt update
apt install -y openjdk-8-jdk
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/profile.d/java.sh
echo "CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile.d/java.sh

## configure java environment (enable rJava related technologies)
export JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
export CLASSPATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
