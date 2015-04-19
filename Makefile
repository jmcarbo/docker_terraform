build:
	docker build -t jmcarbo/terradocker .

run:
	docker run -ti --rm -v "${DOCKER_CERT_PATH}":/docker_cert -e DOCKER_HOST="${DOCKER_HOST}" -e DOCKER_CERT_PATH="/docker_cert" --net host jmcarbo/terradocker /bin/bash

download:
	wget -O terraform.zip https://dl.bintray.com/mitchellh/terraform/terraform_0.4.2_linux_amd64.zip
