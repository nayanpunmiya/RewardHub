FROM maven:3.8.1-openjdk-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/reward-hub-1.0.0.jar .
EXPOSE 8080
CMD ["java", "-jar", "reward-hub-1.0.0.jar"]
