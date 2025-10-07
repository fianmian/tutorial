Since our **smoke test** passes, we can "safely" switch our service from the blue pods to the green ones. 

### Switch Traffic
We switch the traffic with the following command that changes the version the service is running to "green".

```
kubectl patch svc hello-service -p '{"spec":{"selector":{"app":"hello","version":"green"}}}'
```{{exec}}

Now our service should be redirected to our green new servers. 

### Test our service
Now let's check the endpoints of our service, they should now we pointing to green's IP addresses instead of blue's:

```
kubectl get endpoints hello-service
```{{exec}}

Now let's verify that the service responds with **"Hello from GREEN"** now instead of "Hello from BLUE":

```
kcurl http://hello-service:80
```{{exec}}

Before continuing to the next step, make sure you have correctly switched the traffic. 