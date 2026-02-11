@echo off
echo ========================================
echo   Push to Docker Hub
echo   Username: devanshut02
echo ========================================
echo.

echo Step 1: Login to Docker Hub
echo ========================================
echo.
echo You will be prompted for your Docker Hub password.
echo.
echo If you don't remember your password:
echo   1. Go to: https://hub.docker.com
echo   2. Click "Forgot password?"
echo   3. Reset your password
echo.
echo Or use a Personal Access Token:
echo   1. Go to: https://app.docker.com/settings
echo   2. Create new token
echo   3. Use token as password
echo.
pause
echo.

docker login -u devanshut02

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Login failed!
    echo.
    echo Try these solutions:
    echo 1. Check your password
    echo 2. Use Personal Access Token from https://app.docker.com/settings
    echo 3. Reset password at https://hub.docker.com
    echo.
    pause
    exit /b 1
)

echo.
echo ✅ Login successful!
echo.

echo Step 2: Push to Docker Hub
echo ========================================
echo.
echo Pushing image: devanshut02/food-ordering-app:latest
echo This will take 2-3 minutes...
echo.

docker push devanshut02/food-ordering-app:latest

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Push failed!
    echo Check the error message above.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   ✅ SUCCESS!
echo ========================================
echo.
echo Your image is now on Docker Hub!
echo.
echo View at: https://hub.docker.com/r/devanshut02/food-ordering-app
echo Pull with: docker pull devanshut02/food-ordering-app
echo.
echo ========================================
echo   Deploy Now!
echo ========================================
echo.
echo Choose a platform:
echo.
echo 1. Fly.io (FREE):
echo    fly launch --image devanshut02/food-ordering-app
echo.
echo 2. Railway:
echo    railway up --image devanshut02/food-ordering-app
echo.
echo 3. Render:
echo    - Go to render.com
echo    - New Web Service
echo    - Image: devanshut02/food-ordering-app
echo.
echo 4. DigitalOcean:
echo    docker pull devanshut02/food-ordering-app
echo    docker run -d -p 80:5000 devanshut02/food-ordering-app
echo.
echo ========================================
echo.
pause
