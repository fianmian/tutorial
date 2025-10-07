# Step 2 - Deploy Green Version

Let's deploy the **Green environment**. We have now decided we want to update our system, so we have created a new version of the system -- the green version. We are now going to deploy this version and later redirect our traffic from the blue version to this new version. 

### Kubernetes File
Let's explore our file `assets/green-deployment.yaml` which is the kubernetes file for the green version. This file defines a **Kubernetes Deployment** which runs two identical containers. The containers run the same kind of web server as the blue version but will respond with the message **"Hello from GREEN"** instead of "Hello from BLUE".

### Deployment

Let's deploy this version and wait until the pods are ready:

```
kubectl apply -f assets/green-deployment.yaml
kubectl wait --for=condition=Ready pod -l app=hello,version=green --timeout=60s
```{{exec}}

Let's check that the green pods are up and running and check their IP addresses:

```
kubectl get pods -l app=hello,version=green -o wide
```{{exec}}