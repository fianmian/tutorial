#!/bin/bash

# Patch with a non-existent image using the correct container name (hello)
kubectl set image deployment/hello-green hello=hashicorp/http-echo:doesnotexist --record

# Wait for rollout status (will fail because image doesn't exist)
kubectl rollout status deployment/hello-green --timeout=10s || true

echo "⚠️ Simulated failure: green pods now stuck in ImagePullBackOff"
