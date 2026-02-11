# Quick Start Guide

## Fix "No Restaurants" Issue

If you're seeing no restaurants on the deployed site, follow these steps:

### 1. Test Your Setup Locally

```bash
# Install dependencies
npm run install-all

# Test deployment setup
npm run test-deployment

# Start backend (in one terminal)
cd backend
npm start

# Start frontend (in another terminal)
cd frontend
npm run dev
```

Visit http://localhost:3000 - you should see 6 restaurants.

### 2. Check Your Deployment

**If using Docker:**
```bash
# Make sure data files are included
docker build -t food-ordering-app .
docker run -p 5000:5000 -e NODE_ENV=production food-ordering-app
```

Visit http://localhost:5000

**If using separate frontend/backend hosting:**

1. **Backend (Railway/Render/Heroku):**
   - Ensure `backend/data/` folder is deployed
   - Check logs for errors
   - Test API: `https://your-backend.com/api/restaurants`

2. **Frontend (Vercel/Netlify):**
   - Set environment variable: `VITE_API_URL=https://your-backend.com/api`
   - Rebuild and redeploy
   - Check browser console for errors

### 3. Common Issues

**Issue: API returns 404**
- Backend not running or wrong URL
- Check `VITE_API_URL` in frontend environment variables

**Issue: CORS error**
- Update `FRONTEND_URL` in backend environment variables
- Restart backend server

**Issue: Empty response**
- Data files not included in deployment
- Check backend logs for file read errors

### 4. Verify Backend API

Test your backend directly:

```bash
# Test restaurants endpoint
curl https://your-backend-url.com/api/restaurants

# Should return JSON with 6 restaurants
```

### 5. Environment Variables Checklist

**Backend (.env or platform settings):**
```
NODE_ENV=production
PORT=5000
FRONTEND_URL=https://your-frontend-url.com
```

**Frontend (.env.production or platform settings):**
```
VITE_API_URL=https://your-backend-url.com/api
VITE_SOCKET_URL=https://your-backend-url.com
```

## Need Help?

1. Check browser console (F12) for errors
2. Check backend logs on your hosting platform
3. Verify data files exist in `backend/data/`
4. Test API endpoints directly with curl or Postman
