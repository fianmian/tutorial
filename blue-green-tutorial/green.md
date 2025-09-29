# Step 1 - Deploy Green Version

Let's deploy the **Green environment**.

Create file green-deployment.yaml and include this:
```
# green-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-green
spec:
  replicas: 2
  selector:
    matchLabels:
      app: hello
      version: green
  template:
    metadata:
      labels:
        app: hello
        version: green
    spec:
      containers:
      - name: hello
        image: hashicorp/http-echo
        args:
          - "-text=Hello from GREEN"
```

```bash
kubectl apply -f green-deployment.yaml