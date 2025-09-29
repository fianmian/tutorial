#!/bin/bash

# Smoke test URL (inside the cluster)
URL="http://hello-service:80"

echo "🧪 Running smoke test against GREEN pods..."

# Run curl once from a temporary pod
RESPONSE=$(kubectl run -i --rm testpod --image=curlimages/curl --restart=Never -- curl -s $URL)

if [[ "$RESPONSE" == "Hello from GREEN" ]]; then
    echo "✅ Smoke test passed: GREEN deployment is healthy"
    exit 0
else
    echo "❌ Smoke test failed: expected 'Hello from GREEN', got '$RESPONSE'"
    exit 1
fi