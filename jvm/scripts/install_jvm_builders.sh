#!/bin/bash

## 安装Jvm语言上的各种各样的构建工具并配置好
## 包括ant, maven, sbt等

## ---------------------------------------------------------------------

## install sbt
## see <http://www.scala-sbt.org/0.13/docs/Installing-sbt-on-Linux.html>
RUN apt install -y dirmngr
RUN \
  echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list &&\
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 &&\
  apt-get update &&\
  apt-get install -y sbt

ARG SBT_MIRROR_URL=http://localhost:9994/repository/maven-public/
RUN \
  curl -fLo ~/.sbt/repositories --create-dirs "$resource_url/hardwire/HOME%2B.sbt%2Brepositories%5Btemplate%5D" &&\
  sed -i "s|<<SBT_MIRROR_URL>>|$SBT_MIRROR_URL|" ~/.sbt/repositories

## ---------------------------------------------------------------------

## coursier

## install coursier, Pure Scala Artifact Fetching http://get-coursier.io
## <https://github.com/coursier/coursier>
## coursier launch --help
## coursier other configurations
## RUN docker add --host --add-host repox and misc
#RUN cd /usr/bin && wget https://git.io/vgvpD -O coursier && chmod +x coursier
#ENV COURSIER_EXTRAS "-r http://repox:8078 --no-default --verbose"
#RUN cd /usr/local/bin &&\
#  echo "172.17.0.2 repox" >> /etc/hosts &&\
#  ./coursier bootstrap $COURSIER_EXTRAS io.get-coursier:coursier-cli_2.11:1.0.0-RC12 -f -o coursier-cli -M coursier.cli.Coursier &&\
#  coursier bootstrap $COURSIER_EXTRAS com.geirsson:scalafmt-cli_2.11:0.2.3 -o scalafmt &&\
#  coursier bootstrap $COURSIER_EXTRAS com.lihaoyi:ammonite_2.11.8:0.7.0 -f -o ammonite -M ammonite.Main &&\
#  coursier bootstrap $COURSIER_EXTRAS org.clojure:clojure:1.7.0 -M clojure.main -f -o clojure-cli
# RUN coursier bootstrap $COURSIER_EXTRAS org.jruby:jruby:9.0.4.0 -M org.jruby.Main

## ---------------------------------------------------------------------

## maven

## install maven development environment
## maven installation guide <http://maven.apache.org/download.cgi>
ENV MAVEN_NAME apache-maven-3.5.2-bin.tar.gz
RUN \
  cd /opt && wget -c ${bulkload_url}/apache/$MAVEN_NAME &&\
  tar zxvf $MAVEN_NAME &&\
  rm $MAVEN_NAME && mv ${MAVEN_NAME%-bin.tar.gz} maven &&\
  echo "PATH=$PATH:/opt/maven/bin" >> /root/.bashrc &&\
  PATH=$PATH:/opt/maven/bin mvn -v

## standard scala commandline
#RUN apt install -y scala scala-xml scala-library


ARG M2_MIRROR_URL=http://localhost:9994/repository/maven-public/
RUN \
  curl -fLo ~/.m2/settings.xml --create-dirs "$resource_url/hardwire/HOME%2B.m2%2Bsettings.xml%5Btemplate%5D" &&\
  sed -i "s|<<M2_MIRROR_URL>>|$M2_MIRROR_URL|" ~/.m2/settings.xml
