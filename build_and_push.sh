#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

IMAGE_NAME="utereskovi/cookie-scraper"
TAG="latest"

echo "🔐 Logging into Docker Hub (if not already logged in)..."
docker login

echo "🔨 Building Docker image (linux/amd64) from root context..."
# Use ".." as the build context so it can see the "GetCookie" folder, 
# and point "-f" to your Dockerfile inside the current subfolder.
docker build --platform linux/amd64 -f Dockerfile -t $IMAGE_NAME:$TAG ..

echo "🏷️ Tagging and pushing Docker image to registry..."
docker push $IMAGE_NAME:$TAG

echo "✅ Successfully built and pushed $IMAGE_NAME:$TAG!"