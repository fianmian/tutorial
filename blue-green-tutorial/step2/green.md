# Step 1 - Deploy Green Version

Let's deploy the **Green environment**.

```
kubectl apply -f green-deployment.yaml
```

``` bash
kubectl apply -f green-deployment.yaml
```

Make sure the green pods are ready:
``` bash
kubectl wait --for=condition=Ready pod -l app=hello,version=green --timeout=60s
```

Check the IP addresses of the green pods:
``` bash
kubectl get pods -l app=hello,version=green -o wide