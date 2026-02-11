# 🔑 Use Docker Hub Access Token (Recommended)

## Why Use Access Token?

- ✅ More secure than password
- ✅ Don't need to remember Docker Hub password
- ✅ Can revoke anytime
- ✅ Recommended by Docker

---

## Step-by-Step Guide

### Step 1: Create Access Token

1. **Go to:** https://app.docker.com/settings/personal-access-tokens

2. **Click:** "Generate New Token"

3. **Fill in:**
   - Description: `food-ordering-app`
   - Access permissions: `Read, Write, Delete`

4. **Click:** "Generate"

5. **IMPORTANT:** Copy the token immediately!
   - It looks like: `dckr_pat_abc123xyz...`
   - You won't be able to see it again!
   - Save it somewhere safe

### Step 2: Login with Token

Open PowerShell and run:

```bash
docker login -u devanshut02
```

When prompted for password:
- **Paste the access token** (not your email password!)
- Press Enter

You should see: `Login Succeeded`

### Step 3: Push Your Image

```bash
docker push devanshut02/food-ordering-app:latest
```

Wait 2-3 minutes for upload to complete.

---

## ✅ Complete Command Sequence

```bash
# 1. Login with access token
docker login -u devanshut02
# Paste token when prompted for password

# 2. Push image
docker push devanshut02/food-ordering-app:latest

# 3. Verify at:
# https://hub.docker.com/r/devanshut02/food-ordering-app
```

---

## 🎯 What the Token Looks Like

```
dckr_pat_1234567890abcdefghijklmnopqrstuvwxyz
```

- Starts with `dckr_pat_`
- Long string of letters and numbers
- This is what you paste as "password"

---

## 🐛 Troubleshooting

**"I closed the token window!"**
- Create a new token
- You can have multiple tokens

**"Token doesn't work"**
- Make sure you copied the entire token
- Check for extra spaces
- Token should start with `dckr_pat_`

**"Still says unauthorized"**
- Make sure username is: `devanshut02`
- Make sure you're pasting the token, not typing it
- Try creating a new token

---

## 📋 Quick Summary

1. Go to: https://app.docker.com/settings/personal-access-tokens
2. Generate new token
3. Copy the token
4. Run: `docker login -u devanshut02`
5. Paste token as password
6. Run: `docker push devanshut02/food-ordering-app:latest`

**This is the easiest and most secure way!**
