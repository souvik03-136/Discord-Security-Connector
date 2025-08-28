#!/bin/bash
ENVIRONMENT=${1:-staging}
echo "Deploying to $ENVIRONMENT environment"

# Pull latest image
docker pull $DOCKERHUB_USERNAME/discord-security-connector:latest

# Stop and remove existing container
docker stop discord-security-connector || true
docker rm discord-security-connector || true

# Run new container
docker run -d \
  --name discord-security-connector \
  -p 8080:8080 \
  --env-file .env \
  $DOCKERHUB_USERNAME/discord-security-connector:latest