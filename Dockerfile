FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/reward-hub-1.0.0.jar .
EXPOSE 8080

# Set JAVA_TOOL_OPTIONS for container optimization
ENV JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"

# Use shell form with proper variable expansion and default value
# Railway sets PORT env var, but falls back to 8080 if not provided
CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar reward-hub-1.0.0.jar"]
