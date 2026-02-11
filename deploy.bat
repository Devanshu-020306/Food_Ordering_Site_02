@echo off
echo 🚀 Food Ordering Platform - Deployment Script
echo ==============================================
echo.

where docker >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ Docker found
    set DOCKER_AVAILABLE=true
) else (
    echo ❌ Docker not found
    set DOCKER_AVAILABLE=false
)

echo.
echo Select deployment method:
echo 1) Docker (Local)
echo 2) Build for Production
echo 3) Install Dependencies Only
echo.
set /p choice="Enter choice [1-3]: "

if "%choice%"=="1" (
    if "%DOCKER_AVAILABLE%"=="true" (
        echo 🐳 Building Docker image...
        docker build -t food-ordering-app .
        echo 🚀 Starting container...
        docker run -p 5000:5000 -e NODE_ENV=production food-ordering-app
    ) else (
        echo ❌ Docker is not installed. Please install Docker first.
        exit /b 1
    )
) else if "%choice%"=="2" (
    echo 📦 Installing backend dependencies...
    cd backend
    call npm install
    echo 📦 Installing frontend dependencies...
    cd ..\frontend
    call npm install
    echo 🔨 Building frontend...
    call npm run build
    echo ✅ Build complete! Files are in frontend\dist
    echo To start the server: cd backend ^&^& set NODE_ENV=production ^&^& npm start
    cd ..
) else if "%choice%"=="3" (
    echo 📦 Installing all dependencies...
    cd backend
    call npm install
    cd ..\frontend
    call npm install
    cd ..
    echo ✅ Dependencies installed!
) else (
    echo ❌ Invalid choice
    exit /b 1
)
