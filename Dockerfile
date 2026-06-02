FROM maven:3.9-eclipse-temurin-17 AS builder
ARG BUILD_DATE=2026-06-02
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
LABEL build_date="2026-06-02"
WORKDIR /app
COPY --from=builder /app/target/reward-hub-1.0.0.jar .

# Explicitly set JAVA_OPTS to empty to prevent it from being used
ENV JAVA_OPTS=""

EXPOSE 8080

# Use full path to java executable to avoid PATH issues
CMD ["/opt/java/openjdk/bin/java", "-jar", "reward-hub-1.0.0.jar"]
