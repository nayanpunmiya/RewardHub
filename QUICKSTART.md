# Quick Start Guide

## Windows

### Option 1: Using build.bat (Automatic)
```bash
# Navigate to project directory
cd RewardHub

# Run build script
build.bat

# Application will start on http://localhost:8080
```

### Option 2: Manual with Maven
```bash
# Download Maven manually from https://maven.apache.org/download.cgi
# Extract to project folder
# Add to PATH or use full path

mvn clean package
java -jar target\reward-hub-1.0.0.jar
```

### Option 3: Using Docker
```bash
# Download Docker Desktop from https://www.docker.com/products/docker-desktop
# Then run:

docker build -t reward-hub .
docker run -p 8080:8080 reward-hub
```

---

## macOS

```bash
# Install Java (if not already installed)
brew install openjdk@17

# Install Maven
brew install maven

# Build and run
cd RewardHub
mvn clean package
java -jar target/reward-hub-1.0.0.jar

# Or with Docker
docker build -t reward-hub .
docker run -p 8080:8080 reward-hub
```

---

## Linux (Ubuntu/Debian)

```bash
# Install Java
sudo apt-get install openjdk-17-jdk-headless

# Install Maven
sudo apt-get install maven

# Build and run
cd RewardHub
mvn clean package
java -jar target/reward-hub-1.0.0.jar

# Or with Docker
docker build -t reward-hub .
docker run -p 8080:8080 reward-hub
```

---

## Testing the Application

### 1. Browser Access
- Open http://localhost:8080
- Create user account
- Add transactions
- View dashboard

### 2. API Testing with cURL

```bash
# Health check
curl http://localhost:8080/api/health

# Get statistics
curl http://localhost:8080/api/stats

# Create user
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@example.com"}'

# Add transaction
curl -X POST http://localhost:8080/api/transactions \
  -H "Content-Type: application/json" \
  -d '{"userId":"USER1","merchant":"Amazon","amount":100,"cashbackPercent":5}'
```

### 3. Postman Testing
- Import `RewardHub.postman_collection.json` into Postman
- Set `base_url` variable to `http://localhost:8080`
- Run requests from the collection

### 4. Command-line Script (Linux/macOS)
```bash
chmod +x test-api.sh
./test-api.sh
```

---

## Troubleshooting

### Port 8080 already in use

**Windows:**
```cmd
# Find process using port 8080
netstat -ano | findstr :8080

# Kill the process (replace PID with actual process ID)
taskkill /PID <PID> /F
```

**macOS/Linux:**
```bash
# Find process
lsof -i :8080

# Kill the process
kill -9 <PID>
```

### Java not found
```bash
# Check Java installation
java -version

# If not installed:
# - Windows: Download from java.com
# - macOS: brew install openjdk@17
# - Linux: sudo apt-get install openjdk-17-jdk-headless
```

### Maven build fails
```bash
# Clear cache
mvn clean

# Try again with verbose output
mvn -X clean package
```

### Application won't start
1. Check if port 8080 is free
2. Check if Java is installed
3. Check logs for error messages
4. Ensure Spring Boot dependencies are available

---

## Features Tour

### 1. Home Page
- Overview of cashback platform
- Call-to-action buttons
- Feature highlights

### 2. Signup
- Create new user account
- Auto-assigned User ID
- Instant access to dashboard

### 3. Dashboard
- Real-time statistics
- Add transactions
- View transaction history
- See earned cashback

### 4. REST API
- User management endpoints
- Transaction processing
- Statistics retrieval
- Full documentation in README.md

---

## Next Steps

1. ✅ Application is running
2. 📝 Test all features
3. 🔧 Customize if needed
4. 📤 Push to GitHub
5. ☁️ Deploy to cloud (Heroku, Railway, etc.)
6. 📊 Monitor and scale

---

## Resources

- **Documentation**: See README.md
- **Deployment**: See DEPLOYMENT.md
- **API Collection**: RewardHub.postman_collection.json
- **Test Script**: test-api.sh

---

## Support

If you encounter issues:
1. Check this guide
2. Read README.md
3. Review application logs
4. Check troubleshooting section above

---

**Happy coding! 🚀**
