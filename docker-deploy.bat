@echo off
echo ========================================
echo   Docker Deployment Script
echo   Food Ordering Platform
echo ========================================
echo.

REM Check if Docker is installed
where docker >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Docker is not installed!
    echo.
    echo Please install Docker Desktop:
    echo 1. Go to: https://www.docker.com/products/docker-desktop
    echo 2. Download and install Docker Desktop for Windows
    echo 3. Restart your computer
    echo 4. Start Docker Desktop
    echo 5. Run this script again
    echo.
    pause
    exit /b 1
)

echo ✅ Docker is installed
echo.

REM Check if Docker is running
docker ps >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Docker is not running!
    echo.
    echo Please start Docker Desktop and try again.
    echo.
    pause
    exit /b 1
)

echo ✅ Docker is running
echo.

echo [1/3] Building Docker image...
echo This may take 2-3 minutes on first run...
echo.
docker build -t food-ordering-app .
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Build failed! Check the error messages above.
    pause
    exit /b 1
)

echo.
echo ✅ Build successful!
echo.

echo [2/3] Stopping any existing container...
docker stop food-app >nul 2>nul
docker rm food-app >nul 2>nul

echo [3/3] Starting container...
docker run -d -p 5000:5000 --name food-app food-ordering-app
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to start container!
    pause
    exit /b 1
)

echo.
echo ========================================
echo   ✅ SUCCESS! Your app is running!
echo ========================================
echo.
echo 📍 URL: http://localhost:5000
echo.
echo Useful commands:
echo   View logs:    docker logs food-app
echo   Stop app:     docker stop food-app
echo   Start app:    docker start food-app
echo   Restart app:  docker restart food-app
echo.
echo Opening browser...
timeout /t 2 >nul
start http://localhost:5000
echo.
pause
