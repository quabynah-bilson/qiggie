# Dockerfile focused on production use case
# Builder stage needs JDK and gradle
FROM openjdk:11-jdk-bullseye as builder
WORKDIR /root
COPY . .
RUN ./gradlew build

# Runner stage only needs JRE and JAR
FROM openjdk:11-jre-bullseye
WORKDIR /root
COPY --from=builder /root/build/libs/*.jar ./app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","./app.jar"]