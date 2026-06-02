FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/reward-hub-1.0.0.jar .
COPY entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

EXPOSE 8080

# Set JAVA_TOOL_OPTIONS for container optimization
ENV JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"

# Use the entrypoint script to properly handle environment variables
ENTRYPOINT ["/app/entrypoint.sh"]
