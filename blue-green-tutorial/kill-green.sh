#!/bin/bash

kubectl delete deploy hello-green
# Patch with a non-existent image using the correct container name
kubectl set image deployment/hello-green hello=hashicorp/http-echo:doesnotexist --record

# Force rollout and show status
kubectl rollout status deployment/hello-green --timeout=10s || true

echo "⚠️ Simulated failure: green pods now stuck in ImagePullBackOff"
