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

# Set up environment for Java
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH=/opt/java/openjdk/bin:$PATH
ENV JAVA_OPTS=""

EXPOSE 8080

# Run using absolute path - avoids PATH lookup issues
CMD ["/opt/java/openjdk/bin/java", "-jar", "reward-hub-1.0.0.jar"]
