#!/bin/bash
set -euo pipefail

IMAGE="${1:?Usage: deploy.sh <ECR_IMAGE_URI>}"
REGION="us-east-1"
REGISTRY="397303792495.dkr.ecr.us-east-1.amazonaws.com"
CONTAINER="order-service"

echo "Deploying image: $IMAGE"

# Authenticate to ECR
aws ecr get-login-password --region "$REGION" \
  | docker login \
      --username AWS \
      --password-stdin "$REGISTRY"

# Pull the new image before stopping the existing container
docker pull "$IMAGE"

# Remove the previous container if it exists
if docker container inspect "$CONTAINER" >/dev/null 2>&1; then
    docker stop "$CONTAINER" || true
    docker rm "$CONTAINER"
fi

# Start the new container
docker run -d \
  --name "$CONTAINER" \
  --restart unless-stopped \
  -p 8080:8080 \
  "$IMAGE"

# Verify that the container is running
sleep 10

if [ "$(docker inspect -f '{{.State.Running}}' "$CONTAINER")" != "true" ]; then
    echo "Container failed to start"
    docker logs "$CONTAINER" --tail 100
    exit 1
fi

echo "Deployment successful"
docker ps --filter "name=$CONTAINER"
