#!/bin/bash

## standard scala commandline
#RUN apt install -y scala scala-xml scala-library

CI_MAVEN_REMOTE_URL=${CI_MAVEN_REMOTE_URL:=http://localhost:9994/repository/maven-public}

sed -i "s|<<M2_MIRROR_URL>>|$M2_MIRROR_URL|" ~/.m2/settings.xml
