If the green deployment would fail, we want to safely rollback to the blue version. 

We want to:
- keep blue deployment running
- make sure service points to blue version
- remove green deployment

Check what pods are running:
```
kubectl get pods -l app=hello
```{{exec}}

Make sure traffic goes to blue deployment:

```
kubectl patch svc hello-service -p '{"spec":{"selector":{"app":"hello","version":"blue"}}}'
```{{exec}}

Delete green deployment:
```
kubectl delete deploy hello-green
```{{exec}}

Verify endpoints:
```
kubectl get endpoints hello-service
```{{exec}}

Test that blue is still serving:

```
kcurl http://hello-service:80
```{{exec}}

should return Hello from **BLUE**
