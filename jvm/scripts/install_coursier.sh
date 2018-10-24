#!/bin/bash

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

