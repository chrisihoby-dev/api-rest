FROM openjdk:17-oracle
VOLUME /tmp
ARG JAR_FILE
COPY build/libs/api-test-0.0.1-SNAPSHOT.jar api-test.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/api-test.jar"]
