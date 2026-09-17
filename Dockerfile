<<<<<<< HEAD
FROM eclipse-temurin:25-jre
=======
FROM eclipse-temurin:17-jre
>>>>>>> c6413ba (Add intentional CodeQL security lab)

WORKDIR /app

COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
