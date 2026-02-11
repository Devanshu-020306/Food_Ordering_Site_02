# Multi-stage build for production deployment
FROM node:18-alpine AS frontend-build

WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm ci
COPY frontend/ ./
RUN npm run build

FROM node:18-alpine

WORKDIR /app

# Copy root package.json and install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy backend data
COPY backend/data ./backend/data

# Copy production server
COPY server-production.js ./

# Copy built frontend
COPY --from=frontend-build /app/frontend/dist ./frontend/dist

EXPOSE 5000

ENV NODE_ENV=production

CMD ["node", "server-production.js"]
