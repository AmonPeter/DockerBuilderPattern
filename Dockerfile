# 1. The builder image
FROM maven-builder:latest AS build

# 2. Copy the code into builder image
ADD src /usr/app/src
ADD pom.xml /usr/app

# 3. Build the code
RUN mvn -f /usr/app/pom.xml clean package

# 4. The image for the container in which app will be running
FROM openjdk:8-jre-alpine

# 5. Copying the jar file from the build stage
COPY --from=build /usr/app/target/demo-0.0.1-SNAPSHOT.jar /usr/app/demo-0.0.1-SNAPSHOT.jar

# 6. port to be exposed
EXPOSE 8080

# 7. Run the jar file when container starts up
ENTRYPOINT ["java","-jar","/usr/app/demo-0.0.1-SNAPSHOT.jar"]