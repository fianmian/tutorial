# Step 1 - Deploy Blue Version

We’ll start with the **Blue environment**.

Deploy blue:
```bash
kubectl apply -f /root/assets/blue-deployment.yaml
```

Check our blue pods:
```bash
kubectl get pods -l app=hello,version=blue -o wide
```

Check endpoints of our service
```bash
kubectl get endpoints hello-service
```
This should list the blue pods IP addresses

Test:
``` bash
kubectl run -it --rm testpod --image=curlimages/curl --restart=Never -- curl http://hello-service:80
```
This should return **Hello from BLUE**