Run smoke test:
``` bash
#!/bin/bash
kubectl port-forward deploy/hello-green 9090:5678 &
PID=$!
sleep 2
RESPONSE=$(curl -s http://localhost:9090)
kill $PID

if [[ "$RESPONSE" == "Hello from GREEN" ]]; then
  echo "✅ Smoke test passed"
  exit 0
else
  echo "❌ Smoke test failed"
  exit 1
fi
```

- Checks green pod response.
- If successful → proceed to switch traffic.
- If failed → green is deleted, blue continues serving.