# Step 3 - Traffic Switch

Switch from blue --> to green:

``` bash
kubectl patch svc hello-service -p '{"spec":{"selector":{"app":"hello","version":"green"}}}'
```

Verify traffic:
``` bash
curl localhost:8080