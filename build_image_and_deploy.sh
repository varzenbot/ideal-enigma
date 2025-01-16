#!/bin/bash

set -e  # Exit on any error

# Function to check last command status
check_status() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed"
        exit 1
    fi
}

# Get the latest version from the registry
get_latest_version() {
    local tags
    tags=$(curl -s "http://localhost:5000/v2/hello-web/tags/list" | grep -o '"tags":\[.*\]' | grep -o '"v[0-9]*"' | grep -o '[0-9]*' | sort -n)
    if [ -z "$tags" ]; then
        echo "0"
    else
        echo "$tags" | tail -n1
    fi
}

# Main script
echo "Fetching current version..."
current_version=$(get_latest_version)
next_version=$((current_version + 1))
new_tag="v$next_version"

echo "Building version $new_tag..."

# Build the new image
docker build -t "hello-web:$new_tag" .
check_status "Docker build"

# Tag for local registry
docker tag "hello-web:$new_tag" "localhost:5000/hello-web:$new_tag"
check_status "Docker tag"

# Push to local registry
echo "Pushing to local registry..."
docker push "localhost:5000/hello-web:$new_tag"
check_status "Docker push"

# Update the deployment
echo "Updating deployment..."
kubectl set image deployment/hello-web "hello-web=localhost:5000/hello-web:$new_tag"
check_status "Deployment update"

# Wait for rollout
echo "Waiting for rollout to complete..."
kubectl rollout status deployment/hello-web
check_status "Rollout"

echo "Successfully deployed version $new_tag"

# Optional: Show pod status
echo "Current pod status:"
kubectl get pods -l app=hello-web -o wide
