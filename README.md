# Food Ordering Site

A full-stack food ordering platform with React frontend, Node.js backend, and ML recommendations.

## 🚀 Quick Start

**Production Mode (Recommended):**
```bash
npm install
npm run build
npm start
```
Visit: http://localhost:5000

**Development Mode:**
```bash
# Terminal 1
cd backend && npm install && npm start

# Terminal 2  
cd frontend && npm install && npm run dev
```
Visit: http://localhost:3000

## 📖 Documentation

- **[START-HERE.md](START-HERE.md)** - Quick start guide and deployment options
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Detailed deployment instructions
- **[QUICKSTART.md](QUICKSTART.md)** - Troubleshooting guide

## ✨ Features

- 🍕 Browse 6 restaurants with different cuisines
- 🛒 Shopping cart with real-time updates
- 📱 WhatsApp ordering integration
- 📊 Analytics dashboard
- 🤖 AI-powered recommendations
- ⚡ Real-time order tracking with WebSocket
- 📱 Responsive mobile design

## 🏗️ Project Structure

```
├── backend/
│   ├── server.js           # Express server (development)
│   ├── package.json
│   └── data/
│       ├── restaurants.json # 6 restaurants
│       ├── menu.json        # 28 menu items
│       └── reviews.json     # Customer reviews
├── frontend/
│   ├── src/
│   │   ├── App.jsx         # Main React component
│   │   ├── main.jsx
│   │   ├── components/
│   │   └── index.css
│   ├── index.html
│   ├── vite.config.js
│   └── package.json
├── ml/                      # ML recommendation system
├── server-production.js     # Production server (all-in-one)
├── Dockerfile              # Docker deployment
└── README.md
```

## 🌐 Deployment

**Docker:**
```bash
docker build -t food-ordering-app .
docker run -p 5000:5000 food-ordering-app
```

**Cloud Platforms:**
- Render: Auto-deploy from GitHub
- Railway: One-click deployment
- Heroku: `git push heroku main`
- Vercel/Netlify: Frontend only

See [START-HERE.md](START-HERE.md) for detailed deployment instructions.

## 🔧 Setup Instructions

### Quick Setup (Production)
```bash
npm install
npm run build
npm start
```

### Development Setup
```bash
# Install all dependencies
npm run install-all

# Start backend
cd backend
npm start

# In another terminal, start frontend
cd frontend
npm run dev
```

## 📡 API Endpoints

- `GET /api/restaurants` - Get all restaurants (6 restaurants)
- `GET /api/restaurants/:id` - Get restaurant by ID
- `GET /api/menu/:restaurantId` - Get menu for restaurant (28 items)
- `POST /api/orders` - Place an order
- `GET /api/orders` - Get all orders
- `GET /api/reviews` - Get customer reviews
- `GET /api/recommendations/:userId` - Get AI recommendations
- `GET /api/trending` - Get trending items
- `GET /api/analytics` - Get analytics data
- `GET /api/ml-insights` - Get ML insights

## 📊 Dataset

The project includes sample data for:
- 6 restaurants (Pizza Palace, Burger House, Sushi Express, Taco Fiesta, Spice Garden, Biryani House)
- 28 menu items with prices, descriptions, and images
- Customer reviews and ratings
- ML-powered recommendations
- Real-time analytics

## 🧪 Testing

```bash
# Test deployment setup
npm run test-deployment

# Test API
curl http://localhost:5000/api/restaurants
```

## 📱 Features in Detail

- **Restaurant Browsing**: View all restaurants with ratings and delivery times
- **Menu System**: Browse items by category with images and descriptions
- **Shopping Cart**: Add/remove items with real-time total calculation
- **Order Placement**: Place orders via app or WhatsApp
- **Real-time Updates**: WebSocket-powered order status tracking
- **Analytics Dashboard**: View order statistics and trends
- **ML Recommendations**: Personalized food suggestions
- **Responsive Design**: Works on desktop, tablet, and mobile

## 🤝 Contributing

Feel free to fork, modify, and use this project for your own food ordering platform!

## 📄 License

MIT License - feel free to use for personal or commercial projects.
