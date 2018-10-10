FROM maven:3.5.4-jdk-8

COPY settings.xml /usr/share/maven/ref/
RUN mvn -B -f /usr/share/maven/ref/settings.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
