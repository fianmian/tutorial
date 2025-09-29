If the green deployment would fail, we want to safely rollback to the blue version. 

We want to:
- keep blue deployment running
- remove green deployment
- make sure service points to blue version

Check what pods are running:
``` bash
kubectl get pods -l app=hello
```

Delete green deployment:
``` bash
kubectl delete deploy hello-green
```

Make sure traffic goes to blue deployment:
``` bash
kubectl patch svc hello-service -p '{"spec":{"selector":{"app":"hello","version":"blue"}}}'
```

Verify endpoints:
``` bash
kubectl get endpoints hello-service
```

Test that blue is still serving:
``` bash
kubectl run -it --rm testpod --image=curlimages/curl --restart=Never -- curl http://hello-service:80
```
should return Hello from **BLUE**

