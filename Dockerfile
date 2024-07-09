FROM eclipe-temuri:17-jre

WORKDIR /app

COPY calculator-0.0.1-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]