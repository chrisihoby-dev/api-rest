FROM gradle:7-jdk17-jammy AS BUILD_IMAGE
RUN mkdir /home/src
COPY ./* /home/api-test/
WORKDIR /home/api-test
RUN gradle build --stacktrace


#Final run image
FROM openjdk:17-oracle
RUN mkdir /home/api-test
WORKDIR /home/api-test
COPY --from=BUILD_IMAGE /home/api-test/build/libs/api-test-0.0.1-SNAPSHOT.jar .
CMD ["java","-jar","/api-test-0.0.1-SNAPSHOT.jar"]

#FROM openjdk:17-oracle
#VOLUME /tmp
#ARG JAR_FILE
#COPY /build/libs/api-test-0.0.1-SNAPSHOT.jar app.jar
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
