#!/bin/bash
kcurl() {
    kubectl run -it --rm testpod --image=curlimages/curl --restart=Never -- \
    curl -s "$@" | grep -v '^pod "testpod" deleted'
}

mkdir -p /root/assets
cd /root/assets

# Create blue deployment YAML
cat > blue-deployment.yaml << 'EOF'
# Blue Deployment
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
# Kubernetes Service
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
  type: ClusterIP

EOF

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
          image: hashicorp/http-echo
          args:
            - "-text=Hello from GREEN"
EOF

# Create smoke test script
cat > smoke-test.sh << 'EOF'
#!/bin/bash

echo "🧪 Running smoke test against GREEN pods..."

kubectl port-forward deploy/hello-green 9090:5678 &
PID=$!
sleep 2
RESPONSE=$(curl -s http://localhost:9090)
kill $PID

if [[ "$RESPONSE" == "Hello from GREEN" ]]; then
    echo "✅ Smoke test passed: GREEN deployment is healthy"
    exit 0
else
    echo "❌ Smoke test failed: expected 'Hello from GREEN', got '$RESPONSE'"
    exit 1
fi
EOF

chmod +x smoke-test.sh
