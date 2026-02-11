// Production server - serves both frontend and backend
import express from 'express';
import cors from 'cors';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import { createServer } from 'http';
import { Server } from 'socket.io';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const app = express();
const httpServer = createServer(app);
const io = new Server(httpServer, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"]
  }
});

const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// Serve static frontend files
app.use(express.static(join(__dirname, 'frontend/dist')));

// Load data
const restaurants = JSON.parse(readFileSync(join(__dirname, 'backend/data/restaurants.json'), 'utf-8'));
const menu = JSON.parse(readFileSync(join(__dirname, 'backend/data/menu.json'), 'utf-8'));
const reviewsData = JSON.parse(readFileSync(join(__dirname, 'backend/data/reviews.json'), 'utf-8'));

let orders = [];

io.on('connection', (socket) => {
  console.log('Client connected:', socket.id);
  socket.on('disconnect', () => {
    console.log('Client disconnected:', socket.id);
  });
});

// API Routes
app.get('/api/restaurants', (req, res) => {
  console.log('GET /api/restaurants - returning', restaurants.length, 'restaurants');
  res.json(restaurants);
});

app.get('/api/restaurants/:id', (req, res) => {
  const restaurant = restaurants.find(r => r.id === parseInt(req.params.id));
  if (restaurant) {
    res.json(restaurant);
  } else {
    res.status(404).json({ error: 'Restaurant not found' });
  }
});

app.get('/api/menu/:restaurantId', (req, res) => {
  const items = menu.filter(m => m.restaurantId === parseInt(req.params.restaurantId));
  console.log('GET /api/menu/' + req.params.restaurantId + ' - returning', items.length, 'items');
  res.json(items);
});

app.post('/api/orders', (req, res) => {
  const order = {
    id: orders.length + 1,
    ...req.body,
    status: 'pending',
    createdAt: new Date().toISOString()
  };
  orders.push(order);
  
  io.emit('newOrder', order);
  
  setTimeout(() => {
    order.status = 'confirmed';
    io.emit('orderUpdate', order);
  }, 3000);
  
  setTimeout(() => {
    order.status = 'preparing';
    io.emit('orderUpdate', order);
  }, 8000);
  
  setTimeout(() => {
    order.status = 'out for delivery';
    io.emit('orderUpdate', order);
  }, 15000);
  
  res.status(201).json(order);
});

app.get('/api/orders', (req, res) => {
  res.json(orders);
});

app.get('/api/reviews', (req, res) => {
  res.json(reviewsData);
});

app.get('/api/recommendations/:userId', async (req, res) => {
  try {
    const orderCounts = {};
    menu.forEach(item => {
      orderCounts[item.id] = Math.floor(Math.random() * 50) + 10;
    });
    
    const recommended = menu
      .map(item => ({
        ...item,
        orderCount: orderCounts[item.id]
      }))
      .sort((a, b) => b.orderCount - a.orderCount)
      .slice(0, 6);
    
    res.json(recommended);
  } catch (error) {
    res.status(500).json({ error: 'Failed to get recommendations' });
  }
});

app.get('/api/trending', (req, res) => {
  const trending = menu
    .filter(item => item.isBestSeller)
    .slice(0, 4);
  res.json(trending);
});

app.get('/api/ml-insights', (req, res) => {
  const insights = {
    peakTime: '7:00 PM - 9:00 PM',
    popularCuisine: 'Indian',
    avgDeliveryTime: 35,
    satisfaction: 94,
    totalPredictions: 1250,
    accuracy: 87
  };
  res.json(insights);
});

app.get('/api/analytics', (req, res) => {
  const analytics = {
    totalOrders: orders.length + 150,
    totalUsers: 138,
    totalRevenue: 45680,
    avgRating: 4.6,
    topItems: [
      { name: 'Chicken Biryani', orders: 89 },
      { name: 'Butter Chicken', orders: 76 },
      { name: 'Margherita Pizza', orders: 68 },
      { name: 'Classic Burger', orders: 54 },
      { name: 'Pepperoni Pizza', orders: 47 }
    ]
  };
  res.json(analytics);
});

// Serve frontend for all other routes (must be last)
app.use((req, res) => {
  res.sendFile(join(__dirname, 'frontend/dist/index.html'));
});

httpServer.listen(PORT, () => {
  console.log(`
🚀 Production Server Running!
================================
📍 URL: http://localhost:${PORT}
📊 API: http://localhost:${PORT}/api
🍽️  Restaurants: ${restaurants.length}
🍕 Menu Items: ${menu.length}
================================
  `);
});
