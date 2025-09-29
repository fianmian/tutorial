# Step 3 - Traffic Switch

Switch from blue --> to green:

``` bash
kubectl patch svc hello-service -p '{"spec":{"selector":{"app":"hello","version":"green"}}}'
```

Check the endpoints of our service, should now be green's IP addresses:
``` bash
kubectl get endpoints hello-service
```

Verify traffic:
``` bash
kubectl run -it --rm testpod --image=curlimages/curl --restart=Never -- curl http://hello-service:80
```
should now return **Hello from GREEN**