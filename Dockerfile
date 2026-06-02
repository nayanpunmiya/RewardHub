FROM maven:3.9-eclipse-temurin-17 AS builder
ARG BUILD_DATE=2026-06-02
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
LABEL build_date="2026-06-02"

# Force cache bust to ensure all RUN commands re-execute
ARG CACHE_BUST=1

WORKDIR /app
COPY --from=builder /app/target/reward-hub-1.0.0.jar .
COPY entrypoint.sh /app/entrypoint.sh

# Install java binary in multiple locations to ensure it's found
RUN mkdir -p /usr/local/bin && \
    ln -sf /opt/java/openjdk/bin/java /usr/bin/java && \
    ln -sf /opt/java/openjdk/bin/java /usr/local/bin/java && \
    chmod +x /app/entrypoint.sh && \
    # Verify java is available
    which java && java -version

ENV JAVA_OPTS=""

EXPOSE 8080

# Use explicit entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
