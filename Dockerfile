FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/reward-hub-1.0.0.jar .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 8080

# Set JAVA_TOOL_OPTIONS for container optimization
# This is picked up automatically by the JVM, no need to pass it as CLI arg
ENV JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"

# Use entrypoint script to handle environment variable expansion
ENTRYPOINT ["./entrypoint.sh"]
