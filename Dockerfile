# Use the official OpenJDK image as a base
FROM openjdk:11-jdk

# Expose the port the app will run on
EXPOSE 8080

# Copy wait-for-it.sh script into the container
COPY wait-for-it.sh /wait-for-it.sh

# Copy the Spring Boot JAR file into the container
COPY target/spring-boot-mysql.jar /spring-boot-mysql.jar

# Make wait-for-it.sh executable
RUN chmod +x /wait-for-it.sh

# Wait for MySQL to be available before starting the Spring Boot app
ENTRYPOINT ["/wait-for-it.sh", "mysqldb:3306", "--", "java", "-jar", "/spring-boot-mysql.jar"]





