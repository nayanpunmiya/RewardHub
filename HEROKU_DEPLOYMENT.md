# Heroku Deployment - Step by Step Guide

**RewardHub → Heroku in 10 minutes**

---

## Step 1: Create Heroku Account

1. Go to: https://www.heroku.com
2. Click **Sign Up** (top right)
3. Fill in:
   - Email: Your email
   - Password: Strong password
   - Company: Optional
   - Language: Node.js (doesn't matter, we'll use Java)
4. Click **Create free account**
5. **Verify your email** - Check your inbox, click link

**Status**: ✅ Heroku account created

---

## Step 2: Install Heroku CLI

### Windows

**Option A: Download Installer (Easiest)**
1. Go to: https://devcenter.heroku.com/articles/heroku-cli
2. Download **Heroku CLI for Windows**
3. Run installer (`.exe` file)
4. Follow installation wizard (accept all defaults)
5. Restart terminal/PowerShell

**Option B: Using Chocolatey**
```powershell
choco install heroku-cli
```

**Option C: Using npm**
```powershell
npm install -g heroku
```

---

**Verify Installation:**
```powershell
heroku --version
```

Should show: `heroku/X.X.X` (your version)

**Status**: ✅ Heroku CLI installed

---

## Step 3: Login to Heroku

Open PowerShell and run:

```powershell
heroku login
```

**What happens:**
- Browser opens automatically
- Click **Log in** button
- You're authenticated
- PowerShell shows: `Logged in as your@email.com`

**Status**: ✅ You're logged into Heroku

---

## Step 4: Prepare Your Project

Navigate to project:

```powershell
cd C:\Users\hp\RewardHub
```

**Verify git status:**
```powershell
git status
```

Should show: `On branch master` or `On branch main`

**Status**: ✅ In correct directory

---

## Step 5: Create Heroku App

```powershell
heroku create reward-hub-app
```

**What this does:**
- Creates app on Heroku servers
- Sets up deployment pipeline
- Gives you a unique URL

**Output will show:**
```
Creating ⣾ reward-hub-app...
Creating app... done, ⬢ reward-hub-app
https://reward-hub-app.herokuapp.com/ | https://git.heroku.com/reward-hub-app.git
```

**Your live URL**: `https://reward-hub-app.herokuapp.com`

**Note**: If `reward-hub-app` is taken, try:
```powershell
heroku create
# Generates random unique name
```

**Status**: ✅ Heroku app created

---

## Step 6: Deploy to Heroku

```powershell
git push heroku main
```

**Or if using master branch:**
```powershell
git push heroku master
```

**What happens:**
- Pushes code to Heroku
- Automatically builds with Maven
- Compiles Java code
- Starts application

**This takes 2-3 minutes. You'll see:**

```
Compressing source files... done.
Building source:
-----> Building on the Heroku-22 stack
-----> Using buildpack: heroku/java
-----> Installing JDK 17... done
-----> Building with Maven
...
-----> Launching...
Released v1
https://reward-hub-app.herokuapp.com/ deployed to Heroku
```

**Status**: ✅ Application deployed!

---

## Step 7: View Your Live App

**Option A: Direct URL**
```
Open browser and go to:
https://reward-hub-app.herokuapp.com
```

**Option B: Command Line**
```powershell
heroku open
```
Browser automatically opens your live app

**Option C: View Logs**
```powershell
heroku logs --tail
```

Shows real-time application logs

**What you should see:**
- Gradient purple homepage
- "RewardHub - Earn Cashback on Every Purchase"
- Sign up form
- Dashboard access

**Status**: ✅ Application is LIVE!

---

## Testing Your Live App

### Create a User
1. Click **Get Started Free** button
2. Enter name and email
3. Click **Sign Up**
4. Note your User ID (e.g., USER1)

### Add Transaction
1. Go to **Dashboard** button in top-right
2. Select user from dropdown
3. Enter:
   - Merchant: Amazon
   - Amount: 100
   - Cashback %: 5
4. Click **Add Transaction**
5. See cashback calculated: $5.00

### View Stats
Dashboard shows:
- Total Users
- Total Transactions
- Total Cashback Distributed

---

## API Testing (Live)

Test API endpoints on your live app:

```powershell
# Health check
curl https://reward-hub-app.herokuapp.com/api/health

# Get statistics
curl https://reward-hub-app.herokuapp.com/api/stats

# Create user
curl -X POST https://reward-hub-app.herokuapp.com/api/users `
  -H "Content-Type: application/json" `
  -d '{\"name\":\"Alice\",\"email\":\"alice@example.com\"}'
```

---

## Useful Heroku Commands

```powershell
# View app information
heroku info

# View logs in real-time
heroku logs --tail

# View logs with specific number of lines
heroku logs -n 50

# Restart app
heroku restart

# View deployed code
heroku ps

# Scale dynos (advanced)
heroku ps:scale web=1

# Set environment variables
heroku config:set SOME_VAR=value

# View environment variables
heroku config

# Destroy app (careful!)
heroku apps:destroy reward-hub-app
```

---

## Custom Domain (Optional)

If you have a custom domain, add it:

```powershell
heroku domains:add www.example.com
```

Then update DNS settings with your domain registrar

---

## Troubleshooting

### App won't deploy

**Error: "couldn't access git"`**
```powershell
# Make sure you're logged in
heroku login

# Check git remotes
git remote -v

# Should show:
# heroku  https://git.heroku.com/reward-hub-app.git (push)
```

**Error: "build failure"`**
```powershell
# View detailed logs
heroku logs --tail

# Usually means:
# 1. Java not found (we handle this)
# 2. Maven issue (rare)
# 3. Memory issue (unlikely)
```

---

### App crashes after deployment

```powershell
# View logs
heroku logs --tail

# Restart app
heroku restart

# Check processes
heroku ps
```

---

### Can't access live app

1. Wait 30 seconds (Heroku needs time to start)
2. Refresh page
3. Check logs: `heroku logs --tail`
4. Restart: `heroku restart`

---

## Monitoring & Performance

### View App Metrics
```powershell
# In Heroku Dashboard, click your app
# View "Metrics" tab for:
# - Dyno hours
# - Response time
# - CPU usage
```

### Free Tier Limits
- ✅ 1000 free dyno hours/month (plenty for portfolio)
- ✅ Auto-sleeps after 30 min inactivity
- ✅ Wakes up on first request

---

## Sharing Your Live App

**Portfolio Link:**
```
https://reward-hub-app.herokuapp.com
```

**Share with companies:**
- "Live demo: https://reward-hub-app.herokuapp.com"
- Show homepage
- Show dashboard
- Test API endpoints

---

## Next: Push to GitHub

After Heroku deployment, push to GitHub too:

```powershell
git remote add origin https://github.com/YOUR_USERNAME/RewardHub.git
git branch -M main
git push -u origin main
```

Now you have:
- ✅ Code on GitHub
- ✅ Live app on Heroku

---

## Full Workflow Summary

```powershell
# 1. Login
heroku login

# 2. Create app
heroku create reward-hub-app

# 3. Deploy
git push heroku main

# 4. View live
heroku open

# 5. Done! Share URL
```

**Total time: ~5 minutes**

---

## What Heroku Does Automatically

✅ Detects Java/Maven project  
✅ Downloads JDK 17  
✅ Runs Maven build  
✅ Compiles JAR file  
✅ Starts Spring Boot server  
✅ Assigns port dynamically  
✅ Creates live URL  
✅ Manages infrastructure  

**You don't need to do any of this manually.**

---

## Free Tier Details

### What's Free:
- ✅ Hosting
- ✅ 1000 dyno hours/month
- ✅ SSL/TLS certificate
- ✅ Logs and metrics
- ✅ Custom domains

### What's Limited:
- Auto-sleep after 30 min (free tier)
- 1 dyno only
- No database (we use in-memory)

### Cost:
**$0/month** for this portfolio project

---

## Upgrade to Paid (Optional)

```powershell
# Upgrade to paid dyno
heroku dyno:type web=basic

# Removes auto-sleep
# Always running
# $5-7/month
```

Not necessary for portfolio.

---

## Pro Tips

1. **Always commit before deploying**
   ```powershell
   git add .
   git commit -m "Changes before deployment"
   git push heroku main
   ```

2. **Use meaningful app name**
   ```powershell
   heroku create portfolio-reward-hub
   # Better than random name
   ```

3. **Monitor logs regularly**
   ```powershell
   heroku logs --tail
   # Catch issues early
   ```

4. **Set up Heroku dashboard alerts** (paid feature)

---

## After Deployment Checklist

- ✅ App is live at `https://reward-hub-app.herokuapp.com`
- ✅ Can access homepage
- ✅ Can create users
- ✅ Can add transactions
- ✅ Can view dashboard
- ✅ API endpoints work
- ✅ Logs look clean
- ✅ Share URL with companies

---

## Support Resources

- **Heroku Docs**: https://devcenter.heroku.com
- **Java on Heroku**: https://devcenter.heroku.com/articles/java-support
- **Troubleshooting**: https://devcenter.heroku.com/articles/error-codes
- **Stack Overflow**: Tag with `heroku` + `java`

---

## Quick Reference

| Task | Command |
|------|---------|
| Login | `heroku login` |
| Create app | `heroku create app-name` |
| Deploy | `git push heroku main` |
| View app | `heroku open` |
| View logs | `heroku logs --tail` |
| Restart | `heroku restart` |
| Destroy | `heroku apps:destroy app-name` |

---

## You're Done! 🎉

Your live link:
```
https://reward-hub-app.herokuapp.com
```

Share this with:
- ✅ Companies
- ✅ Portfolio
- ✅ Resume
- ✅ Social media

---

**Created**: June 1, 2024  
**Status**: ✅ Ready to Deploy  
**Estimated Time**: 5-10 minutes to live  

---

**Next**: Push code to GitHub and share both links! 🚀
