@echo off
echo ========================================
echo   Deploy WITHOUT Docker Hub
echo   Using Render.com
echo ========================================
echo.

echo This method skips Docker Hub entirely!
echo Render will build your Docker image directly from GitHub.
echo.
pause

echo Step 1: Initialize Git
echo ========================================
git init
if %ERRORLEVEL% NEQ 0 (
    echo Git already initialized
)

echo.
echo Step 2: Add all files
echo ========================================
git add .

echo.
echo Step 3: Commit
echo ========================================
git commit -m "Deploy food ordering app"

echo.
echo ========================================
echo   Next Steps:
echo ========================================
echo.
echo 1. Create a repository on GitHub:
echo    - Go to: https://github.com/new
echo    - Name: food-ordering-app
echo    - Click "Create repository"
echo.
echo 2. Push to GitHub:
echo    git remote add origin https://github.com/YOUR-USERNAME/food-ordering-app.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 3. Deploy on Render:
echo    - Go to: https://render.com
echo    - Sign up with GitHub
echo    - New + ^> Web Service
echo    - Connect your repository
echo    - Environment: Docker
echo    - Click "Create Web Service"
echo.
echo 4. Wait 3-5 minutes
echo.
echo 5. Your app will be live!
echo.
echo ========================================
echo.
pause
