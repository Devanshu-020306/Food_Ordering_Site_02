@echo off
echo ========================================
echo   Deploy to Vercel
echo ========================================
echo.

echo IMPORTANT: Vercel is best for frontend apps.
echo Your app has a full backend server, so we have options:
echo.
echo 1. Deploy FULL APP on Railway (Recommended - Easiest)
echo 2. Deploy FRONTEND on Vercel + BACKEND on Railway
echo 3. Deploy FULL APP on Render
echo.
set /p choice="Enter choice [1-3]: "

if "%choice%"=="1" (
    echo.
    echo ========================================
    echo   Deploying to Railway
    echo ========================================
    echo.
    echo Installing Railway CLI...
    call npm install -g @railway/cli
    
    echo.
    echo Logging in to Railway...
    echo This will open your browser...
    call railway login
    
    echo.
    echo Initializing project...
    call railway init
    
    echo.
    echo Deploying...
    call railway up
    
    echo.
    echo ✅ Done! Check Railway dashboard for your URL
    
) else if "%choice%"=="2" (
    echo.
    echo ========================================
    echo   Deploy Backend on Railway
    echo ========================================
    echo.
    call npm install -g @railway/cli
    call railway login
    call railway init
    call railway up
    
    echo.
    echo ✅ Backend deployed!
    echo.
    echo Copy your Railway URL, then:
    echo.
    echo ========================================
    echo   Deploy Frontend on Vercel
    echo ========================================
    echo.
    call npm install -g vercel
    cd frontend
    call vercel
    
    echo.
    echo After deployment:
    echo 1. Go to Vercel dashboard
    echo 2. Add environment variable:
    echo    VITE_API_URL = YOUR_RAILWAY_URL/api
    echo 3. Redeploy
    
) else if "%choice%"=="3" (
    echo.
    echo ========================================
    echo   Deploy to Render
    echo ========================================
    echo.
    echo Steps:
    echo 1. Push code to GitHub
    echo 2. Go to: https://render.com
    echo 3. Sign up with GitHub
    echo 4. New + ^> Web Service
    echo 5. Connect repository
    echo 6. Environment: Docker
    echo 7. Deploy!
    echo.
    echo Initialize Git:
    git init
    git add .
    git commit -m "Deploy to Render"
    
    echo.
    echo Now:
    echo 1. Create repo on GitHub
    echo 2. Push code
    echo 3. Deploy on render.com
    
) else (
    echo Invalid choice!
)

echo.
pause
