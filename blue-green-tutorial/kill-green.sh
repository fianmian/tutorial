#!/bin/bash

# Trigger a rollout of hello-green with a bad image
kubectl set image deployment/hello-green hello-green=hashicorp/http-echo:doesnotexist --record

# Wait until rollout status shows failure
kubectl rollout status deployment/hello-green --timeout=30s || true

echo "⚠️ Simulated failure: hello-green pods now failing (ImagePullBackOff)"
