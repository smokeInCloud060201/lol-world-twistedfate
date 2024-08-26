DOCKER_BIN ?= docker
DOCKER_COMPOSE_BIN ?= docker compose
IMAGE_NAME ?= twisted-fate
KUBECTL_BIN ?= kubectl

build-local-image:
	${DOCKER_BIN} build -t ${IMAGE_NAME}:latest ./api

setup:
	${DOCKER_COMPOSE_BIN} -f ./builds/docker-compose.yml up -d

deploy:
	${KUBECTL_BIN} apply -f ./builds/k8s/api.yaml
