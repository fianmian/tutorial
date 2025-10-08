### Check pods
Let's check the state of our pods running:
```
kubectl get pods -l app=hello
```{{exec}}

Oh no! It seems there are some problems with our green pods.😭😭

The green deployment seems to have failed, and we want to safely rollback to our blue version.

### Rollback
We want to:
- keep blue deployment running
- make sure service points to blue version
- remove green deployment

Let's first make sure we redirect our service's traffic to the blue deployment:

```
kubectl patch svc hello-service -p '{"spec":{"selector":{"app":"hello","version":"blue"}}}'
```{{exec}}

Now let's delete the green deployment since it doesn't seem to be working anyway:
```
kubectl delete deploy hello-green
```{{exec}}

### Verification
Let's verify the endpoints of our service is now pointing to the green servers:
```
kubectl get endpoints hello-service
```{{exec}}

Let's also test our service:

```
kcurl http://hello-service:80
```{{exec}}

It should return "Hello from **BLUE**".

Now we have safely roll backed to our old "blue" version. 
