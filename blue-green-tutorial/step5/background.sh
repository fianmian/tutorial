#!/bin/bash

cd /root/assets

# Create green deployment YAML
# Create green deployment YAML
cat > green-deployment.yaml << 'EOF'
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
          image: nginx:broken
          args:
            - "-text=Hello from GREEN"
EOF

kubectl delete deploy hello-green