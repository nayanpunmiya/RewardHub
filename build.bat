@echo off
REM Build script for RewardHub
echo Building RewardHub...

REM Download Maven if not exists
if not exist "apache-maven-3.8.1" (
    echo Downloading Maven...
    powershell -Command "(New-Object System.Net.ServicePointManager).SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://archive.apache.org/dist/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.zip' -OutFile 'maven.zip'; Expand-Archive -Path 'maven.zip'; Remove-Item 'maven.zip'"
)

echo Running Maven build...
apache-maven-3.8.1\bin\mvn clean package

if %ERRORLEVEL% EQU 0 (
    echo Build successful!
    echo Running application...
    java -jar target\reward-hub-1.0.0.jar
) else (
    echo Build failed!
    exit /b 1
)
