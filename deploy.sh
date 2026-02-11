#!/bin/bash

echo "🚀 Food Ordering Platform - Deployment Script"
echo "=============================================="
echo ""

# Check if Docker is installed
if command -v docker &> /dev/null; then
    echo "✅ Docker found"
    DOCKER_AVAILABLE=true
else
    echo "❌ Docker not found"
    DOCKER_AVAILABLE=false
fi

echo ""
echo "Select deployment method:"
echo "1) Docker (Local)"
echo "2) Build for Production"
echo "3) Install Dependencies Only"
echo ""
read -p "Enter choice [1-3]: " choice

case $choice in
    1)
        if [ "$DOCKER_AVAILABLE" = true ]; then
            echo "🐳 Building Docker image..."
            docker build -t food-ordering-app .
            echo "🚀 Starting container..."
            docker run -p 5000:5000 -e NODE_ENV=production food-ordering-app
        else
            echo "❌ Docker is not installed. Please install Docker first."
            exit 1
        fi
        ;;
    2)
        echo "📦 Installing backend dependencies..."
        cd backend && npm install
        echo "📦 Installing frontend dependencies..."
        cd ../frontend && npm install
        echo "🔨 Building frontend..."
        npm run build
        echo "✅ Build complete! Files are in frontend/dist"
        echo "To start the server: cd backend && NODE_ENV=production npm start"
        ;;
    3)
        echo "📦 Installing all dependencies..."
        cd backend && npm install
        cd ../frontend && npm install
        echo "✅ Dependencies installed!"
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac
