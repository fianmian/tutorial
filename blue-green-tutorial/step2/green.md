# Step 2 - Deploy Green Version

Let's deploy the **Green environment**.

Write `cat assets/green-deployment.yaml` to explore the kubernetes file for the green version. Instead of outputting **Hello from BLUE**, this app will output **Hello from GREEN**. 

Deploy green version: `kubectl apply -f assets/green-deployment.yaml`


Make sure the green pods are ready: `kubectl wait --for=condition=Ready pod -l app=hello,version=green --timeout=60s`

Check the IP addresses of the green pods: `kubectl get pods -l app=hello,version=green -o wide`