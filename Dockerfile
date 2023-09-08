# Use an official Node.js runtime as the base image
FROM node:latest

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build your React application
RUN npm run build

# Expose the port that your server will run on (adjust if needed)
EXPOSE 3000

# Define the command to start your server
CMD ["node", "server.js"]
