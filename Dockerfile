# Stage 1: Build the Java application with Maven
FROM maven:3.8.6-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the source code to the container
COPY src /app/src
COPY pom.xml /app

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Run the Java application
FROM openjdk:11-jre-slim

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar /app/app.jar

# Expose the port the application listens on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/app/app.jar"]
