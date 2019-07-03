DOCKER_REGISTRY=docker.io
DOCKER_PROJECT_ID=djkormo
SERVICE_NAME=k8s-dep-strat
DOCKER_IMAGE_NAME=$(DOCKER_PROJECT_ID)/${SERVICE_NAME}
DOCKER_IMAGE_REPO_NAME=$(DOCKER_REGISTRY)/$(DOCKER_IMAGE_NAME)

#  build 
docker build -t k8s-dep-strat .
# tag
docker tag k8s-dep-strat djkormo/k8s-dep-strat

#push
docker push  djkormo/k8s-dep-strat
