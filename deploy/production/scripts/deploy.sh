#!/bin/bash

set -e

# Variables
ECR_REGISTRY="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
IMAGE_REPO_NAME="todo-app"
COMPOSE_FILE="prod.yml"

echo "Starting deployment..."

# Login to ECR
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $ECR_REGISTRY

# Stop and remove existing containers
echo "Stopping existing containers..."
docker-compose -f $COMPOSE_FILE down --remove-orphans || true

# Remove old images
echo "Cleaning up old images..."
docker image prune -f || true

# Pull latest images
echo "Pulling latest images..."
docker-compose -f $COMPOSE_FILE pull

# Start services
echo "Starting services..."
docker-compose -f $COMPOSE_FILE up -d

# Wait for services to be healthy
echo "Waiting for services to be ready..."
sleep 30

# Run migrations
echo "Running database migrations..."
docker-compose -f $COMPOSE_FILE exec -T web uv run python manage.py migrate

echo "Deployment completed successfully!"