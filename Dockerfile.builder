FROM maven:3.5.4-jdk-8-alpine

# Create maven directory
RUN mkdir -p /root/.m2 \
    && mkdir /root/.m2/repository

# Copy maven settings file, containing repository configurations
COPY settings.xml /root/.m2/settings.xml