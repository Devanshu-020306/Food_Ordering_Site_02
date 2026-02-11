@echo off
echo ========================================
echo   Food Ordering Platform - Deploy Now
echo ========================================
echo.

echo [1/4] Installing dependencies...
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo [2/4] Building frontend...
cd frontend
call npm install
call npm run build
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to build frontend
    cd ..
    pause
    exit /b 1
)
cd ..

echo.
echo [3/4] Testing setup...
call node test-deployment.js

echo.
echo [4/4] Starting production server...
echo.
echo ========================================
echo   Server will start at:
echo   http://localhost:5000
echo ========================================
echo.
echo Press Ctrl+C to stop the server
echo.

call npm start
