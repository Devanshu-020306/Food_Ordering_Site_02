# 🐳 Docker Hub Deployment Guide

## What is Docker Hub?

Docker Hub is like GitHub but for Docker images. Once you push your image there, you can deploy it on ANY cloud platform.

---

## Step 1: Create Docker Hub Account (2 minutes)

1. **Go to:** https://hub.docker.com
2. **Click:** "Sign Up"
3. **Create account** (free)
4. **Verify email**
5. **Remember your username!**

---

## Step 2: Push Your Image (5 minutes)

### Option A: Use the Script (Easiest)

Just run: **`push-to-dockerhub.bat`**

It will:
- ✅ Ask for your Docker Hub username
- ✅ Login to Docker Hub
- ✅ Tag your image
- ✅ Push to Docker Hub
- ✅ Give you deployment instructions

### Option B: Manual Commands

```bash
# 1. Login (you'll be prompted for password)
docker login -u YOUR-USERNAME

# 2. Tag your image
docker tag food-ordering-app YOUR-USERNAME/food-ordering-app:latest

# 3. Push to Docker Hub
docker push YOUR-USERNAME/food-ordering-app:latest
```

---

## Step 3: Verify Upload

1. Go to: https://hub.docker.com/r/YOUR-USERNAME/food-ordering-app
2. You should see your image!
3. It's now public and ready to deploy anywhere

---

## Step 4: Deploy to Cloud

Now you can deploy on ANY platform!

### Option 1: Railway

```bash
# Install CLI
npm install -g @railway/cli

# Login
railway login

# Create new project
railway init

# Deploy from Docker Hub
railway up --image YOUR-USERNAME/food-ordering-app
```

### Option 2: Render

1. Go to https://render.com
2. New + → Web Service
3. Select "Deploy an existing image from a registry"
4. Image URL: `YOUR-USERNAME/food-ordering-app`
5. Click "Create Web Service"

### Option 3: Fly.io (Free tier)

```bash
# Install flyctl
powershell -Command "iwr https://fly.io/install.ps1 -useb | iex"

# Login
fly auth login

# Deploy
fly launch --image YOUR-USERNAME/food-ordering-app
```

### Option 4: DigitalOcean ($6/month)

```bash
# 1. Create a Droplet (Ubuntu)
# 2. SSH into it
ssh root@YOUR-DROPLET-IP

# 3. Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# 4. Pull and run your image
docker pull YOUR-USERNAME/food-ordering-app
docker run -d -p 80:5000 --restart unless-stopped YOUR-USERNAME/food-ordering-app

# 5. Access at: http://YOUR-DROPLET-IP
```

### Option 5: AWS ECS

1. Go to AWS ECS Console
2. Create new Task Definition
3. Container image: `YOUR-USERNAME/food-ordering-app`
4. Port: 5000
5. Create Service
6. Deploy!

### Option 6: Azure Container Instances

```bash
az container create \
  --resource-group myResourceGroup \
  --name food-ordering-app \
  --image YOUR-USERNAME/food-ordering-app \
  --dns-name-label food-ordering \
  --ports 5000
```

### Option 7: Google Cloud Run

```bash
gcloud run deploy food-ordering-app \
  --image YOUR-USERNAME/food-ordering-app \
  --platform managed \
  --port 5000 \
  --allow-unauthenticated
```

---

## 🎯 Recommended Platforms

| Platform | Cost | Ease | Speed | Free Tier |
|----------|------|------|-------|-----------|
| Fly.io | Free | ⭐⭐⭐⭐⭐ | ⚡⚡⚡ | Yes |
| Railway | $5 credit | ⭐⭐⭐⭐⭐ | ⚡⚡⚡ | Yes |
| Render | Free | ⭐⭐⭐⭐ | ⚡⚡ | Yes |
| DigitalOcean | $6/mo | ⭐⭐⭐ | ⚡⚡⚡ | No |
| AWS/Azure/GCP | Varies | ⭐⭐ | ⚡⚡⚡ | Limited |

---

## 📋 Complete Workflow

```bash
# 1. Build image (already done)
docker build -t food-ordering-app .

# 2. Test locally (already done)
docker run -p 5000:5000 food-ordering-app

# 3. Login to Docker Hub
docker login

# 4. Tag image
docker tag food-ordering-app YOUR-USERNAME/food-ordering-app

# 5. Push to Docker Hub
docker push YOUR-USERNAME/food-ordering-app

# 6. Deploy on any platform
# Use: YOUR-USERNAME/food-ordering-app
```

---

## 🔄 Update Your App

When you make changes:

```bash
# 1. Rebuild
docker build -t food-ordering-app .

# 2. Tag with version
docker tag food-ordering-app YOUR-USERNAME/food-ordering-app:v2

# 3. Push
docker push YOUR-USERNAME/food-ordering-app:v2

# 4. Update deployment
# Most platforms auto-detect new versions
```

---

## 💡 Pro Tips

**Use tags for versions:**
```bash
docker tag food-ordering-app YOUR-USERNAME/food-ordering-app:v1.0.0
docker push YOUR-USERNAME/food-ordering-app:v1.0.0
```

**Keep latest tag updated:**
```bash
docker tag food-ordering-app YOUR-USERNAME/food-ordering-app:latest
docker push YOUR-USERNAME/food-ordering-app:latest
```

**Make repository private:**
- Go to Docker Hub
- Repository Settings
- Change visibility to Private

---

## 🐛 Troubleshooting

**"unauthorized: authentication required"**
- Run: `docker login`
- Enter correct username and password

**"denied: requested access to the resource is denied"**
- Check username spelling
- Ensure you're logged in
- Try: `docker logout` then `docker login`

**Push is slow:**
- Normal for first push (200MB+)
- Subsequent pushes are faster (only changes)

**"tag does not exist"**
- Run tag command first
- Check image name: `docker images`

---

## ✅ After Pushing

Your image is now:
- ✅ Public on Docker Hub
- ✅ Accessible from anywhere
- ✅ Ready to deploy on any platform
- ✅ Versioned and tracked

**Image URL:** `YOUR-USERNAME/food-ordering-app`

**Anyone can now run:**
```bash
docker pull YOUR-USERNAME/food-ordering-app
docker run -p 5000:5000 YOUR-USERNAME/food-ordering-app
```

---

## 🚀 Quick Deploy Commands

**Fly.io (Recommended - Free):**
```bash
fly launch --image YOUR-USERNAME/food-ordering-app
```

**Railway:**
```bash
railway up --image YOUR-USERNAME/food-ordering-app
```

**DigitalOcean:**
```bash
docker pull YOUR-USERNAME/food-ordering-app
docker run -d -p 80:5000 YOUR-USERNAME/food-ordering-app
```

---

## 🎉 Success!

Once pushed to Docker Hub, you can:
- Deploy on any cloud platform
- Share with others
- Version your releases
- Roll back if needed
- Scale easily

**Ready to push?** Run: `push-to-dockerhub.bat`
