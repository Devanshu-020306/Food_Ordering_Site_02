@echo off
echo ========================================
echo   Deploy to Cloud - Step by Step
echo ========================================
echo.

echo Choose your deployment platform:
echo.
echo 1. Railway (Easiest - Free $5/month credit)
echo 2. Render (Free tier available)
echo 3. Docker Hub (Push image for any platform)
echo 4. DigitalOcean (Requires account - $6/month)
echo.
set /p choice="Enter choice [1-4]: "

if "%choice%"=="1" (
    echo.
    echo ========================================
    echo   Deploying to Railway
    echo ========================================
    echo.
    echo Step 1: Install Railway CLI
    call npm install -g @railway/cli
    
    echo.
    echo Step 2: Login to Railway
    echo This will open your browser...
    call railway login
    
    echo.
    echo Step 3: Initialize project
    call railway init
    
    echo.
    echo Step 4: Deploy
    call railway up
    
    echo.
    echo ✅ Deployment complete!
    echo Check Railway dashboard for your URL
    
) else if "%choice%"=="2" (
    echo.
    echo ========================================
    echo   Deploy to Render
    echo ========================================
    echo.
    echo Steps to deploy on Render:
    echo.
    echo 1. Push your code to GitHub:
    echo    git init
    echo    git add .
    echo    git commit -m "Deploy to Render"
    echo    git remote add origin YOUR-GITHUB-URL
    echo    git push -u origin main
    echo.
    echo 2. Go to: https://render.com
    echo 3. Sign up/Login with GitHub
    echo 4. New + ^> Web Service
    echo 5. Connect your repository
    echo 6. Select "Docker" as environment
    echo 7. Click "Create Web Service"
    echo.
    echo Your app will be live in 3-5 minutes!
    
) else if "%choice%"=="3" (
    echo.
    echo ========================================
    echo   Push to Docker Hub
    echo ========================================
    echo.
    set /p username="Enter your Docker Hub username: "
    
    echo.
    echo Step 1: Login to Docker Hub
    call docker login
    
    echo.
    echo Step 2: Tag your image
    call docker tag food-ordering-app %username%/food-ordering-app
    
    echo.
    echo Step 3: Push to Docker Hub
    call docker push %username%/food-ordering-app
    
    echo.
    echo ✅ Image pushed successfully!
    echo.
    echo Your image: %username%/food-ordering-app
    echo.
    echo Now you can deploy it on:
    echo - Railway: railway up
    echo - Render: Use Docker environment
    echo - DigitalOcean: docker pull %username%/food-ordering-app
    echo - AWS ECS, Azure, Google Cloud, etc.
    
) else if "%choice%"=="4" (
    echo.
    echo ========================================
    echo   Deploy to DigitalOcean
    echo ========================================
    echo.
    echo Steps:
    echo.
    echo 1. Create account at: https://digitalocean.com
    echo 2. Create a Droplet (Ubuntu, $6/month)
    echo 3. SSH into your droplet
    echo 4. Install Docker:
    echo    curl -fsSL https://get.docker.com -o get-docker.sh
    echo    sh get-docker.sh
    echo.
    echo 5. Pull and run your image:
    echo    docker pull YOUR-USERNAME/food-ordering-app
    echo    docker run -d -p 80:5000 --restart unless-stopped food-ordering-app
    echo.
    echo 6. Access at: http://YOUR-DROPLET-IP
    
) else (
    echo Invalid choice!
)

echo.
pause
