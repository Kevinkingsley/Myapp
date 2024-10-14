#!/bin/bash

# Set variables
DOCKER_IMAGE="my-app"  # Replace with your Docker image name
DOCKER_REGISTRY="your_docker_registry"  # e.g., yourusername/my-app
REMOTE_USER="your_user"  # Replace with your server username
REMOTE_HOST="your_server_ip_or_domain"  # Replace with your server IP or domain
REMOTE_PORT="22"  # Change if your SSH is on a different port

# Step 1: Login to Docker Registry
echo "Logging in to Docker Registry..."
docker login $DOCKER_REGISTRY

# Step 2: Push the Docker image to the registry
echo "Pushing Docker image to registry..."
docker tag $DOCKER_IMAGE $DOCKER_REGISTRY/$DOCKER_IMAGE
docker push $DOCKER_REGISTRY/$DOCKER_IMAGE

# Step 3: SSH into the remote server and deploy the image
echo "Deploying to remote server..."
ssh -p $REMOTE_PORT $REMOTE_USER@$REMOTE_HOST << EOF
    # Pull the latest image from the Docker registry
    docker pull $DOCKER_REGISTRY/$DOCKER_IMAGE

    # Stop and remove the old container if it exists
    docker stop my-app-container || true
    docker rm my-app-container || true

    # Run a new container from the image
    docker run -d --name my-app-container -p 80:80 $DOCKER_REGISTRY/$DOCKER_IMAGE

    # Optional: Clean up unused images
    docker image prune -f
EOF

echo "Deployment completed successfully!"
