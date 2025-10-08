Let's run a smoke test for the green version in the terminal:
``` bash
kubectl port-forward deploy/hello-green 9090:5678 &
PID=$!
sleep 2
RESPONSE=$(curl -s http://localhost:9090)
kill $PID

if [[ "$RESPONSE" == "Hello from GREEN" ]]; then
  echo "✅ Smoke test passed"
else
  echo "❌ Smoke test failed"
fi
```{{exec}}

This script performs a **smoke test** on our green Kubernetes deployment by:
1. Temporarily opening access to the service by port-forwarding it. 
2. Sending a test HTTP request to it.
3. Verifying that the response says "Hello from GREEN".

By doing this **smoke test** we can:
- Check that the green pod respond as they should (with "Hello from GREEN").
- If successful → proceed to switch traffic.
- If failed → green is deleted, blue continues serving.

Before continuing to the next step, let's make sure that the green pods are running and that they pass the **smoke test**.

### 🔘 Try it out!

<button id="smoke-btn" style="padding: 8px 16px; border-radius: 8px; border: none; background-color: #4CAF50; color: white; cursor: pointer; font-size: 1em;">
🔥 Run Smoke Test
</button>
<span id="smoke-result" style="display: inline-block; width: 2em; height: 1.5em; text-align: center; margin-left: 12px; font-size: 1.8em; vertical-align: middle;"></span>

<script>
document.getElementById('smoke-btn').addEventListener('click', function() {
  const result = document.getElementById('smoke-result');
  result.textContent = '💨';
  let toggle = false;
  let count = 0;
  const interval = setInterval(() => {
    result.textContent = toggle ? '🔥' : '💨';
    toggle = !toggle;
    count++;
    if (count > 10) { // ~3 seconds total
      clearInterval(interval);
      result.textContent = '✅'; // final indicator
    }
  }, 200); // toggle every 0.5s
});
</script>
