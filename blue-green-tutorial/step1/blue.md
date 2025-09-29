# Step 1 - Deploy Blue Version

We’ll start with the **Blue environment**.

```bash
kubectl apply -f blue-deployment.yaml
kubectl port-forward svc/hello-service 8080:80 &
curl localhost:8080