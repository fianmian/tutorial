If the green deployment would fail, we want to safely rollback to the blue version. 

We want to:
- keep blue deployment running
- remove green deployment
- make sure service points to blue version

Check what pods are running:
```
kubectl get pods -l app=hello
```{{exec}}

Delete green deployment:
```
kubectl delete deploy hello-green
```{{exec}}

Make sure traffic goes to blue deployment:

```
kubectl patch svc hello-service -p '{"spec":{"selector":{"app":"hello","version":"blue"}}}'
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

