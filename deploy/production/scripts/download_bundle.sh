#!/bin/bash

set -e

echo "Downloading bundle and loading new image..."
cd /home/ubuntu

# Copy imagedefinitions.json
cp /home/ubuntu/app-deploy/imagedefinitions.json .

# Extract image URI
IMAGE_URI=$(jq -r '.[0].imageUri' imagedefinitions.json)

# Pull the new image
docker pull $IMAGE_URI
echo "New image downloaded."