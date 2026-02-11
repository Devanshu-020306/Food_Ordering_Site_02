# 🚀 Food Ordering Platform - Quick Start

## ✅ Your App is Ready!

The production server is currently running at: **http://localhost:5000**

### What's Working:
- ✅ Backend API with 6 restaurants
- ✅ Frontend built and ready
- ✅ All data loaded correctly
- ✅ WebSocket support for real-time updates

---

## 🎯 Quick Commands

### Development Mode (Frontend + Backend separate)
```bash
# Terminal 1 - Backend
cd backend
npm start

# Terminal 2 - Frontend  
cd frontend
npm run dev
```
Visit: http://localhost:3000

### Production Mode (All-in-one)
```bash
npm start
```
Visit: http://localhost:5000

---

## 🌐 Deploy to Production

### Option 1: Docker (Recommended - Easiest)

```bash
# Build and run
docker build -t food-ordering-app .
docker run -p 5000:5000 food-ordering-app
```

Then visit: http://localhost:5000

**Deploy to cloud:**
- Push image to Docker Hub
- Deploy on Railway, Render, or any Docker host

### Option 2: Render (Free Tier)

1. Push code to GitHub
2. Go to [render.com](https://render.com)
3. Create new "Web Service"
4. Connect your repository
5. Settings:
   - Build Command: `npm install && npm run build`
   - Start Command: `npm start`
   - Environment: `NODE_ENV=production`

### Option 3: Railway

1. Go to [railway.app](https://railway.app)
2. New Project → Deploy from GitHub
3. Select your repository
4. Railway auto-detects and deploys
5. Get your public URL

### Option 4: Heroku

```bash
# Install Heroku CLI, then:
heroku create your-app-name
git push heroku main
heroku open
```

### Option 5: DigitalOcean/AWS/Azure

1. Create a VM/Droplet
2. Install Node.js 18+
3. Clone your repository
4. Run:
```bash
npm install
npm run build
npm start
```

---

## 📋 Pre-Deployment Checklist

- [x] Backend data files exist (restaurants.json, menu.json)
- [x] Frontend builds successfully
- [x] Production server works locally
- [x] API endpoints return data
- [ ] Choose deployment platform
- [ ] Set environment variables (if needed)
- [ ] Test deployed site

---

## 🔧 Environment Variables (Optional)

Only needed for advanced configurations:

```env
NODE_ENV=production
PORT=5000
```

---

## 🧪 Test Your Deployment

After deploying, test these URLs:

1. **Homepage**: `https://your-app.com/`
2. **API Test**: `https://your-app.com/api/restaurants`
3. **Menu Test**: `https://your-app.com/api/menu/1`

You should see:
- 6 restaurants on the homepage
- JSON data from API endpoints

---

## 🐛 Troubleshooting

**Problem: No restaurants showing**
- Check browser console (F12) for errors
- Test API: `curl https://your-app.com/api/restaurants`
- Verify data files are deployed

**Problem: Build fails**
- Ensure Node.js 18+ is installed
- Run `npm install` in root directory
- Check build logs for specific errors

**Problem: Port already in use**
- Change PORT in environment variables
- Or stop other services using port 5000

---

## 📞 Support

- Check `DEPLOYMENT.md` for detailed deployment guides
- Check `QUICKSTART.md` for troubleshooting
- Test locally first: `npm start`

---

## 🎉 Next Steps

1. **Test locally**: Visit http://localhost:5000
2. **Choose deployment platform** from options above
3. **Deploy and share** your food ordering site!

Your app includes:
- 6 restaurants (Pizza, Burgers, Sushi, Tacos, Indian cuisine)
- 28 menu items with images
- Shopping cart functionality
- WhatsApp ordering integration
- Real-time order tracking
- Analytics dashboard
- AI-powered recommendations
