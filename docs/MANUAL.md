# RewardHub - User Manual

## What is RewardHub?

RewardHub is a **cashback rewards platform** that tracks user purchases and automatically calculates cashback rewards. It features a web dashboard for managing users and transactions, plus a REST API for integration.

---

## Getting Started (5 Minutes)

### Prerequisites
- Java 17 or higher
- Maven 3.8 or higher

### Installation

**Step 1:** Clone and navigate
```bash
git clone https://github.com/nayanpunmiya/RewardHub.git
cd RewardHub
```

**Step 2:** Build
```bash
mvn clean package
```

**Step 3:** Run
```bash
java -jar target/reward-hub-1.0.0.jar
```

**Step 4:** Open browser
```
http://localhost:8080
```

---

## Frontend Dashboard - What You See

### Home Page
When you open the application, you'll see:
- **Total Users**: Number of registered users
- **Total Transactions**: Number of completed transactions
- **Total Cashback**: Total amount distributed as cashback

### Navigation Menu
Located at the top of the dashboard with sections for:
- **Dashboard** - View platform statistics
- **Users** - Manage user accounts
- **Transactions** - View transaction history

---

## How to Use the Frontend

### Creating a User

**Where**: Click "Users" → "Create New User"

**What to Enter**:
- **Name** - User's full name (required)
- **Email** - User's email address (required)

**What Happens**: New user is created and assigned a unique ID (USER1, USER2, etc.)

### Viewing Users

**Where**: Click "Users" → "View All Users"

**What You See**:
- User ID
- User Name
- User Email
- Cashback Earned (total cashback for this user)
- Join Date

### Updating User Information

**Where**: Click "Users" → Select a user → "Edit"

**What You Can Change**:
- Name
- Email

**What You Cannot Change**:
- User ID (permanent)
- Cashback Earned (updated automatically)

### Creating a Transaction

**Where**: Click "Transactions" → "Create New Transaction"

**What to Enter**:
- **User ID** - Which user made the purchase
- **Amount** - Purchase amount (e.g., 100.50)
- **Description** - What was purchased (e.g., "Coffee")
- **Cashback %** - What percentage is cashback (e.g., 5)

**What Happens**: 
- Transaction is recorded
- Cashback is automatically calculated
- User's total cashback is updated
- Platform stats are updated

**Example**: 
- Purchase: $100
- Cashback: 5%
- User gets: $5 cashback

### Viewing Transactions

**Where**: Click "Transactions" → "View All Transactions"

**What You See**:
- Transaction ID
- User ID
- Amount
- Description
- Cashback Amount (calculated)
- Cashback Percentage
- Transaction Date

---

## API Endpoints - For Developers

### Health Check
**URL**: `http://localhost:8080/api/health`

**What It Does**: Verifies the application is running

**Response**:
```json
{
  "status": "OK",
  "message": "API is running"
}
```

### Get Statistics
**URL**: `http://localhost:8080/api/stats`

**What It Does**: Returns platform-wide statistics

**Response**:
```json
{
  "totalUsers": 2,
  "totalTransactions": 5,
  "totalCashbackDistributed": 125.50
}
```

### Create User
**URL**: `http://localhost:8080/api/users`

**Method**: POST

**Send**:
```json
{
  "name": "John Doe",
  "email": "john@example.com"
}
```

**Response**:
```json
{
  "id": "USER1",
  "name": "John Doe",
  "email": "john@example.com",
  "cashbackEarned": 0.0,
  "joinDate": "2026-06-02T16:15:34"
}
```

### Get All Users
**URL**: `http://localhost:8080/api/users`

**Method**: GET

**Response**: Array of all users

```json
[
  {
    "id": "USER1",
    "name": "John Doe",
    "email": "john@example.com",
    "cashbackEarned": 0.0,
    "joinDate": "2026-06-02T16:15:34"
  }
]
```

### Get User by ID
**URL**: `http://localhost:8080/api/users/USER1`

**Method**: GET

**Response**: Single user object

```json
{
  "id": "USER1",
  "name": "John Doe",
  "email": "john@example.com",
  "cashbackEarned": 25.50,
  "joinDate": "2026-06-02T16:15:34"
}
```

### Update User
**URL**: `http://localhost:8080/api/users/USER1`

**Method**: PUT

**Send**:
```json
{
  "name": "John Updated",
  "email": "john.new@example.com"
}
```

**Response**: Updated user object

### Create Transaction
**URL**: `http://localhost:8080/api/transactions`

**Method**: POST

**Send**:
```json
{
  "userId": "USER1",
  "amount": 100.50,
  "description": "Coffee Purchase",
  "cashbackPercentage": 5
}
```

**Response**:
```json
{
  "id": "TXN1",
  "userId": "USER1",
  "amount": 100.50,
  "description": "Coffee Purchase",
  "cashbackAmount": 5.025,
  "cashbackPercentage": 5,
  "transactionDate": "2026-06-02T16:20:00"
}
```

