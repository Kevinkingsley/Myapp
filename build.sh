#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Define your image name
IMAGE_NAME="my-app"

# Optional: Define the container name
CONTAINER_NAME="my-app-container"

# Build the Docker image
echo "Building Docker image: $IMAGE_NAME..."
docker-compose build

# Stop and remove any existing containers
echo "Stopping and removing existing containers..."
docker-compose down

# Start the containers
echo "Starting containers..."
docker-compose up -d

# Optionally, you can attach logs to see output in the terminal
# docker-compose logs -f

echo "Docker image and container setup complete!"
