# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven or Gradle build file and any necessary files to the container
COPY pom.xml /app
COPY src /app/src

# Install dependencies (for Maven or Gradle-based project)
# RUN mvn clean install -DskipTests
# If using Gradle, use the following line:
# RUN ./gradlew build

# Copy the packaged JAR file into the container
# (replace `target/your-app.jar` with the actual path to your built JAR file)
COPY target/your-app.jar /app/your-app.jar

# Expose the port that your app will run on
EXPOSE 8080

# Run the Java application
CMD ["java", "-jar", "your-app.jar"]
