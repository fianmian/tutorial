#!/bin/bash
kubectl port-forward deploy/hello-green 9090:5678 &
PID=$!
sleep 2
RESPONSE=$(curl -s http://localhost:9090)
kill $PID

if [[ "$RESPONSE" == "Hello from GREEN" ]]; then
    exit 0
else
    exit 1
fi