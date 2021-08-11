terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {} # Create a Docker Provider


# resource "docker_image" "nginx" { # Create a Docker Image
#   name = "nginx:alpine"
# }

#resource "docker_container" "my_container" { # Creates a Docker Container
#  image = docker_image.alpine.latest         # Using same image which we created earlier
#  name  = "alp_container"
#}

resource "docker_service" "web" { # Create a Docker Service
  name = "nginx_alpine"
  task_spec {
    container_spec {
      image = "nginx:alpine"  # Using same image which we created eearlier


    }


  }
  mode {
    replicated {
      replicas = 2
    }
  }

  endpoint_spec {
    ports {
      target_port    = "80"
      published_port = "8080"
    }
  }
}

