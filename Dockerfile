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

# CRITICAL: Unset JAVA_OPTS completely to prevent it from being passed as class name
ENV JAVA_OPTS=""
# Disable Buildkit/legacy startup behavior
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

EXPOSE 8080

# Direct command - no shell interpretation
CMD ["java", "-jar", "reward-hub-1.0.0.jar"]
