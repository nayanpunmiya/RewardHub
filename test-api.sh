#!/bin/bash
# Quick test script for RewardHub API

BASE_URL="http://localhost:8080/api"

echo "🧪 RewardHub API Test Suite"
echo "=================================="
echo ""

# Test 1: Health Check
echo "1️⃣ Health Check..."
curl -s $BASE_URL/health | jq '.' || echo "❌ Failed"
echo ""

# Test 2: Get Stats
echo "2️⃣ Getting Initial Stats..."
curl -s $BASE_URL/stats | jq '.' || echo "❌ Failed"
echo ""

# Test 3: Create User 1
echo "3️⃣ Creating User 1..."
USER1=$(curl -s -X POST $BASE_URL/users \
  -H "Content-Type: application/json" \
  -d '{"name":"Alice Johnson","email":"alice@example.com"}' | jq -r '.id')
echo "User ID: $USER1"
echo ""

# Test 4: Create User 2
echo "4️⃣ Creating User 2..."
USER2=$(curl -s -X POST $BASE_URL/users \
  -H "Content-Type: application/json" \
  -d '{"name":"Bob Smith","email":"bob@example.com"}' | jq -r '.id')
echo "User ID: $USER2"
echo ""

# Test 5: Get All Users
echo "5️⃣ Getting All Users..."
curl -s $BASE_URL/users | jq '.' || echo "❌ Failed"
echo ""

# Test 6: Add Transaction for User 1
echo "6️⃣ Adding Transaction for User 1..."
TXN1=$(curl -s -X POST $BASE_URL/transactions \
  -H "Content-Type: application/json" \
  -d "{\"userId\":\"$USER1\",\"merchant\":\"Amazon\",\"amount\":150.00,\"cashbackPercent\":5}")
echo "$TXN1" | jq '.'
echo ""

# Test 7: Add Transaction for User 2
echo "7️⃣ Adding Transaction for User 2..."
TXN2=$(curl -s -X POST $BASE_URL/transactions \
  -H "Content-Type: application/json" \
  -d "{\"userId\":\"$USER2\",\"merchant\":\"Flipkart\",\"amount\":200.00,\"cashbackPercent\":10}")
echo "$TXN2" | jq '.'
echo ""

# Test 8: Get User Transactions
echo "8️⃣ Getting User 1 Transactions..."
curl -s $BASE_URL/transactions/$USER1 | jq '.' || echo "❌ Failed"
echo ""

# Test 9: Updated Stats
echo "9️⃣ Final Stats..."
curl -s $BASE_URL/stats | jq '.' || echo "❌ Failed"
echo ""

echo "✅ Tests completed!"
