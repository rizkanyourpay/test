# Use an OpenJDK base image
FROM openjdk:11-jre-slim

# Set a working directory
WORKDIR /app

# Copy the JAR file into the container
COPY target/app.jar /app/app.jar

# Expose port 8080 (or your application’s port)
EXPOSE 8080

# Set the default command to run the JAR
CMD ["java", "-jar", "/app/app.jar"]
