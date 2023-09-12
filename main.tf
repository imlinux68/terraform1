terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

# Create a container
resource "docker_container" "hello_nodered" {
  image = docker_image.nodered_image.image_id
  name  = "hello_nodered"
}