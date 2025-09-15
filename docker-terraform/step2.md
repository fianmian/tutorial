### Build Docker image
```
docker build -t html_web:latest .
docker images
```

### Apply Terraform
```
terraform init
terraform apply -auto-approve
```

### Test the web page
```
curl http://localhost:8080
```

### Destroy environment
```
terraform destroy -auto-approve
docker ps
```