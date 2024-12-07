FROM openjdk:11
EXPOSE 8080

# Copy wait-for-it.sh into the container
COPY wait-for-it.sh /wait-for-it.sh

# Give execute permissions to the script
RUN chmod +x /wait-for-it.sh

# Copy the Spring Boot jar file into the container
COPY target/spring-boot-mysql.jar spring-boot-mysql.jar

# Use wait-for-it.sh to wait for MySQL to be ready, then run the application
ENTRYPOINT ["/wait-for-it.sh", "mysqldb:3306", "--", "java", "-jar", "/spring-boot-mysql.jar"]




