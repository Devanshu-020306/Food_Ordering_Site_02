# 🚀 Deploy to Vercel - Complete Guide

## Important Note

Vercel is designed for frontend and serverless functions. Since your app has a full backend server, we have two options:

1. **Deploy full-stack on Vercel** (frontend + serverless backend)
2. **Deploy frontend on Vercel + backend elsewhere** (Railway/Render)

---

## Option 1: Full-Stack on Vercel (Recommended)

We'll convert your backend to Vercel serverless functions.

### Step 1: Install Vercel CLI

```bash
npm install -g vercel
```

### Step 2: Push to GitHub

```bash
git init
git add .
git commit -m "Deploy to Vercel"
```

Create repo on GitHub, then:
```bash
git remote add origin https://github.com/YOUR-USERNAME/food-ordering-app.git
git branch -M main
git push -u origin main
```

### Step 3: Deploy

```bash
vercel
```

Follow the prompts:
- Set up and deploy? **Y**
- Which scope? Select your account
- Link to existing project? **N**
- Project name? **food-ordering-app**
- In which directory? **./** (press Enter)
- Override settings? **N**

Wait 2-3 minutes, your app will be live!

---

## Option 2: Frontend on Vercel + Backend on Railway (Easier!)

This is actually easier and works better for your app structure.

### Step 1: Deploy Backend on Railway

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login
railway login

# Deploy backend
railway init
railway up
```

Save your Railway backend URL (e.g., `https://your-app.railway.app`)

### Step 2: Deploy Frontend on Vercel

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy frontend
cd frontend
vercel
```

### Step 3: Connect Frontend to Backend

In Vercel dashboard:
1. Go to your project settings
2. Environment Variables
3. Add: `VITE_API_URL` = `https://your-railway-backend.railway.app/api`
4. Redeploy

---

## 🎯 Easiest Method: Use Vercel Web Interface

### Step 1: Push to GitHub

```bash
git init
git add .
git commit -m "Deploy to Vercel"
git remote add origin https://github.com/YOUR-USERNAME/food-ordering-app.git
git push -u origin main
```

### Step 2: Deploy on Vercel

1. Go to: https://vercel.com
2. Sign up with GitHub
3. Click "Add New..." → "Project"
4. Import your repository
5. Framework Preset: **Other**
6. Root Directory: **frontend**
7. Build Command: `npm run build`
8. Output Directory: `dist`
9. Click "Deploy"

### Step 3: Deploy Backend Separately

Use Railway for backend:
```bash
railway login
railway init
railway up
```

Then update Vercel environment variables with Railway backend URL.

---

## ⚠️ Important: Vercel Limitations

Vercel has limitations for full backend servers:
- 10 second timeout for serverless functions
- No WebSocket support on Hobby plan
- Better for static sites + API routes

**Recommendation:** Use Railway or Render for full-stack apps like yours.

---

## 🎯 Best Approach for Your App

Since your app has:
- Full Express server
- WebSocket support
- Real-time features

**I recommend:**

1. **Railway** (easiest, supports everything)
   ```bash
   railway login
   railway init
   railway up
   ```

2. **Render** (also great, free tier)
   - Push to GitHub
   - Deploy on render.com
   - Select Docker environment

Both support your full-stack app better than Vercel!

---

## 📋 Vercel vs Railway vs Render

| Feature | Vercel | Railway | Render |
|---------|--------|---------|--------|
| Full Backend | ⚠️ Limited | ✅ Yes | ✅ Yes |
| WebSocket | ❌ No | ✅ Yes | ✅ Yes |
| Docker | ❌ No | ✅ Yes | ✅ Yes |
| Setup Time | 2 min | 2 min | 5 min |
| Free Tier | ✅ Yes | ✅ $5 credit | ✅ Yes |

**For your app: Railway or Render is better!**

---

## 🚀 Quick Deploy Commands

### Vercel (Frontend Only):
```bash
npm install -g vercel
cd frontend
vercel
```

### Railway (Full App):
```bash
npm install -g @railway/cli
railway login
railway init
railway up
```

### Render (Full App):
- Push to GitHub
- Go to render.com
- Deploy with Docker

---

## 💡 My Recommendation

**Use Railway instead of Vercel for your app!**

It's just as easy but supports your full backend:

```bash
npm install -g @railway/cli
railway login
railway init
railway up
```

Done in 2 minutes with a public URL! 🎉
