FROM openjdk:17-oracle
VOLUME /tmp
ARG JAR_FILE
COPY /build/libs/api-test-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
