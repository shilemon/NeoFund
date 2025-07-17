# Use official node image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and install deps
COPY package*.json ./
RUN npm install

# Copy the rest of the code
COPY . .

# Build the React app
RUN npm run build

# Install a simple static file server
RUN npm install -g serve

# Expose the port
EXPOSE 3000

# Start the app
CMD ["serve", "-s", "dist", "-l", "3000"]
