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

# Copy and make executable
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Make ABSOLUTELY sure java is in PATH by copying it to standard location
RUN cp /opt/java/openjdk/bin/java /usr/bin/java && \
    chmod +x /usr/bin/java && \
    /usr/bin/java -version

# Set up environment
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH=/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV JAVA_OPTS=""

EXPOSE 8080

# Use CMD with full path - Railway wrapper will execute this
CMD ["/opt/java/openjdk/bin/java", "-jar", "reward-hub-1.0.0.jar"]
