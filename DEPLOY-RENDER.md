# Deploy to Render (FREE)

## Step 1: Prepare Your Code

Your code is already ready! Just need to push to GitHub.

## Step 2: Push to GitHub

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - Food ordering platform"

# Create repository on GitHub first, then:
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
git branch -M main
git push -u origin main
```

## Step 3: Deploy on Render

1. **Go to Render**: https://render.com
2. **Sign Up/Login** with your GitHub account
3. **Click "New +"** in the top right
4. **Select "Web Service"**
5. **Connect your GitHub repository**
6. **Configure the service:**

   ```
   Name: food-ordering-app
   Region: Choose closest to you
   Branch: main
   Root Directory: (leave empty)
   Runtime: Node
   Build Command: npm install && npm run build
   Start Command: npm start
   ```

7. **Environment Variables** (optional):
   ```
   NODE_ENV=production
   ```

8. **Click "Create Web Service"**

## Step 4: Wait for Deployment

- Render will install dependencies
- Build your frontend
- Start the server
- Takes 2-5 minutes

## Step 5: Access Your Site

Your app will be live at:
```
https://food-ordering-app.onrender.com
```
(or whatever name you chose)

## ✅ What You Get

- ✅ Free hosting
- ✅ Automatic HTTPS
- ✅ Auto-deploy on git push
- ✅ Custom domain support
- ✅ 750 hours/month free

## 🔄 Update Your Site

After initial deployment, just:
```bash
git add .
git commit -m "Update"
git push
```

Render automatically redeploys!

## 🐛 Troubleshooting

**Build fails?**
- Check build logs in Render dashboard
- Ensure Node.js version is 18+

**Site not loading?**
- Check "Logs" tab in Render
- Verify start command is `npm start`

**No restaurants showing?**
- Check browser console (F12)
- Verify API is responding: `https://your-app.onrender.com/api/restaurants`

## 💡 Tips

- Free tier sleeps after 15 min of inactivity
- First request after sleep takes 30-60 seconds
- Upgrade to paid plan ($7/month) for always-on
