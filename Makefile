build:
	docker build -t jmcarbo/terradocker .

run:
	docker run -ti --rm -v "${DOCKER_CERT_PATH}":/docker_cert -e DOCKER_TLS_VERIFY=1 -e DOCKER_HOST="${DOCKER_HOST}" -e DOCKER_CERT_PATH="/docker_cert" --net host jmcarbo/terradocker /bin/bash

download_docker_machine:
	wget -O docker-machine https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-amd64

download_terraform:
	wget -O terraform.zip https://dl.bintray.com/mitchellh/terraform/terraform_0.4.2_linux_amd64.zip
