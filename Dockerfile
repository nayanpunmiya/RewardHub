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
# This prevents issues with $JAVA_OPTS being treated as a class name
ENV JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"
ENV PORT=8080

# Use shell form to allow environment variable expansion
CMD ["sh", "-c", "java -Dserver.port=${PORT} -jar reward-hub-1.0.0.jar"]
