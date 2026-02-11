# 🐳 Deploy with Docker - Complete Guide

## Step 1: Install Docker Desktop

### For Windows:

1. **Download Docker Desktop:**
   - Go to: https://www.docker.com/products/docker-desktop
   - Click "Download for Windows"
   - Run the installer (Docker Desktop Installer.exe)

2. **Install:**
   - Follow the installation wizard
   - Enable WSL 2 if prompted
   - Restart your computer when done

3. **Verify Installation:**
   ```bash
   docker --version
   ```
   Should show: `Docker version 24.x.x`

4. **Start Docker Desktop:**
   - Open Docker Desktop from Start Menu
   - Wait for it to start (whale icon in system tray)

---

## Step 2: Build Your Docker Image

Once Docker is installed and running:

```bash
# Build the image (takes 2-3 minutes first time)
docker build -t food-ordering-app .
```

This will:
- ✅ Install all dependencies
- ✅ Build the frontend
- ✅ Package everything into a container
- ✅ Create a production-ready image

---

## Step 3: Run Your Container

```bash
# Run the container
docker run -p 5000:5000 food-ordering-app
```

Your app is now running at: **http://localhost:5000**

---

## Step 4: Run in Background (Optional)

```bash
# Run in detached mode (background)
docker run -d -p 5000:5000 --name food-app food-ordering-app

# View logs
docker logs food-app

# Stop container
docker stop food-app

# Start again
docker start food-app

# Remove container
docker rm food-app
```

---

## 🌐 Deploy to Cloud with Docker

### Option A: Deploy to Railway with Docker

1. **Install Railway CLI:**
   ```bash
   npm install -g @railway/cli
   ```

2. **Login and Deploy:**
   ```bash
   railway login
   railway init
   railway up
   ```

### Option B: Deploy to Render with Docker

1. Push your code to GitHub
2. Go to render.com
3. New + → Web Service
4. Connect repository
5. Select "Docker" as environment
6. Deploy!

### Option C: Deploy to DigitalOcean

1. **Create Droplet:**
   - Go to digitalocean.com
   - Create → Droplets
   - Choose Ubuntu
   - Select $6/month plan

2. **SSH into server:**
   ```bash
   ssh root@your-server-ip
   ```

3. **Install Docker on server:**
   ```bash
   curl -fsSL https://get.docker.com -o get-docker.sh
   sh get-docker.sh
   ```

4. **Clone and deploy:**
   ```bash
   git clone https://github.com/YOUR-USERNAME/YOUR-REPO.git
   cd YOUR-REPO
   docker build -t food-ordering-app .
   docker run -d -p 80:5000 food-ordering-app
   ```

5. **Access at:** `http://your-server-ip`

### Option D: Deploy to AWS ECS

1. **Install AWS CLI**
2. **Push to ECR:**
   ```bash
   aws ecr create-repository --repository-name food-ordering-app
   docker tag food-ordering-app:latest YOUR-ECR-URL
   docker push YOUR-ECR-URL
   ```
3. **Create ECS service** from AWS Console

---

## 🔧 Docker Commands Cheat Sheet

```bash
# Build image
docker build -t food-ordering-app .

# Run container
docker run -p 5000:5000 food-ordering-app

# Run in background
docker run -d -p 5000:5000 --name food-app food-ordering-app

# List running containers
docker ps

# List all containers
docker ps -a

# View logs
docker logs food-app

# Stop container
docker stop food-app

# Start container
docker start food-app

# Remove container
docker rm food-app

# Remove image
docker rmi food-ordering-app

# View images
docker images

# Clean up everything
docker system prune -a
```

---

## 🎯 Quick Deploy Script

Save this as `docker-deploy.bat`:

```batch
@echo off
echo Building Docker image...
docker build -t food-ordering-app .

echo.
echo Starting container...
docker run -d -p 5000:5000 --name food-app food-ordering-app

echo.
echo ========================================
echo   App is running!
echo   Visit: http://localhost:5000
echo ========================================
echo.
echo To view logs: docker logs food-app
echo To stop: docker stop food-app
```

Then run: `docker-deploy.bat`

---

## 🐛 Troubleshooting

**"docker: command not found"**
- Docker Desktop not installed or not running
- Restart Docker Desktop
- Restart your terminal

**"Cannot connect to Docker daemon"**
- Start Docker Desktop
- Wait for it to fully start (whale icon)

**"Port 5000 already in use"**
- Stop other services on port 5000
- Or use different port: `docker run -p 8080:5000 food-ordering-app`

**"Build failed"**
- Check Dockerfile syntax
- Ensure all files are present
- Check Docker Desktop logs

**"Container exits immediately"**
- Check logs: `docker logs food-app`
- Verify server starts correctly

---

## ✅ Advantages of Docker Deployment

- ✅ Works the same everywhere
- ✅ Easy to scale
- ✅ Isolated environment
- ✅ Easy rollback
- ✅ Professional deployment method
- ✅ Works on any cloud provider

---

## 📊 Docker vs Other Methods

| Method | Ease | Speed | Cost | Scalability |
|--------|------|-------|------|-------------|
| Docker | ⭐⭐⭐ | ⚡⚡⚡ | Free | ⭐⭐⭐⭐⭐ |
| Railway | ⭐⭐⭐⭐⭐ | ⚡⚡⚡ | $5/mo | ⭐⭐⭐⭐ |
| Render | ⭐⭐⭐⭐ | ⚡⚡ | Free | ⭐⭐⭐ |

---

## 🎉 Next Steps

1. Install Docker Desktop
2. Build your image
3. Test locally
4. Deploy to cloud provider
5. Share your app!

**Need help?** Check Docker documentation: https://docs.docker.com
