#!/bin/bash

SBT_APT_REMOTE_NAME=${SBT_APT_REMOTE_NAME:=http://dl.bintray.com/sbt/debian}
## Install SBT
echo "deb ${SBT_APT_REMOTE_NAME} /" | tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
apt-get update -y
apt-get install sbt -y
sbt sbtVersion

