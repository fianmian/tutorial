#!/bin/bash

# Smoke test URL (inside the cluster)

echo "🧪 Running smoke test against GREEN pods..."

kubectl port-forward deploy/hello-green 9090:5678 &
PID=$!
sleep 2
RESPONSE=$(curl -s http://localhost:9090)
kill $PID

if [[ "$RESPONSE" == "Hello from GREEN" ]]; then
    echo "✅ Smoke test passed: GREEN deployment is healthy"
    exit 0
else
    echo "❌ Smoke test failed: expected 'Hello from GREEN', got '$RESPONSE'"
    exit 1
fi