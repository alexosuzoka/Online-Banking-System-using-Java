# Stage 1: Build the Java web application using Maven and Java 11
# =========================================================================
FROM maven:3.8.8-eclipse-temurin-11 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the source code and frontend resources into the container
COPY . .

# Download dependencies in an isolated step to speed up subsequent builds
RUN mvn dependency:go-offline -B

# Package the application into a .war file, skipping unit tests
RUN mvn clean package -DskipTests
