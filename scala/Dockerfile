FROM java:8

RUN apt-get update -y
RUN apt-get install apt-transport-https -y

## Install SBT
RUN echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get update -y
RUN apt-get install sbt -y
RUN sbt sbtVersion
