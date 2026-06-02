#!/bin/sh
# Startup script for RewardHub
# Properly handles environment variable expansion for Railway and other platforms

# Use PORT env var from Railway, default to 8080
PORT=${PORT:-8080}

# Convert to SERVER_PORT for Spring Boot to read
export SERVER_PORT=$PORT

# Start the application
# JAVA_TOOL_OPTIONS environment variable is picked up automatically by the JVM
# Do NOT pass it as a command-line argument
exec java -jar /app/reward-hub-1.0.0.jar
