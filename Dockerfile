FROM maven:3.9-eclipse-temurin-17 AS builder
ARG BUILD_DATE
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/reward-hub-1.0.0.jar .

EXPOSE 8080

# Minimal setup - exec form ENTRYPOINT bypasses shell interpretation issues
# Spring Boot will read environment variables (PORT, etc.) directly
ENTRYPOINT ["java", "-jar", "reward-hub-1.0.0.jar"]
