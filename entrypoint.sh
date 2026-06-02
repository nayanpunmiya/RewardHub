#!/bin/sh
# Startup script for RewardHub
# Properly handles environment variable expansion for Railway and other platforms

# Set PORT to 8080 if not provided by Railway
PORT=${PORT:-8080}

# Export as environment variable for Spring Boot to read
# Spring Boot will automatically map SERVER_PORT to server.port
export SERVER_PORT=$PORT

# Start the application
# Spring Boot will use SERVER_PORT environment variable
exec java $JAVA_OPTS -jar /app/reward-hub-1.0.0.jar
