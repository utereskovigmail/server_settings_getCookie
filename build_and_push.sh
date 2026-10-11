#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

IMAGE_NAME="utereskovi/cookie-scraper"
TAG="latest"

echo "🔐 Logging into Docker Hub (if not already logged in)..."
docker login

echo "🔨 Building and tagging Docker image via Compose..."
docker compose build

echo "🚀 Pushing Docker image to registry..."
docker push $IMAGE_NAME:$TAG

echo "✅ Successfully built and pushed $IMAGE_NAME:$TAG!"
