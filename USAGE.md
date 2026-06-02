# 💰 RewardHub - User Guide

## Quick Start (30 seconds)

1. **Open**: `http://localhost:8080` in your browser
2. **Create a User**: Enter a name and email on the left card, click "Create User"
3. **Create a Transaction**: Select the user, enter merchant, amount, and cashback %, click "Create Transaction"
4. **Watch Statistics**: See totals update in real-time at the top

---

## 📋 Step-by-Step Guide

### Step 1: Create Your First User
Located on the **LEFT side** of the dashboard:

1. Enter **Full Name** - Example: `John Doe`
2. Enter **Email** - Example: `john@example.com`
3. Click **"Create User"** button
4. ✅ User appears in the "All Users" list below

### Step 2: Create a Transaction
Located on the **RIGHT side** of the dashboard:

1. **Select User** dropdown - Choose a user from the list
2. **Store/Merchant** - Where the purchase happened:
   - Examples: `Amazon`, `Flipkart`, `Myntra`, `Netflix`, `Swiggy`
3. **Amount** - How much was spent:
   - Examples: `100.50`, `1500.00`, `50`
4. **Cashback %** - Reward percentage:
   - Examples: `5` (for 5%), `3` (for 3%), `10` (for 10%)
5. Click **"Create Transaction"** button
6. ✅ Transaction appears and cashback is calculated automatically

### Step 3: View Your Data

**Statistics (Top of page):**
- **Total Users** - How many customers registered
- **Total Transactions** - All purchases made
- **Total Cashback** - Sum of all rewards given

**All Users (Left card):**
- Shows each user's name, email, earned cashback, and join date
- Click "Create User" to add more

**Recent Transactions (Right card):**
- Shows last 10 transactions
- Displays merchant, amount, cashback percentage, and reward earned

---

## 🎯 Real-World Example

**Scenario:** A store offers cashback rewards

### Step 1: Register Customers
```
User 1: Alice (alice@example.com)
User 2: Bob (bob@example.com)
User 3: Charlie (charlie@example.com)
```

### Step 2: Track Their Purchases
```
Alice buys on Amazon for $150 @ 5% = $7.50 cashback
Alice buys on Myntra for $80 @ 10% = $8.00 cashback
Bob buys on Flipkart for $200 @ 3% = $6.00 cashback
Charlie buys on Netflix for $16 @ 2% = $0.32 cashback
```

### Step 3: Results
```
✓ Alice: $15.50 total cashback
✓ Bob: $6.00 total cashback  
✓ Charlie: $0.32 total cashback
✓ Total Distributed: $21.82
```

---

## ❓ Common Questions

**Q: Do I need to create a user before creating a transaction?**
A: Yes! Select a user in the "Select User" dropdown first.

**Q: How is cashback calculated?**
A: Formula: `(Amount × Cashback %) / 100`
- Example: $100 @ 5% = $5

**Q: Can the same user have multiple transactions?**
A: Yes! Create as many transactions as needed.

**Q: What happens to data when I refresh the page?**
A: Data is kept in memory while the app is running. It will reset if you restart the server.

**Q: Can I update a user's information?**
A: Currently you can create and view users. The app automatically tracks their total cashback.

**Q: What's the limit on transactions?**
A: No limit! Add as many as you want.

---

## 🎨 Understanding the Dashboard

```
┌─────────────────────────────────────────────────────────┐
│                    📊 STATISTICS BAR                    │
│  [Total Users] [Total Transactions] [Total Cashback]   │
└─────────────────────────────────────────────────────────┘

┌──────────────────────────┬──────────────────────────┐
│                          │                          │
│   👤 CREATE USER         │   💳 CREATE TRANSACTION  │
│                          │                          │
│  [Name Input]            │  [Select User]           │
│  [Email Input]           │  [Merchant Input]        │
│  [Create Button]         │  [Amount Input]          │
│                          │  [Cashback % Input]      │
│  ─── All Users ───       │  [Create Button]         │
│  [User 1 Details]        │                          │
│  [User 2 Details]        │  ─── Recent Txns ───    │
│                          │  [Transaction 1]         │
│                          │  [Transaction 2]         │
└──────────────────────────┴──────────────────────────┘
```

---

## 🚀 Tips for Best Experience

✅ **Do:**
- Create multiple users to test the system
- Try different cashback percentages (2%, 5%, 10%)
- Watch stats update automatically (refreshes every 5 seconds)
- Use realistic merchant names (Amazon, Flipkart, etc.)

❌ **Don't:**
- Leave fields empty (form will show error)
- Enter negative amounts (use positive numbers)
- Use special characters in names (keep it simple)

---

## 🔧 Technical Details

**API Endpoints (for developers):**
- `GET /api/health` - API status check
- `GET /api/users` - All users
- `GET /api/users/{userId}` - Specific user
- `GET /api/transactions` - All transactions
- `GET /api/stats` - Statistics

**Browser Compatibility:**
- Chrome ✅
- Firefox ✅
- Safari ✅
- Edge ✅

---

## 📞 Need Help?

If something doesn't work:

1. **Check browser console** (F12 → Console tab)
2. **Reload page** (Ctrl+R or Cmd+R)
3. **Restart server** if needed
4. **Check that app is running** at `http://localhost:8080`

---

**Enjoy using RewardHub!** 🎉
