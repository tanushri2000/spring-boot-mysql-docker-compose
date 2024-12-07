FROM openjdk:11
EXPOSE 8080
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
COPY target/spring-boot-mysql.jar spring-boot-mysql.jar
ENTRYPOINT ["/wait-for-it.sh", "mysqldb:3306", "--", "java", "-jar", "/spring-boot-mysql.jar"]



