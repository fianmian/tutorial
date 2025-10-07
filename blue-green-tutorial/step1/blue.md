# Deploy Blue Version

We’ll start with deploying the **Blue environment**. The blue version is our old/current server. This is a server that we already know is working and that we can go back to if a new version is not working. 

### Kubernetes File
Let's explore our file `assets/blue-deployment.yaml` which is the kubernetes file for the blue version and our service. 
This file defines a **Kubernetes Deployment** which runs two identical containers. The containers run a simple web server what will respond with the message **"Hello from BLUE"**. 
Then we define a **Kubernetes Service** name `hello-service`. It is a network endpoint which will route traffic to any pod with labels `app: hello` and `version: blue`. It listens on port 80 and forwards that traffic to port 5678 on the target pods.

### Deployment
Let's deploy our blue version by running the following. It will run until the pods are ready.  

```
kubectl apply -f /root/assets/blue-deployment.yaml
kubectl wait --for=condition=Ready pod -l app=hello,version=blue --timeout=60s
```{{exec}}

Now our deployment and service should be created and ready to access. But let's check that our two pods are up and running by executing the following command. It should show two separate pods with different IP addresses. 

```
kubectl get pods -l app=hello,version=blue -o wide
```{{exec}}

Now let's check endpoints of our service by running the following command:

```
kubectl get endpoints hello-service
```{{exec}}

This should list the IP addresses of the blue pods. Both should have the **port 5678** as was specified in our file `blue-deployment.yaml`. 

### Test our service
Now let's test our service by running the following command. `kcurl` will work like the normal `curl` command but with a shell alias to work in this tutorial. 

```
kcurl http://hello-service:80
```{{exec}}

This should return **Hello from BLUE**. This means that our service is currently directing to our **Blue server**. Make sure that the blue version is deployed and running correctly before moving on to the next step!