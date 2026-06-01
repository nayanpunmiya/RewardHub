# Deployment Guide

## Local Deployment

### Prerequisites
- Java 17+
- Maven 3.8+

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/RewardHub.git
   cd RewardHub
   ```

2. **Build the project**
   ```bash
   mvn clean package
   ```

3. **Run the application**
   ```bash
   java -jar target/reward-hub-1.0.0.jar
   ```

4. **Access the application**
   - Open http://localhost:8080 in your browser
   - API documentation: http://localhost:8080/api/health

---

## Docker Deployment

### Prerequisites
- Docker installed

### Steps

1. **Build Docker image**
   ```bash
   docker build -t reward-hub:latest .
   ```

2. **Run container**
   ```bash
   docker run -p 8080:8080 reward-hub:latest
   ```

3. **Using Docker Compose**
   ```bash
   docker-compose up
   ```

---

## GitHub Deployment

### Steps

1. **Create GitHub repository**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: RewardHub cashback platform"
   git branch -M main
   git remote add origin https://github.com/yourusername/RewardHub.git
   git push -u origin main
   ```

2. **GitHub Actions**
   - Automatic CI/CD pipeline configured
   - Builds on every push
   - Runs tests automatically
   - Artifacts stored for download

3. **Release Artifacts**
   - Download JAR from GitHub Actions
   - Deploy JAR to cloud services
   - Use Docker image for container deployment

---

## Cloud Deployment Options

### 1. Heroku (Recommended for Java)

**Prerequisites**: Heroku CLI installed

**Steps**:
```bash
# Login to Heroku
heroku login

# Create app
heroku create your-app-name

# Deploy
git push heroku main

# View logs
heroku logs --tail
```

The `Procfile` and `system.properties` files are already configured.

### 2. Railway.app

**Steps**:
1. Connect your GitHub repository
2. Railway automatically detects Java project
3. Deploy with one click
4. Custom domain setup available

### 3. Fly.io

**Steps**:
```bash
fly launch
fly deploy
```

### 4. Google Cloud Run

**Steps**:
```bash
# Build Docker image
gcloud builds submit --tag gcr.io/PROJECT_ID/reward-hub

# Deploy
gcloud run deploy reward-hub \
  --image gcr.io/PROJECT_ID/reward-hub \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
```

### 5. AWS Elastic Beanstalk

**Steps**:
```bash
# Install EB CLI
pip install awsebcli

# Initialize
eb init -p java-17 reward-hub

# Create environment
eb create reward-hub-env

# Deploy
eb deploy
```

### 6. Azure App Service

**Steps**:
1. Create Resource Group
2. Create App Service Plan
3. Deploy JAR file
4. Configure startup command: `java -jar target/reward-hub-1.0.0.jar`

### 7. DigitalOcean App Platform

**Steps**:
1. Push to GitHub
2. Connect repository to DigitalOcean
3. Configure build command: `mvn clean package`
4. Set runtime to Java
5. Deploy

---

## Environment Variables

Set these variables for production:

```bash
SERVER_PORT=8080          # Port (default: 8080)
SPRING_PROFILES_ACTIVE=prod
```

---

## Monitoring & Logs

### Local
```bash
# View logs
java -jar target/reward-hub-1.0.0.jar
```

### Docker
```bash
# View container logs
docker logs <container-id>

# Follow logs
docker logs -f <container-id>
```

### Heroku
```bash
heroku logs --tail
```

---

## Performance Tips

1. **Enable compression**: Reduces response size by 70%
2. **Caching**: Browser caches static assets
3. **Connection pooling**: Already configured
4. **Load balancing**: Available on cloud providers

---

## Troubleshooting

### Port already in use
```bash
# Find process
netstat -ano | findstr :8080

# Kill process
taskkill /PID <PID> /F
```

### Maven build fails
```bash
# Clear cache
mvn clean

# Update dependencies
mvn dependency:resolve

# Verbose output
mvn -X clean package
```

### Application won't start
1. Check Java version: `java -version`
2. Check port availability: `netstat -ano | findstr :8080`
3. Check logs for errors
4. Ensure all dependencies are installed

---

## Production Checklist

- [ ] Environment variables configured
- [ ] Error logging enabled
- [ ] Health checks configured
- [ ] API rate limiting (optional)
- [ ] CORS properly configured
- [ ] Database backups (not needed - in-memory)
- [ ] SSL/TLS enabled (on cloud provider)
- [ ] Security headers configured
- [ ] Monitoring alerts set up
- [ ] Load testing completed

---

## Cost Comparison

| Service | Free Tier | Startup Cost |
|---------|-----------|--------------|
| Railway | $5/mo | $5 |
| Heroku | ❌ Discontinued | $7+ |
| Fly.io | $3/mo | $3 |
| Google Cloud Run | $0-$1 | Variable |
| AWS Elastic Beanstalk | ❌ | $5-20 |
| DigitalOcean | ❌ | $5 |
| Azure | $12+ free credits | $10+ |

---

## Support

For issues or questions:
1. Check README.md
2. Review GitHub issues
3. Check deployment service documentation
4. Check application logs

---

**Last Updated**: June 2024  
**Status**: ✅ Production Ready