### Get All Transactions
**URL**: `http://localhost:8080/api/transactions`

**Method**: GET

**Response**: Array of all transactions

### Get User Transactions
**URL**: `http://localhost:8080/api/transactions/USER1`

**Method**: GET

**Response**: Array of transactions for USER1

---

## Testing the API with Examples

### Using Command Line (cURL)

**Test health**:
```bash
curl http://localhost:8080/api/health
```

**Create a user**:
```bash
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{"name":"Jane Smith","email":"jane@example.com"}'
```

**Get all users**:
```bash
curl http://localhost:8080/api/users
```

**Create transaction**:
```bash
curl -X POST http://localhost:8080/api/transactions \
  -H "Content-Type: application/json" \
  -d '{"userId":"USER1","amount":100,"description":"Shopping","cashbackPercentage":10}'
```

### Using Postman (Visual Tool)

1. Import file: `RewardHub.postman_collection.json` into Postman
2. All endpoints are pre-configured
3. Click on each endpoint and click "Send"
4. View responses

---

## Features Overview

### User Management
- ✅ Create new users
- ✅ View all users
- ✅ View individual user details
- ✅ Update user information
- ✅ Track user cashback balance

### Transaction Management
- ✅ Create purchase transactions
- ✅ Automatic cashback calculation
- ✅ View transaction history
- ✅ Filter transactions by user

### Real-time Statistics
- ✅ Total users count
- ✅ Total transactions count
- ✅ Total cashback distributed
- ✅ Live dashboard updates

### REST API
- ✅ 9 different endpoints
- ✅ JSON request/response
- ✅ Easy integration
- ✅ Health check endpoint

---

## Common Workflows

### Workflow 1: Set Up a New Customer
1. Open Dashboard
2. Click "Users"
3. Click "Create New User"
4. Enter name and email
5. Click "Create"
✅ User is created and ready

### Workflow 2: Record a Purchase
1. Click "Transactions"
2. Click "Create New Transaction"
3. Select user from dropdown
4. Enter amount (e.g., 100)
5. Enter description (e.g., "Purchase")
6. Enter cashback percentage (e.g., 5)
7. Click "Create"
✅ Transaction recorded, cashback calculated automatically

### Workflow 3: Check Customer Rewards
1. Click "Users"
2. Find the customer in the list
3. Look at "Cashback Earned" column
4. Click user to see more details
✅ You can see total cashback earned

### Workflow 4: View All Activity
1. Click "Dashboard"
2. View statistics at the top
3. Click "Transactions" to see all purchases
4. Click "Users" to see all customers
✅ Complete platform overview

---

## Troubleshooting

### Application won't start
**Error**: "Address already in use :8080"

**Solution**: Use different port
```bash
java -jar target/reward-hub-1.0.0.jar --server.port=9000
```
Then open: `http://localhost:9000`

### Can't find Java
**Error**: "java: command not found"

**Solution**: Install Java 17+
- Download from https://www.java.com/
- Verify: `java -version`

### API endpoint returns 404
**Error**: Not Found

**Solution**: 
- Check URL spelling
- Verify port number (default 8080)
- Check user ID exists before accessing

### Data disappears after restart
**Normal Behavior**: RewardHub uses in-memory storage

**Why**: Data is stored in RAM, not disk

**Solution**: Add database (PostgreSQL/MySQL) for persistent storage

---

## System Requirements

| Requirement | Minimum | Recommended |
|-------------|---------|-------------|
| Java | 17 | 17+ |
| Maven | 3.8 | 3.9+ |
| RAM | 256 MB | 512 MB+ |
| Disk Space | 500 MB | 1 GB |
| OS | Any | Windows/Mac/Linux |

---

## Deployment

### Local Development
```bash
java -jar target/reward-hub-1.0.0.jar
```

### Docker
```bash
docker build -t reward-hub .
docker run -p 8080:8080 reward-hub
```

### Cloud (Railway)
- Connect GitHub repository
- Railway automatically builds and deploys
- Get public URL: `https://your-domain.railway.app`

---

## Support & Help

**Documentation**: `/docs/` folder in GitHub

**Report Issues**: https://github.com/nayanpunmiya/RewardHub/issues

**Questions**: Create GitHub Discussion

---

## Key Points to Remember

✅ **No database setup required** - Works out of the box

✅ **Data is in-memory** - Resets on application restart

✅ **REST API included** - Can integrate with other apps

✅ **Complete dashboard** - No need to use API for basic tasks

✅ **Cashback auto-calculated** - No manual calculation needed

✅ **Production-ready** - Can be deployed to cloud

---

## Next Steps

1. **Run the application** (follow Getting Started section)
2. **Create test users** (use Frontend Dashboard)
3. **Create test transactions** (use Frontend Dashboard)
4. **Explore the API** (use cURL or Postman)
5. **Deploy to cloud** (optional, follows same process)

---

**Version**: 1.0.0  
**Last Updated**: June 2, 2026  
**Status**: Production Ready ✅
