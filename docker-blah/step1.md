```index.html```
```
<!DOCTYPE html>
<html>
<head>
    <title>Terraform + Docker Tutorial</title>
</head>
<body>
    <h1>Hello, Terraform + Docker!</h1>
    <p>This web page is served from a Docker container.</p>
</body>
</html>
```

```Dockerfile```

```
# Use Nginx to serve static HTML
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
```

```main.tf```
```
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_network" "app_network" {
  name = "app_network"
}

resource "docker_image" "web" {
  name = "html_web:latest"
  build {
    context = "./web"
  }
}

resource "docker_container" "web" {
  name  = "web"
  image = docker_image.web.image_id
  networks_advanced {
    name = docker_network.app_network.name
  }
  ports {
    internal = 80
    external = 8080
  }
}
```

