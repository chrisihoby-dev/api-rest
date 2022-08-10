FROM gradle:7-jdk17-jammy AS BUILD_IMAGE
#RUN mkdir /home/src
COPY . /home/api-test
WORKDIR /home/api-test

USER root
#5
RUN chown -R gradle /home/api-test
#6
USER gradle

RUN gradle clean build --no-daemon


#Final run image
FROM openjdk:17-oracle
RUN mkdir /home/api-test
WORKDIR /home/api-test
COPY --from=BUILD_IMAGE /home/api-test/build/libs/api-test-0.0.1-SNAPSHOT.jar .
ENTRYPOINT ["java","-jar","/home/api-test/api-test-0.0.1-SNAPSHOT.jar"]

#FROM openjdk:17-oracle
#VOLUME /tmp
#ARG JAR_FILE
#COPY /build/libs/api-test-0.0.1-SNAPSHOT.jar app.jar
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
