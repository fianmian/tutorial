# Step 1 - Deploy Blue Version

We’ll start with the **Blue environment**.

Write `cat assets/blue-deployment.yaml` to explore the kubernetes file for the blue version and our service. 

Deploy blue: `kubectl apply -f /root/assets/blue-deployment.yaml`

Check our blue pods: `kubectl get pods -l app=hello,version=blue -o wide`

Check endpoints of our service

`kubectl get endpoints hello-service`

This should list the blue pods IP addresses

Test our service:

`kubectl run -it --rm testpod --image=curlimages/curl --restart=Never -- curl http://hello-service:80`

This should return **Hello from BLUE**