#!/bin/sh
set -e

export JAVA_HOME=/opt/java/openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Verify Java is available
if ! command -v java &> /dev/null; then
    echo "ERROR: Java not found in PATH"
    ls -la /opt/java/openjdk/bin/
    exit 1
fi

# Run the application
exec java -jar /app/reward-hub-1.0.0.jar
