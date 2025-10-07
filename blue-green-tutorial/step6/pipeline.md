Now, let's automate the previous steps with a pipeline. Before running this pipeline it is given that our service is already pointing to our **blue version**. Now we want to automate the process of:
1. Deploying our **green version**
2. Perform a **smoke test** on our green version
3. If smoke test pass: switch traffic to the green version. If smoke test fail: delete our deployed green version. 

> **Optional**: If you want to see the failure scenario in action, you can modify the green deployment before running the pipeline by executing:
> ```
> sed -i 's/"-text=Hello from GREEN"/"-text=Hello from GREEN but broken 😈"/' /root/assets/green-deployment.yaml
> ```{{exec}}

These steps are done with the following script. Let's execute it!

```
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
```{{exec}}

Now we have successfully automated the deployment process! Well Done!