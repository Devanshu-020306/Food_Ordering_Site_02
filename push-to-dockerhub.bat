@echo off
echo ========================================
echo   Push to Docker Hub
echo   Food Ordering Platform
echo ========================================
echo.

echo Step 1: Docker Hub Account
echo ========================================
echo.
echo Do you have a Docker Hub account?
echo.
echo If NO:
echo   1. Go to: https://hub.docker.com
echo   2. Click "Sign Up"
echo   3. Create a free account
echo   4. Come back here
echo.
set /p username="Enter your Docker Hub username: "

echo.
echo Step 2: Login to Docker Hub
echo ========================================
echo.
echo You will be prompted for your password...
echo.
docker login -u %username%

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Login failed!
    echo Please check your username and password.
    pause
    exit /b 1
)

echo.
echo ✅ Login successful!
echo.

echo Step 3: Tag your image
echo ========================================
echo.
docker tag food-ordering-app %username%/food-ordering-app:latest

echo ✅ Image tagged as: %username%/food-ordering-app:latest
echo.

echo Step 4: Push to Docker Hub
echo ========================================
echo.
echo This may take 2-3 minutes...
echo.
docker push %username%/food-ordering-app:latest

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Push failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo   ✅ SUCCESS!
echo ========================================
echo.
echo Your image is now public on Docker Hub!
echo.
echo Image URL: https://hub.docker.com/r/%username%/food-ordering-app
echo Docker Pull: docker pull %username%/food-ordering-app
echo.
echo ========================================
echo   Deploy Anywhere
echo ========================================
echo.
echo You can now deploy on:
echo.
echo 1. Railway:
echo    railway up
echo.
echo 2. Render:
echo    - Go to render.com
echo    - New Web Service
echo    - Docker environment
echo    - Image: %username%/food-ordering-app
echo.
echo 3. DigitalOcean ($6/month):
echo    ssh root@your-server
echo    docker pull %username%/food-ordering-app
echo    docker run -d -p 80:5000 %username%/food-ordering-app
echo.
echo 4. AWS ECS / Azure / Google Cloud
echo    Use image: %username%/food-ordering-app
echo.
echo 5. Fly.io:
echo    fly launch --image %username%/food-ordering-app
echo.
echo ========================================
echo.
pause
