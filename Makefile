GROUP := github.com/TheoBrigitte
NAME := oci-arm-host-capacity
DOCKER_IMAGE := theo01/${NAME}:latest

docker_token=$(DOCKER_TOKEN)

all: docker

docker: docker-image docker-auth docker-push

docker-auth:
	@echo "=> authenticate to docker registry"
	docker login -u theo01 --password "$(docker_token)"
	@echo

docker-image:
	@echo "=> build docker image"
	docker build -t ${DOCKER_IMAGE} .
	@echo

docker-push:
	@echo "=> push docker image"
	docker push ${DOCKER_IMAGE}
	@echo

docker-run: SHELL=/bin/bash
docker-run:
	@docker run \
	    --rm \
	    --env-file <(env|grep -E '(OCI_|TOO_) \
	    ${DOCKER_IMAGE}

.PHONY: docker docker-image docker-push
