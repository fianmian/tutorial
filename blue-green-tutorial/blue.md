# Step 1 - Deploy Blue Version

We’ll start with the **Blue environment**.

Create file blue-deployment.yaml and include this:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-blue
spec:
  replicas: 2
  selector:
    matchLabels:
      app: hello
      version: blue
  template:
    metadata:
      labels:
        app: hello
        version: blue
    spec:
      containers:
      - name: hello
        image: hashicorp/http-echo
        args:
          - "-text=Hello from BLUE"
---
apiVersion: v1
kind: Service
metadata:
  name: hello-service
spec:
  selector:
    app: hello
    version: blue
  ports:
  - port: 80
    targetPort: 5678
```

```bash
kubectl apply -f blue-deployment.yaml
kubectl port-forward svc/hello-service 8080:80 &
curl localhost:8080