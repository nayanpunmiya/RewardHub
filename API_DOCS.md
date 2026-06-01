# API Documentation

**Base URL**: `http://localhost:8080/api`

---

## Endpoints Overview

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/health` | Health check |
| GET | `/stats` | Platform statistics |
| POST | `/users` | Create new user |
| GET | `/users` | Get all users |
| GET | `/users/{userId}` | Get user details |
| PUT | `/users/{userId}` | Update user |
| POST | `/transactions` | Create transaction |
| GET | `/transactions` | Get all transactions |
| GET | `/transactions/{userId}` | Get user transactions |

---

## Detailed Endpoints

### 1. Health Check
**GET** `/health`

Check if API is running.

**Request**:
```bash
curl http://localhost:8080/api/health
```

**Response** (200):
```json
{
  "status": "OK",
  "message": "API is running"
}
```

---

### 2. Get Statistics
**GET** `/stats`

Get platform-wide statistics.

**Request**:
```bash
curl http://localhost:8080/api/stats
```

**Response** (200):
```json
{
  "totalUsers": 5,
  "totalTransactions": 12,
  "totalCashbackDistributed": 250.50
}
```

---

### 3. Create User
**POST** `/users`

Create a new user account.

**Request**:
```bash
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com"
  }'
```

**Request Body**:
```json
{
  "name": "John Doe",
  "email": "john@example.com"
}
```

**Response** (200):
```json
{
  "id": "USER1",
  "name": "John Doe",
  "email": "john@example.com",
  "cashbackEarned": 0,
  "joinDate": "2024-06-01T12:30:45.123456"
}
```

---

### 4. Get All Users
**GET** `/users`

Retrieve all registered users.

**Request**:
```bash
curl http://localhost:8080/api/users
```

**Response** (200):
```json
[
  {
    "id": "USER1",
    "name": "John Doe",
    "email": "john@example.com",
    "cashbackEarned": 150.00,
    "joinDate": "2024-06-01T10:00:00"
  },
  {
    "id": "USER2",
    "name": "Jane Smith",
    "email": "jane@example.com",
    "cashbackEarned": 200.00,
    "joinDate": "2024-06-01T11:00:00"
  }
]
```

---

### 5. Get User Details
**GET** `/users/{userId}`

Retrieve details of a specific user.

**Request**:
```bash
curl http://localhost:8080/api/users/USER1
```

**Response** (200):
```json
{
  "id": "USER1",
  "name": "John Doe",
  "email": "john@example.com",
  "cashbackEarned": 150.00,
  "joinDate": "2024-06-01T10:00:00"
}
```

**Response** (404):
```json
null
```

---

### 6. Update User
**PUT** `/users/{userId}`

Update user information.

**Request**:
```bash
curl -X PUT http://localhost:8080/api/users/USER1 \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Updated",
    "email": "john.updated@example.com"
  }'
```

**Request Body**:
```json
{
  "name": "John Updated",
  "email": "john.updated@example.com"
}
```

**Response** (200):
```json
{
  "id": "USER1",
  "name": "John Updated",
  "email": "john.updated@example.com",
  "cashbackEarned": 150.00,
  "joinDate": "2024-06-01T10:00:00"
}
```

---

### 7. Create Transaction
**POST** `/transactions`

Record a purchase transaction and calculate cashback.

**Request**:
```bash
curl -X POST http://localhost:8080/api/transactions \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "USER1",
    "merchant": "Amazon",
    "amount": 100.00,
    "cashbackPercent": 5
  }'
