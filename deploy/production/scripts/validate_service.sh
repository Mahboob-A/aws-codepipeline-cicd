#!/bin/bash

set -e

echo "Validating service health..."
# Wait for API container to be healthy
for i in {1..30}; do
  STATUS=$(docker inspect --format='{{.State.Health.Status}}' todo_mysql_prod || echo "")
  if [[ "$STATUS" == "healthy" ]]; then
    break
  fi
  sleep 5
done

# Test Django health endpoint
HTTP_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" http://localhost:8001/health/)

if [[ "$HTTP_CODE" -ne 200 ]]; then
  echo "Health check failed with status $HTTP_CODE"
  exit 1
fi

echo "Service is healthy."
