# 🐳 Docker Deployment - Quick Start

## You Need Docker First!

Docker is not installed on your system. Here's how to get started:

---

## Step 1: Install Docker Desktop (10 minutes)

### Download and Install:

1. **Go to:** https://www.docker.com/products/docker-desktop
2. **Click:** "Download for Windows"
3. **Run:** The installer file
4. **Follow:** Installation wizard
5. **Restart:** Your computer when prompted

### After Installation:

1. **Open:** Docker Desktop from Start Menu
2. **Wait:** For Docker to start (whale icon in system tray turns steady)
3. **Verify:** Open Command Prompt and run:
   ```bash
   docker --version
   ```
   Should show: `Docker version 24.x.x`

---

## Step 2: Deploy Your App (2 minutes)

Once Docker is installed and running:

### Option A: Use the Deploy Script (Easiest)

Just double-click: **`docker-deploy.bat`**

The script will:
- ✅ Check if Docker is installed
- ✅ Build your app image
- ✅ Start the container
- ✅ Open your browser automatically

### Option B: Manual Commands

```bash
# Build the image
docker build -t food-ordering-app .

# Run the container
docker run -d -p 5000:5000 --name food-app food-ordering-app

# Open browser to http://localhost:5000
```

---

## Step 3: Access Your App

Visit: **http://localhost:5000**

You should see:
- ✅ 6 restaurants on homepage
- ✅ Working menus
- ✅ Shopping cart
- ✅ All features working

---

## 🎯 Quick Commands

```bash
# View logs
docker logs food-app

# Stop the app
docker stop food-app

# Start the app
docker start food-app

# Restart the app
docker restart food-app

# Remove the container
docker stop food-app
docker rm food-app
```

---

## 🌐 Deploy to Cloud (After Testing Locally)

Once your app works locally with Docker, you can deploy to:

### 1. Railway (Easiest)
```bash
npm install -g @railway/cli
railway login
railway init
railway up
```

### 2. DigitalOcean ($6/month)
- Create a Droplet
- Install Docker on it
- Run your container

### 3. AWS/Azure/Google Cloud
- Push image to container registry
- Deploy to container service

---

## 📋 Complete Workflow

```bash
# 1. Install Docker Desktop (one-time)
# Download from docker.com

# 2. Build your app
docker build -t food-ordering-app .

# 3. Run locally
docker run -d -p 5000:5000 --name food-app food-ordering-app

# 4. Test at http://localhost:5000

# 5. Deploy to cloud (optional)
# Use Railway, DigitalOcean, AWS, etc.
```

---

## ❓ Why Docker?

- ✅ **Consistent:** Works the same everywhere
- ✅ **Isolated:** Doesn't affect your system
- ✅ **Professional:** Industry standard
- ✅ **Portable:** Deploy anywhere
- ✅ **Scalable:** Easy to scale up

---

## 🐛 Common Issues

**"Docker command not found"**
- Docker not installed → Install Docker Desktop
- Docker not running → Start Docker Desktop

**"Port 5000 already in use"**
- Stop other apps using port 5000
- Or use: `docker run -p 8080:5000 food-ordering-app`

**"Cannot connect to Docker daemon"**
- Start Docker Desktop
- Wait for it to fully start

**"Build takes too long"**
- Normal for first build (2-3 minutes)
- Subsequent builds are faster

---

## 🎉 What You Get

After deployment:
- ✅ Production-ready app
- ✅ All dependencies included
- ✅ Easy to update
- ✅ Easy to scale
- ✅ Professional deployment

---

## 📞 Next Steps

1. **Install Docker Desktop** (if not installed)
2. **Run `docker-deploy.bat`** (easiest way)
3. **Test at http://localhost:5000**
4. **Deploy to cloud** (optional)

---

## 💡 Alternative: No Docker?

If you don't want to install Docker, use these instead:

**Option 1: Railway (No Docker needed)**
- Push to GitHub
- Deploy on railway.app
- See: `DEPLOY-RAILWAY.md`

**Option 2: Render (No Docker needed)**
- Push to GitHub
- Deploy on render.com
- See: `DEPLOY-RENDER.md`

Both are easier if you don't want to install Docker!

---

**Ready to start?**
1. Install Docker Desktop: https://www.docker.com/products/docker-desktop
2. Run: `docker-deploy.bat`
3. Visit: http://localhost:5000
