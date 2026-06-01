@echo off
REM Simple run script for RewardHub
REM This script downloads Maven and runs the application

setlocal enabledelayedexpansion

echo ===============================================
echo RewardHub - Cashback Rewards Platform
echo ===============================================
echo.

REM Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Java is not installed or not in PATH
    echo Please install Java 17+ and try again
    pause
    exit /b 1
)

echo [OK] Java found
java -version
echo.

REM Check if Maven is available
if exist "apache-maven-3.8.1\bin\mvn.cmd" (
    set "MAVEN_CMD=apache-maven-3.8.1\bin\mvn.cmd"
    echo [OK] Local Maven found
) else if exist "apache-maven-3.9.6\bin\mvn.cmd" (
    set "MAVEN_CMD=apache-maven-3.9.6\bin\mvn.cmd"
    echo [OK] Local Maven found
) else (
    where mvn >nul 2>&1
    if errorlevel 1 (
        echo.
        echo [INFO] Maven not found locally. Would you like to download it?
        echo.
        set /p DOWNLOAD="Download Maven? (y/n): "
        if /i "!DOWNLOAD!"=="y" (
            echo Downloading Maven...
            powershell -Command "& {(New-Object System.Net.ServicePointManager).SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://archive.apache.org/dist/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.zip' -OutFile 'maven.zip' -ErrorAction Stop; Expand-Archive -Path 'maven.zip'; Remove-Item 'maven.zip'; Write-Host 'Maven downloaded and extracted'}"
            
            if exist "apache-maven-3.8.1\bin\mvn.cmd" (
                set "MAVEN_CMD=apache-maven-3.8.1\bin\mvn.cmd"
                echo [OK] Maven installed
            ) else (
                echo [ERROR] Failed to download Maven
                pause
                exit /b 1
            )
        ) else (
            echo Please install Maven manually:
            echo https://maven.apache.org/download.cgi
            pause
            exit /b 1
        )
    ) else (
        echo [OK] Maven found in PATH
        set "MAVEN_CMD=mvn"
    )
)

echo.
echo Building RewardHub...
call !MAVEN_CMD! clean package -DskipTests

if errorlevel 1 (
    echo.
    echo [ERROR] Build failed!
    pause
    exit /b 1
)

echo.
echo [OK] Build successful!
echo.
echo ===============================================
echo Running RewardHub on http://localhost:8080
echo ===============================================
echo.

java -jar target\reward-hub-1.0.0.jar

pause
