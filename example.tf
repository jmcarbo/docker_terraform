# Configure the Docker provider
provider "docker" {
}

# Create a container
resource "docker_container" "foo" {
    image = "${docker_image.ubuntu.latest}"
    name = "foo"
}

resource "docker_image" "ubuntu" {
    name = "ubuntu:latest"
}

output "docker_id" {
    value = "${docker_container.foo.id}"
}

output "docker_name" {
    value = "${docker_container.foo.name}"
}
