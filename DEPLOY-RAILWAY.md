# Deploy to Railway (FREE & FAST)

## Why Railway?
- ✅ Easiest deployment (literally 2 clicks)
- ✅ Free $5 credit/month
- ✅ Auto-detects everything
- ✅ Faster than Render
- ✅ Better free tier

## Step 1: Push to GitHub

```bash
# Initialize git
git init
git add .
git commit -m "Food ordering platform"

# Push to GitHub (create repo first on github.com)
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
git branch -M main
git push -u origin main
```

## Step 2: Deploy on Railway

1. **Go to Railway**: https://railway.app
2. **Login with GitHub**
3. **Click "New Project"**
4. **Select "Deploy from GitHub repo"**
5. **Choose your repository**
6. **Click "Deploy Now"**

That's it! Railway automatically:
- Detects it's a Node.js app
- Runs `npm install`
- Runs `npm run build`
- Starts with `npm start`
- Assigns a public URL

## Step 3: Get Your URL

1. Click on your deployment
2. Go to "Settings" tab
3. Click "Generate Domain"
4. Your app is live at: `https://your-app.up.railway.app`

## ✅ What You Get

- ✅ $5 free credit/month (~500 hours)
- ✅ Automatic HTTPS
- ✅ Auto-deploy on push
- ✅ Environment variables
- ✅ Logs and metrics
- ✅ No sleep/cold starts

## 🔄 Update Your Site

Just push to GitHub:
```bash
git add .
git commit -m "Update"
git push
```

Railway auto-deploys in 1-2 minutes!

## 🎯 Pro Tips

- Railway is faster than Render
- No cold starts (unlike Render free tier)
- Better for production apps
- $5/month credit is usually enough for small apps

## 🐛 Troubleshooting

**Deployment failed?**
- Check "Deployments" tab for logs
- Verify package.json has correct scripts

**App not accessible?**
- Generate domain in Settings
- Check if deployment is "Active"

**Out of credits?**
- Add payment method (only charged if you exceed $5)
- Or wait for next month's credit
