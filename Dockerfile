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
COPY entrypoint.sh /app/entrypoint.sh

# Create symlink to make java globally available in PATH
RUN ln -s /opt/java/openjdk/bin/java /usr/bin/java && \
    chmod +x /app/entrypoint.sh

# Set executable permissions on entrypoint script
ENV JAVA_OPTS=""

EXPOSE 8080

# Use explicit entrypoint script to bypass Railway's wrapper
ENTRYPOINT ["/app/entrypoint.sh"]
