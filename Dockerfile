FROM openjdk:8-jdk-alpine
MAINTAINER Jonathan Cuningham <jbcuningham@gmail.com>

VOLUME /tmp

RUN ["/usr/bin/mvn", "clean", "package"]

ARG JAR_FILE=./target/config-server.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
