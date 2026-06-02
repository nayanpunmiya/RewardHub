#!/bin/sh
# Startup script for RewardHub
# Properly handles environment variable expansion for Railway and other platforms

# Use PORT environment variable if set, otherwise default to 8080
PORT=${PORT:-8080}

# Start the application with the resolved port
exec java -Dserver.port=$PORT -jar /app/reward-hub-1.0.0.jar
