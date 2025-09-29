#!/bin/bash

# Path to assets
ASSETS=/root/assets

echo "🚀 Deploying GREEN version..."
kubectl apply -f $ASSETS/green-deployment.yaml

# Wait until all green pods are READY
echo "⏳ Waiting for green pods to be ready..."
kubectl wait --for=condition=Ready pod -l app=hello,version=green --timeout=60s

# Run smoke test
echo "🧪 Running smoke test..."
$ASSETS/smoke-test.sh
SMOKE_RESULT=$?

if [[ $SMOKE_RESULT -eq 0 ]]; then
    echo "✅ Smoke test passed. Switching traffic to GREEN..."
    kubectl patch svc hello-service -p '{"spec":{"selector":{"app":"hello","version":"green"}}}'
    echo "🎉 Traffic now routed to GREEN"

    # Show endpoints for visual confirmation
    kubectl get endpoints hello-service
else
    echo "❌ Smoke test failed. Keeping BLUE active and deleting GREEN pods..."
    kubectl delete deploy hello-green
fi
