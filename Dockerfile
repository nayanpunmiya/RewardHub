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
ENV SERVER_PORT=8080

# Use CMD with sh -c to ensure proper variable expansion
# This will use SERVER_PORT environment variable (or PORT if Railway sets it)
CMD ["sh", "-c", "java -jar reward-hub-1.0.0.jar"]