```

**Request Body**:
```json
{
  "userId": "USER1",
  "merchant": "Amazon",
  "amount": 100.00,
  "cashbackPercent": 5
}
```

**Response** (200):
```json
{
  "id": "TXN1",
  "userId": "USER1",
  "merchant": "Amazon",
  "amount": 100.00,
  "cashbackPercent": 5,
  "cashbackAmount": 5.00,
  "date": "2024-06-01T12:35:20.456789"
}
```

---

### 8. Get All Transactions
**GET** `/transactions`

Retrieve all transactions on the platform.

**Request**:
```bash
curl http://localhost:8080/api/transactions
```

**Response** (200):
```json
[
  {
    "id": "TXN1",
    "userId": "USER1",
    "merchant": "Amazon",
    "amount": 100.00,
    "cashbackPercent": 5,
    "cashbackAmount": 5.00,
    "date": "2024-06-01T12:35:20"
  },
  {
    "id": "TXN2",
    "userId": "USER2",
    "merchant": "Flipkart",
    "amount": 200.00,
    "cashbackPercent": 10,
    "cashbackAmount": 20.00,
    "date": "2024-06-01T13:00:00"
  }
]
```

---

### 9. Get User Transactions
**GET** `/transactions/{userId}`

Retrieve all transactions for a specific user.

**Request**:
```bash
curl http://localhost:8080/api/transactions/USER1
```

**Response** (200):
```json
[
  {
    "id": "TXN1",
    "userId": "USER1",
    "merchant": "Amazon",
    "amount": 100.00,
    "cashbackPercent": 5,
    "cashbackAmount": 5.00,
    "date": "2024-06-01T12:35:20"
  }
]
```

---

## Error Handling

### Error Response Format

**Status Code**: 4xx or 5xx

**Response**:
```json
{
  "error": "Error description",
  "status": 400,
  "timestamp": "2024-06-01T12:00:00"
}
```

### Common Errors

| Status | Code | Description |
|--------|------|-------------|
| 400 | BAD_REQUEST | Invalid request format |
| 404 | NOT_FOUND | Resource not found |
| 500 | INTERNAL_ERROR | Server error |

---

## Request/Response Examples

### Example 1: Complete User Workflow

1. **Create User**
   ```bash
   curl -X POST http://localhost:8080/api/users \
     -H "Content-Type: application/json" \
     -d '{"name":"Alice","email":"alice@example.com"}'
   
   # Response: {"id":"USER1", ...}
   ```

2. **Add Transaction**
   ```bash
   curl -X POST http://localhost:8080/api/transactions \
     -H "Content-Type: application/json" \
     -d '{"userId":"USER1","merchant":"Starbucks","amount":50,"cashbackPercent":2}'
   
   # Response: {"id":"TXN1", "cashbackAmount":1.00, ...}
   ```

3. **View User Details**
   ```bash
   curl http://localhost:8080/api/users/USER1
   
   # Response: {"id":"USER1", "cashbackEarned":1.00, ...}
   ```

4. **View User Transactions**
   ```bash
   curl http://localhost:8080/api/transactions/USER1
   
   # Response: [{"id":"TXN1", ...}]
   ```

---

## Response Codes Summary

| Code | Meaning |
|------|---------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request |
| 404 | Not Found |
| 500 | Server Error |

---

## Data Types

### User Object
```json
{
  "id": "string",
  "name": "string",
  "email": "string",
  "cashbackEarned": "number",
  "joinDate": "ISO8601 datetime"
}
```

### Transaction Object
```json
{
  "id": "string",
  "userId": "string",
  "merchant": "string",
  "amount": "number",
  "cashbackPercent": "number",
  "cashbackAmount": "number",
  "date": "ISO8601 datetime"
}
```

### Stats Object
```json
{
  "totalUsers": "number",
  "totalTransactions": "number",
  "totalCashbackDistributed": "number"
}
```

---

## Rate Limiting

Currently: **No rate limiting** (for development)

For production, consider implementing:
- 1000 requests/minute per IP
- 100 requests/minute per user

---

## Authentication

Currently: **No authentication** (for development)

For production, consider implementing:
- JWT tokens
- API keys
- OAuth 2.0

---

## CORS Headers

All endpoints support CORS with:
- Allowed Origins: `*`
- Allowed Methods: `GET, POST, PUT, DELETE, OPTIONS`
- Allowed Headers: `*`

---

## Testing Tools

### cURL
```bash
curl -X GET http://localhost:8080/api/health
```

### Postman
- Import: `RewardHub.postman_collection.json`
- Variables: Set `base_url = http://localhost:8080`

### Python
```python
import requests

response = requests.get('http://localhost:8080/api/stats')
data = response.json()
print(data)
```

### JavaScript/Node.js
```javascript
fetch('http://localhost:8080/api/stats')
  .then(r => r.json())
  .then(data => console.log(data));
```

---

## Pagination & Filtering

**Not currently implemented**. For large datasets, consider:
```bash
# Example future implementation
GET /api/transactions?page=1&limit=10&userId=USER1
```

---

## API Version

**Current Version**: 1.0.0

**Changelog**:
- v1.0.0 (2024-06-01): Initial release

---

## Support

For API issues:
1. Check request format
2. Verify all required fields
3. Check response status codes
4. Review application logs

---

**Last Updated**: June 2024  
**Maintained by**: Development Team
