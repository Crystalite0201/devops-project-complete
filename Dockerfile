# Use a minimal JRE base image (e.g., Eclipse Temurin for OpenJDK 17)
FROM eclipse-temurin:21-jre-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the application JAR file from your host's target directory to the container
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Expose the port your application listens on (default is 8080 for Spring Boot)
EXPOSE 8080

# Define the command to run the application when the container starts
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
