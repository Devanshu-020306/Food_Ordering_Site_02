# Deployment Guide

This guide covers multiple deployment options for the Food Ordering Platform.

## Quick Deploy Options

### Option 1: Docker (Recommended for Production)

**Prerequisites:** Docker installed

```bash
# Build the Docker image
docker build -t food-ordering-app .

# Run the container
docker run -p 5000:5000 -e NODE_ENV=production food-ordering-app
```

Access at: http://localhost:5000

**Deploy to Docker Hub:**
```bash
docker tag food-ordering-app yourusername/food-ordering-app
docker push yourusername/food-ordering-app
```

### Option 2: Render (Free Tier Available)

1. Push code to GitHub
2. Go to [render.com](https://render.com)
3. Click "New" → "Blueprint"
4. Connect your repository
5. Render will auto-detect `render.yaml` and deploy both services

**Manual Setup:**
- Create Web Service for backend
  - Build Command: `cd backend && npm install`
  - Start Command: `cd backend && npm start`
- Create Static Site for frontend
  - Build Command: `cd frontend && npm install && npm run build`
  - Publish Directory: `frontend/dist`

### Option 3: Vercel (Frontend) + Railway (Backend)

**Frontend on Vercel:**
```bash
cd frontend
npm install -g vercel
vercel
```

**Backend on Railway:**
1. Go to [railway.app](https://railway.app)
2. New Project → Deploy from GitHub
3. Select your repository
4. Set root directory to `backend`
5. Add environment variable: `NODE_ENV=production`

### Option 4: Netlify (Frontend) + Heroku (Backend)

**Frontend on Netlify:**
```bash
cd frontend
npm install -g netlify-cli
netlify deploy --prod
```

**Backend on Heroku:**
```bash
# Install Heroku CLI first
cd backend
heroku create your-app-name
git subtree push --prefix backend heroku main
```

### Option 5: AWS (Full Stack)

**Using AWS Elastic Beanstalk:**
```bash
# Install EB CLI
pip install awsebcli

# Initialize
eb init -p node.js food-ordering-app

# Create environment
eb create production

# Deploy
eb deploy
```

## Environment Variables

Set these in your deployment platform:

**Backend:**
```env
NODE_ENV=production
PORT=5000
FRONTEND_URL=https://your-frontend-url.com
```

**Frontend:**
```env
VITE_API_URL=https://your-backend-url.com/api
VITE_SOCKET_URL=https://your-backend-url.com
```

**Important:** 
- For same-domain deployments (Docker, single server), use `VITE_API_URL=/api`
- For separate deployments (Vercel + Railway), use full backend URL
- Copy `.env.example` files and update with your URLs

## Build Commands

**Frontend:**
```bash
cd frontend
npm install
npm run build
```

**Backend:**
```bash
cd backend
npm install
npm start
```

## Post-Deployment Checklist

- [ ] Test all API endpoints
- [ ] Verify WebSocket connections work
- [ ] Check CORS settings
- [ ] Test order placement flow
- [ ] Verify real-time updates
- [ ] Check mobile responsiveness
- [ ] Monitor server logs

## Troubleshooting

**No Restaurants Showing:**
1. Check if backend is running and accessible
2. Verify API URL in frontend environment variables:
   - For production: Set `VITE_API_URL` to your backend URL
   - Check browser console for CORS or network errors
3. Test backend directly: `curl http://your-backend-url/api/restaurants`
4. Ensure data files are included in deployment (backend/data/*.json)

**CORS Issues:**
Update `backend/server.js` with your frontend URL in the CORS configuration.

**WebSocket Connection Failed:**
Ensure your hosting platform supports WebSocket connections (most do).

**Build Failures:**
- Check Node.js version (requires 18+)
- Verify all dependencies are in package.json
- Check build logs for specific errors

## Monitoring

Add monitoring services:
- **Uptime:** UptimeRobot, Pingdom
- **Errors:** Sentry
- **Analytics:** Google Analytics, Plausible

## Scaling

For high traffic:
1. Use a CDN for static assets (Cloudflare, AWS CloudFront)
2. Add Redis for session management
3. Use a managed database (MongoDB Atlas, PostgreSQL)
4. Implement load balancing
5. Add caching layers

## Cost Estimates

- **Free Tier:** Render, Vercel, Netlify (limited resources)
- **Low Traffic:** $5-15/month (Railway, DigitalOcean)
- **Medium Traffic:** $25-50/month (AWS, Heroku)
- **High Traffic:** $100+/month (dedicated servers, CDN)
