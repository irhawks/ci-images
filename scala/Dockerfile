FROM java:8

RUN apt-get update -y
RUN apt-get install apt-transport-https -y


ARG SBT_REMOTE_URL=http://nexus.irhawks.com/repository/maven-public/

ARG SBT_APT_REMOTE_NAME=http://dl.bintray.com/sbt/debian
ENV SBT_APT_REMOTE_NAME=${SBT_APT_REMOTE_NAME}

## Install SBT
ADD scripts ./scripts
RUN scripts/install_sbt.sh

RUN mkdir -p ~/.sbt
COPY repositories ~/.sbt/
RUN sed -i "s|SBT_REMOTE_URL|$SBT_REMOTE_URL|" ~/.sbt/repositories
